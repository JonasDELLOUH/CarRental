import 'dart:async';
import 'dart:io';

import 'package:car_rental/core/utility/functions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../constants/firestore_constants.dart';

abstract class BaseServices {
  String collectionName = "";
  static final firestoreInstance = FirebaseFirestore.instance;

  //Storage
  static final storageRef = FirebaseStorage.instance.ref();

  Future<String> addImageToStorage(Reference ref, File file) async {
    UploadTask task = ref.putFile(file);
    TaskSnapshot snapshot = await task.whenComplete(() => null);
    String urlString = await snapshot.ref.getDownloadURL();
    return urlString;
  }

  Future<void> addToFirebase(Map<String, dynamic> map,
      {File? file, File? file2, File? file3, File? file4}) async {
    try {
      final document = firestoreInstance.collection(collectionName).doc();
      map[FirestoreConstants.id] = document.id;
      if (file != null) {
        final ref = storageRef.child(collectionName).child(document.id);
        final urlString = await addImageToStorage(ref, file);
        map[FirestoreConstants.imageUrl] = urlString;
      }
      if (file2 != null) {
        final ref = storageRef.child(collectionName).child(document.id);
        final urlString = await addImageToStorage(ref, file2);
        map[FirestoreConstants.imageUrl2] = urlString;
      }
      if (file3 != null) {
        final ref = storageRef.child(collectionName).child(document.id);
        final urlString = await addImageToStorage(ref, file3);
        map[FirestoreConstants.imageUrl3] = urlString;
      }
      if (file4 != null) {
        final ref = storageRef.child(collectionName).child(document.id);
        final urlString = await addImageToStorage(ref, file4);
        map[FirestoreConstants.imageUrl4] = urlString;
      }
      await document.set(map);
    } on TimeoutException catch (e, strace) {
      appSnackBar("error", "is_time_out_exception".tr, "");
      print(e);
      print(strace);
    } on SocketException catch (e, strace) {
      appSnackBar("error", "is_socketException".tr, "");
      print(e);
      print(strace);
    } on PlatformException catch (e, strace) {
      appSnackBar("error", "is_platform_exception".tr, "");
      print(e);
      print(strace);
    } on FirebaseException catch (e, strace) {
      appSnackBar("error", "is_firebase_exception".tr, "");
      print(e);
      print(strace);
    } catch (e, strace) {
      print(e);
      print(strace);
    }
  }

  Future<void> updateData(Map<String, dynamic> map, {File? file}) async {
    final document = firestoreInstance
        .collection(collectionName)
        .doc(map[FirestoreConstants.id]);
    try {
      if (file != null) {
        final ref = storageRef.child(collectionName).child(document.id);
        final urlString = await addImageToStorage(ref, file);
        map[FirestoreConstants.imageUrl] = urlString;
      }
      await document.update(map);
      appSnackBar("success", "update_ok".tr, "");
    } on TimeoutException catch (e, strace) {
      appSnackBar("error", "is_time_out_exception".tr, "");
      print(e);
      print(strace);
    } on SocketException catch (e, strace) {
      appSnackBar("error", "is_socketException".tr, "");
      print(e);
      print(strace);
    } on PlatformException catch (e, strace) {
      appSnackBar("error", "is_platform_exception".tr, "");
      print(e);
      print(strace);
    } on FirebaseException catch (e, strace) {
      appSnackBar("error", "is_firebase_exception".tr, "");
      print(e);
      print(strace);
    } catch (e, strace) {
      print(e);
      print(strace);
    }
  }

  Future<Map<String, dynamic>?> getDocumentToMap(
      {String document = "",
      String whereValue = "",
      String whereField = ""}) async {
    Map<String, dynamic> map = {};
    DocumentSnapshot documentSnapshot;
    if (whereField.isNotEmpty && whereValue.isNotEmpty) {
      try {
        QuerySnapshot<Map<String, dynamic>> querySnapshot =
            await FirebaseFirestore.instance
                .collection(collectionName)
                .where(whereField, isEqualTo: whereValue)
                .get();
        map = querySnapshot.docs.first.data();
      } catch (e, strace) {
        print("the error: $e");
        print("his strace : $strace");
      }
      return map;
    } else {
      try {
        documentSnapshot = await FirebaseFirestore.instance
            .collection(collectionName)
            .doc(document)
            .get();
        if (documentSnapshot.exists) {
          map = documentSnapshot.data() as Map<String, dynamic>;
          print('Document data: ${documentSnapshot.data()}');
          return map;
        } else {
          print('Document does not exist on the database');
          return {};
        }
      } on TimeoutException catch (e, strace) {
        appSnackBar("error", "is_time_out_exception".tr, "");
        print(e);
        print(strace);
      } on SocketException catch (e, strace) {
        appSnackBar("error", "is_socketException".tr, "");
        print(e);
        print(strace);
      } on PlatformException catch (e, strace) {
        appSnackBar("error", "is_platform_exception".tr, "");
        print(e);
        print(strace);
      } on FirebaseException catch (e, strace) {
        appSnackBar("error", "is_firebase_exception".tr, "");
        print(e);
        print(strace);
      } catch (e, strace) {
        print(e);
        print(strace);
      }
    }
    return null;
  }

