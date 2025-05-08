

import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter/material.dart';
import 'package:mon_site_cv/ui/viewall_module/view_all.dart';

import '../ui_module.dart';

@singleton
class ViewAllModule implements UIModule {
  final AppRouter _appRouter;
  ViewAllModule(this._appRouter);

  @override
  void configure() {
    _appRouter.addRoutes(getRoutes());
  }
  @override
  List<RouteBase> getRoutes()  {
    return [
      GoRoute(
        path: '/',
        builder: (context, state) =>  ViewAll(),
      )
    ];
  }

  @override
  Map<String, WidgetBuilder> getSharedWidgets() {
    // Implémentation de la méthode manquante
    return {};
  }
}