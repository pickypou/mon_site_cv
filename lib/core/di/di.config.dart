// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i974;
import 'package:firebase_storage/firebase_storage.dart' as _i457;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../ui/ui_module.dart' as _i573;
import '../../ui/viewall_module/view_all_module.dart' as _i422;
import '../api/firestore_service.dart' as _i551;
import '../api/storage_service.dart' as _i1042;
import '../router/router_config.dart' as _i718;
import 'di_module.dart' as _i211;

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt init(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final appModule = _$AppModule();
  gh.singleton<_i457.FirebaseStorage>(() => appModule.firebaseStorage);
  gh.singleton<_i974.FirebaseFirestore>(() => appModule.firebaseFirestore);
  gh.singleton<_i718.AppRouterConfig>(() => _i718.AppRouterConfig());
  gh.singleton<_i573.AppRouter>(() => _i573.AppRouter());
  gh.factory<_i551.FirestoreService>(
      () => _i551.FirestoreService(gh<_i974.FirebaseFirestore>()));
  gh.factory<_i1042.StorageService>(
      () => _i1042.StorageService(gh<_i457.FirebaseStorage>()));
  gh.singleton<_i422.ViewAllModule>(
      () => _i422.ViewAllModule(gh<_i573.AppRouter>()));
  return getIt;
}

class _$AppModule extends _i211.AppModule {}
