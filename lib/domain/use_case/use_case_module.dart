import 'package:get_it/get_it.dart';
import 'package:mon_site_cv/data/repository/parcours_repository_impl.dart';
import 'package:mon_site_cv/domain/use_case/fetch_parcour_data_use_case.dart';

final GetIt getIt = GetIt.instance;

void setupUseCaseModule() {
  getIt.registerLazySingleton<FetchParcoursDataUseCase>(
      () => FetchParcoursDataUseCase(getIt<ParcoursRepositoryImpl>()));
  if (getIt.isRegistered<FetchParcoursDataUseCase>()) {
    getIt.unregister<FetchParcoursDataUseCase>();
  }
}