  // List<Object? Function()> documentsToMapList(QuerySnapshot querySnapshot) {
  //   return querySnapshot.docs.map((documentSnapshot) {
  //     return documentSnapshot.data;
  //   }).toList();
  // }

  Future<List> getCollectionToMap(
      {String fieldName = "", dynamic value}) async {
    List datas = [];
    QuerySnapshot querySnapshot;
    try {
      if (fieldName.isNotEmpty) {
        querySnapshot = await FirebaseFirestore.instance
            .collection(collectionName)
            .where(fieldName, isEqualTo: value)
            .get();
      } else {
        querySnapshot =
            await FirebaseFirestore.instance.collection(collectionName).get();
      }

      for (final DocumentSnapshot documentSnapshot in querySnapshot.docs) {
        datas.add(documentSnapshot.data() as Map<String, dynamic>);
      }
    } on TimeoutException catch (e, strace) {
      appSnackBar("error", "is_time_out_exception".tr, "");
      print(e);
      print(strace);
    } on SocketException catch (e, strace) {
      appSnackBar("error", "is_socketException".tr, "");
      print(e);
      print(strace);
    } on PlatformException catch (e, strace) {
      appSnackBar("error", "is_platform_exception".tr, "");
      print(e);
      print(strace);
    } on FirebaseException catch (e, strace) {
      appSnackBar("error", "is_firebase_exception".tr, "");
      print(e);
      print(strace);
    } catch (e, strace) {
      print(e);
      print(strace);
    }
    return datas;
  }

  Future<void> addToFirebaseWithId(Map<String, dynamic> map, String id,
      {File? file, File? file2, File? file3, File? file4}) async {
    try {
      DocumentReference document =
          firestoreInstance.collection(collectionName).doc(id);
      map[FirestoreConstants.id] = id;
      if (file != null) {
        final ref = storageRef.child(collectionName).child(document.id);
        final urlString = await addImageToStorage(ref, file);
        map[FirestoreConstants.imageUrl] = urlString;
      }
      if (file2 != null) {
        final ref = storageRef.child(collectionName).child(document.id);
        final urlString = await addImageToStorage(ref, file2);
        map[FirestoreConstants.imageUrl2] = urlString;
      }
      if (file3 != null) {
        final ref = storageRef.child(collectionName).child(document.id);
        final urlString = await addImageToStorage(ref, file3);
        map[FirestoreConstants.imageUrl3] = urlString;
      }
      if (file4 != null) {
        final ref = storageRef.child(collectionName).child(document.id);
        final urlString = await addImageToStorage(ref, file4);
        map[FirestoreConstants.imageUrl4] = urlString;
      }
      await document.set(map);
    } on TimeoutException catch (e, strace) {
      appSnackBar("error", "is_time_out_exception".tr, "");
      print(e);
      print(strace);
    } on SocketException catch (e, strace) {
      appSnackBar("error", "is_socketException".tr, "");
      print(e);
      print(strace);
    } on PlatformException catch (e, strace) {
      appSnackBar("error", "is_platform_exception".tr, "");
      print(e);
      print(strace);
    } on FirebaseException catch (e, strace) {
      appSnackBar("error", "is_firebase_exception".tr, "");
      print(e);
      print(strace);
    } catch (e, strace) {
      print(e);
      print(strace);
    }
  }

  Stream<QuerySnapshot> getCollectionStream() {
    Stream<QuerySnapshot> collectionStream =
        FirebaseFirestore.instance.collection(collectionName).snapshots();
    return collectionStream;
  }

  Stream<DocumentSnapshot<Object?>> getDocumentStream(
      {required String documentId}) {
    Stream<DocumentSnapshot> collectionStream = FirebaseFirestore.instance
        .collection(collectionName)
        .doc(documentId)
        .snapshots();
    return collectionStream;
  }

  Future<bool> isExist(String fieldName, dynamic value) async {
    bool exists = false;
    try {
      final QuerySnapshot<Map<String, dynamic>> result = await FirebaseFirestore
          .instance
          .collection(collectionName)
          .where(fieldName, isEqualTo: value)
          .limit(1)
          .get();
      if (result.docs.isNotEmpty) {
        exists = true;
      }
    } on TimeoutException catch (e, strace) {
      appSnackBar("error", "is_time_out_exception".tr, "");
      print(e);
      print(strace);
    } on SocketException catch (e, strace) {
      appSnackBar("error", "is_socketException".tr, "");
      print(e);
      print(strace);
    } on PlatformException catch (e, strace) {
      appSnackBar("error", "is_platform_exception".tr, "");
      print(e);
      print(strace);
    } on FirebaseException catch (e, strace) {
      appSnackBar("error", "is_firebase_exception".tr, "");
      print(e);
      print(strace);
    } catch (e, strace) {
      print(e);
      print(strace);
    }
    return exists;
  }
}
