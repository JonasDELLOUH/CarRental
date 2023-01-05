import 'package:car_rental/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

enum AuthStatus {
  NotLoggedIn,
  LoggedIn,
  Authentificating,
  LoggedOut
}

class AuthProvider extends ChangeNotifier {

  AuthService authService = AuthService();

  AuthStatus _authStatus = AuthStatus.LoggedOut;

  AuthStatus get authStatus => _authStatus;

  set authStatus(AuthStatus authStatus) {
    _authStatus = authStatus;
  }


  loginWithEmail(){
    _authStatus = AuthStatus.Authentificating;
    notifyListeners();
    try {
      authService.signInWithGoogle();
      Fluttertoast.showToast(msg: "login_success".tr);
      _authStatus = AuthStatus.LoggedIn;
      notifyListeners();
      print("C'est maintenant que c'est terminé");

    } catch(e, strace) {
      Fluttertoast.showToast(msg: "login_failed".tr);
      print("error : $e");
      print("this isgggggggggggggggggggggggg strace : $strace");
      _authStatus = AuthStatus.NotLoggedIn;
      notifyListeners();
    }
  }

}