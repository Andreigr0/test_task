// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;

import 'data/models/repo.dart' as _i5;
import 'presentation/repo_details/repos_details_page.dart' as _i2;
import 'presentation/repos_list/repos_list_page.dart' as _i1;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    ReposListRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.ReposListPage());
    },
    RepoDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<RepoDetailsRouteArgs>();
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData,
          child:
              _i2.RepoDetailsPage(key: args.key, repository: args.repository));
    }
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(ReposListRoute.name, path: '/'),
        _i3.RouteConfig(RepoDetailsRoute.name,
            path: '/repo/:id', usesPathAsKey: true)
      ];
}

/// generated route for [_i1.ReposListPage]
class ReposListRoute extends _i3.PageRouteInfo<void> {
  const ReposListRoute() : super(name, path: '/');

  static const String name = 'ReposListRoute';
}

/// generated route for [_i2.RepoDetailsPage]
class RepoDetailsRoute extends _i3.PageRouteInfo<RepoDetailsRouteArgs> {
  RepoDetailsRoute({_i4.Key? key, required _i5.Repo repository})
      : super(name,
            path: '/repo/:id',
            args: RepoDetailsRouteArgs(key: key, repository: repository));

  static const String name = 'RepoDetailsRoute';
}

class RepoDetailsRouteArgs {
  const RepoDetailsRouteArgs({this.key, required this.repository});

  final _i4.Key? key;

  final _i5.Repo repository;

  @override
  String toString() {
    return 'RepoDetailsRouteArgs{key: $key, repository: $repository}';
  }
}
