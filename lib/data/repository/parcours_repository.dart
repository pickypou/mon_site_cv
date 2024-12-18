import 'package:mon_site_cv/domain/entity/parcours.dart';

abstract class ParcoursRepository {
  Stream<Iterable<Parcours>> getParcoursStream();
  Future<Map<String, dynamic>> getById(String parcoursId);
  Future<void> add(Map<String, dynamic> data);
  Future<void> updateField(
      String parcoursId, String fieldName, String newValue);
}
