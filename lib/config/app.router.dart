// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../models/weather_response_model.dart';
import '../screens/screens.dart';

class Routes {
  static const String login = '/';
  static const String results = '/Results';
  static const all = <String>{
    login,
    results,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.login, page: Login),
    RouteDef(Routes.results, page: Results),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    Login: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const Login(),
        settings: data,
      );
    },
    Results: (data) {
      var args = data.getArgs<ResultsArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => Results(
          key: args.key,
          modelRes: args.modelRes,
        ),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// Results arguments holder class
class ResultsArguments {
  final Key? key;
  final WeatherResponseModel modelRes;
  ResultsArguments({this.key, required this.modelRes});
}
