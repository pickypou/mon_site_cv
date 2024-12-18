import 'package:mon_site_cv/domain/use_case/use_case_module.dart';

import 'entity/entity_module.dart';

void setupDomainModule() {
  // Setup des entités
  setupEntityModule();

  //Setupt des Use Case

  setupUseCaseModule();
}
