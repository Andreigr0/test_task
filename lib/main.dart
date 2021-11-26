import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'data/providers/api.dart';
import 'generated/l10n.dart';
import 'router.gr.dart';

void main() {
  runApp(MyApp(appRouter: AppRouter()));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;

  const MyApp({Key? key, required this.appRouter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      /// [Api] should be in [SomeRepository] by design principles, but
      /// in my opinion, there is no need to make a [Repository] until there's
      /// a need of multiple data providers because the only one data provider
      /// could be easily converted to a [Repository] and using a [Repository]
      /// with only one one data provider causes the writing of the same
      /// functions twice
      create: (_) => Api(Dio()),
      child: MaterialApp.router(
        title: 'Flutter Demo',
        theme: ThemeData(primarySwatch: Colors.blue),
        routerDelegate: appRouter.delegate(),
        routeInformationParser: appRouter.defaultRouteParser(
          includePrefixMatches: true,
        ),
        routeInformationProvider: appRouter.routeInfoProvider(),
        localizationsDelegates: const [
          Strings.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: Strings.delegate.supportedLocales,
      ),
    );
  }
}
