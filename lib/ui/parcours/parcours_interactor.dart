import 'package:flutter/material.dart';
import 'package:mon_site_cv/data/repository/parcours_repository.dart';
import 'package:mon_site_cv/domain/entity/parcours.dart';

import '../../domain/use_case/fetch_parcour_data_use_case.dart';

class ParcoursInteractor {
  final FetchParcoursDataUseCase fetchParcoursDataUseCase;
  final ParcoursRepository parcoursRepository;

  ParcoursInteractor(this.parcoursRepository, this.fetchParcoursDataUseCase);
  Future<Iterable<Parcours>> fetchAvisClientsData() async {
    try {
      final parcours = await fetchParcoursDataUseCase.getParcours();
      return parcours;
    } catch (e) {
      debugPrint('Erreur lors du récupération des avis clients : $e');
      rethrow;
    }
  }

  Future<void> addAvisClients(Parcours parcours) async {
    try {
      await parcoursRepository.add({
        'categories': parcours.title,
        'text': parcours.text,
      });
    } catch (error) {
      debugPrint('Erreur lors de l\'ajout de l\'avis du client: $error');
      rethrow;
    }
  }
}
