import 'package:get_it/get_it.dart';
import 'package:mon_site_cv/domain/entity/parcours.dart';

final GetIt getIt = GetIt.instance;

void setupEntityModule() {
  getIt.registerFactory<Parcours>(() => Parcours(
        id: '', // Provide a default or generate a unique ID
        title: '', // Provide default title or an empty list
        text: '', // Provide a default text
      ));
}
