import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppModule {
  @singleton
  FirebaseStorage get firebaseStorage => FirebaseStorage.instance;

  @singleton
  FirebaseFirestore get firebaseFirestore => FirebaseFirestore.instance;
}
