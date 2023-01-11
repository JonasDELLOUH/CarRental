import 'dart:io';

import 'package:car_rental/constants/firestore_constants.dart';
import 'package:car_rental/providers/firestore_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

abstract class BaseServices {
  String collectionName = "";
  static final firestoreInstance = FirebaseFirestore.instance;
  FirestoreProvider firestoreProvider = FirestoreProvider();

  //Storage
  static final storageRef = FirebaseStorage.instance.ref();

  Future<String> addImageToStorage(Reference ref, File file) async {
    UploadTask task = ref.putFile(file);
    TaskSnapshot snapshot = await task.whenComplete(() => null);
    String urlString = await snapshot.ref.getDownloadURL();
    return urlString;
  }

  Future<void> addToFirebase(Map<String, dynamic> map, {File? file, File? file2, File? file3, File? file4}) async {
    try {
      final document = firestoreInstance.collection(collectionName).doc();
      map[FirestoreConstants.id] = document.id;
      if (file != null) {
        final ref = storageRef.child(collectionName).child(document.id);
        final urlString = await addImageToStorage(ref, file);
        map[FirestoreConstants.imageUrl] = urlString;
      }
      if(file2 != null) {
        final ref = storageRef.child(collectionName).child(document.id);
        final urlString = await addImageToStorage(ref, file2);
        map[FirestoreConstants.imageUrl2] = urlString;
      }
      if(file3 != null) {
        final ref = storageRef.child(collectionName).child(document.id);
        final urlString = await addImageToStorage(ref, file3);
        map[FirestoreConstants.imageUrl3] = urlString;
      }
      if(file4 != null) {
        final ref = storageRef.child(collectionName).child(document.id);
        final urlString = await addImageToStorage(ref, file4);
        map[FirestoreConstants.imageUrl4] = urlString;
      }
      await document.set(map);
    } catch (e, strace) {
      print(e);
      print(strace);
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
      } catch (e, strace) {
        print(e);
        print(strace);
      }
    }
  }

  Future<Map<String, dynamic>?> getDataToMap({required String document}) async {
    Map<String, dynamic> map = {};
    DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
        .collection(collectionName)
        .doc(document)
        .get();
    if (documentSnapshot.exists) {
      map = documentSnapshot.data() as Map<String, dynamic>;
      print('Document data: ${documentSnapshot.data()}');
      return map;
    } else {
      print('Document does not exist on the database');
      return null;
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
}
