import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mon_site_cv/data/repository/parcours_repository.dart';
import 'package:mon_site_cv/data/repository/parcours_repository_impl.dart';

import '../../core/api/firestore_service.dart';
import '../../core/di/di.dart';

void setupDataModule() {
  getIt.registerLazySingleton<FirebaseFirestore>(
      () => FirebaseFirestore.instance);

  // Pass the FirebaseFirestore instance to the FirestoreService
  getIt.registerLazySingleton<FirestoreService>(
      () => FirestoreService(getIt<FirebaseFirestore>()));

  getIt.registerLazySingleton<ParcoursRepository>(
      () => ParcoursRepositoryImpl(getIt<FirestoreService>()));
}
