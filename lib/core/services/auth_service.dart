import 'package:car_rental/core/constants/firestore_constants.dart';
import 'package:car_rental/core/services/member_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';

import '../utility/show_otp_dialog.dart';

class AuthService {
  final _authInstance = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  MemberServices memberServices = MemberServices();

  User get user => _authInstance.currentUser!;

  //Connexion
  Future<String?> signInEmailPassword(String mail, String pwd) async {
    final userCredential = await _authInstance.signInWithEmailAndPassword(
        email: mail, password: pwd);
    final User? user = userCredential.user;

    return user!.uid;
  }

  //Création user
  Future<String?> createUser(
      {required String email,
      required String password,
      required String fullName,
      required String phoneNumber}) async {
    final userCredential = await _authInstance.createUserWithEmailAndPassword(
        email: email, password: password);
    final User? user = userCredential.user;
    if (user != null) {
      Map<String, dynamic> map = {
        FirestoreConstants.memberFullName: fullName,
        FirestoreConstants.memberEmail: userCredential.user!.email ?? "",
        FirestoreConstants.memberPhoneNumber: phoneNumber,
        FirestoreConstants.id: userCredential.user!.uid,
      };
      memberServices.addToFirebaseWithId(map, userCredential.user!.uid);
    }

    return user!.uid;
  }

  Future<String?> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
    final UserCredential userCredential =
        await _authInstance.signInWithCredential(credential);
    final AdditionalUserInfo? additionalUserInfo =
        userCredential.additionalUserInfo;
    if (additionalUserInfo!.isNewUser) {
      Map<String, dynamic> map = {
        FirestoreConstants.memberFullName:
            userCredential.user!.displayName ?? "",
        FirestoreConstants.memberEmail: userCredential.user!.email ?? "",
        FirestoreConstants.memberPhoneNumber:
            userCredential.user!.phoneNumber ?? "",
        FirestoreConstants.id: userCredential.user!.uid,
      };
      memberServices.addToFirebaseWithId(map, userCredential.user!.uid);
    }
    return userCredential.user!.uid;
  }

  Future<void> signInWithFacebook() async {
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();

      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);

      await _authInstance.signInWithCredential(facebookAuthCredential);
    } on FirebaseAuthException catch (e) {}
  }

  Future<void> signInAnonymously(BuildContext context) async {
    try {
      await _authInstance.signInAnonymously();
    } on FirebaseAuthException catch (e) {
      // showSnackBar(context, e.message!); // Displaying the error message
    }
  }

  Future<void> phoneSignIn(
    BuildContext context,
    String phoneNumber,
  ) async {
    TextEditingController codeController = TextEditingController();
    if (kIsWeb) {
      // !!! Works only on web !!!
      ConfirmationResult result =
          await _authInstance.signInWithPhoneNumber(phoneNumber);

      // Diplay Dialog Box To accept OTP
      showOTPDialog(
        codeController: codeController,
        context: context,
        onPressed: () async {
          PhoneAuthCredential credential = PhoneAuthProvider.credential(
            verificationId: result.verificationId,
            smsCode: codeController.text.trim(),
          );

          await _authInstance.signInWithCredential(credential);
          Navigator.of(context).pop(); // Remove the dialog box
        },
      );
    } else {
      // FOR ANDROID, IOS
      await _authInstance.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        //  Automatic handling of the SMS code
        verificationCompleted: (PhoneAuthCredential credential) async {
          // !!! works only on android !!!
          await _authInstance.signInWithCredential(credential);
        },
        // Displays a message when verification fails
        verificationFailed: (e) {
          // showSnackBar(context, e.message!);
        },
        // Displays a dialog box when OTP is sent
        codeSent: ((String verificationId, int? resendToken) async {
          showOTPDialog(
            codeController: codeController,
            context: context,
            onPressed: () async {
              PhoneAuthCredential credential = PhoneAuthProvider.credential(
                verificationId: verificationId,
                smsCode: codeController.text.trim(),
              );

              // !!! Works only on Android, iOS !!!
              await _authInstance.signInWithCredential(credential);
              Navigator.of(context).pop(); // Remove the dialog box
            },
          );
        }),
        codeAutoRetrievalTimeout: (String verificationId) {
          // Auto-resolution timed out...
        },
      );
    }
  }

  Future<void> signOut() async {
    try {
      await _authInstance.signOut();
    } on FirebaseAuthException catch (e) {}
  }

  Future<void> deleteAccount(BuildContext context) async {
    try {
      await _authInstance.currentUser!.delete();
    } on FirebaseAuthException catch (e) {
      // showSnackBar(context, e.message!); // Displaying the error message
      // if an error of requires-recent-login is thrown, make sure to log
      // in user again and then delete account.
    }
  }
}
