import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:mon_site_cv/domain/entity/parcours.dart';

import '../../data/repository/parcours_repository.dart';

@injectable
class FetchParcoursDataUseCase {
  final ParcoursRepository parcoursRepository;

  FetchParcoursDataUseCase(this.parcoursRepository);

  Future<List<Parcours>> getParcours() async {
    try {
      debugPrint("Fetching avis_client data from Firestore...");
      Stream<Iterable<Parcours>> parcoursStream =
          parcoursRepository.getParcoursStream();

      //Utilisez 'await for' pour consommer le stream
      List<Parcours> parcoursList = [];
      await for (var parcoursIterable in parcoursStream) {
        parcoursList.addAll(parcoursIterable);
      }
      return parcoursList;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  Future<Parcours?> getParcoursById(String parcoursId) async {
    try {
      debugPrint("Fetching avis_client data from Firestore...");
      Map<String, dynamic>? avisClientsData =
          await parcoursRepository.getById(parcoursId);
      return Parcours.fromMap(avisClientsData, parcoursId);
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}
