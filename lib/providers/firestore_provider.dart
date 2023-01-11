
import 'package:flutter/material.dart';

enum FirestoreStatus{
  getting,
  nothing,
  got,
  noData,
  error
}

class FirestoreProvider extends ChangeNotifier {
   FirestoreStatus _firestoreStatus = FirestoreStatus.nothing;

  FirestoreStatus get firestoreStatus => _firestoreStatus;

  set firestoreStatus(FirestoreStatus value) {
    _firestoreStatus = value;
  }

  notify() {
    notifyListeners();
  }
}