import 'package:injectable/injectable.dart';
import 'package:mon_site_cv/data/repository/parcours_repository.dart';
import 'package:mon_site_cv/domain/entity/parcours.dart';

import '../../core/api/firestore_service.dart';

@Injectable(as: ParcoursRepository)
class ParcoursRepositoryImpl extends ParcoursRepository {
  final FirestoreService _firestore;

  ParcoursRepositoryImpl(this._firestore);

  @override
  Stream<Iterable<Parcours>> getParcoursStream() {
    return _firestore.collection('parcours').snapshots().map(
          (querySnapshot) => querySnapshot.docs
              .map((doc) => Parcours.fromMap(doc.data(), doc.id))
              .toList(),
        );
  }

  @override
  Future<Map<String, dynamic>> getById(String parcoursId) async {
    final docSnapshot =
        await _firestore.collection('parcours').doc(parcoursId).get();
    return docSnapshot.data() ?? {};
  }

  @override
  Future<void> add(Map<String, dynamic> data) async {
    await _firestore.collection('parcours').add(data);
  }

  @override
  Future<void> updateField(
      String parcoursId, String fieldName, String newValue) async {
    await _firestore
        .collection('parcours')
        .doc(parcoursId)
        .update({fieldName: newValue});
  }
}
