// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:devraphe/ui/portfolio_view/portfolio_view.dart' as _i2;
import 'package:devraphe/ui/webview_loader/webview_loader_view.dart' as _i3;
import 'package:flutter/material.dart' as _i4;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i5;

class Routes {
  static const portFolioView = '/';

  static const webViewLoader = '/web-view-loader';

  static const all = <String>{
    portFolioView,
    webViewLoader,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.portFolioView,
      page: _i2.PortFolioView,
    ),
    _i1.RouteDef(
      Routes.webViewLoader,
      page: _i3.WebViewLoader,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.PortFolioView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i2.PortFolioView(),
        settings: data,
      );
    },
    _i3.WebViewLoader: (data) {
      final args = data.getArgs<WebViewLoaderArguments>(nullOk: false);
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) =>
            _i3.WebViewLoader(key: args.key, title: args.title, url: args.url),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;
  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class WebViewLoaderArguments {
  const WebViewLoaderArguments({
    this.key,
    required this.title,
    required this.url,
  });

  final _i4.Key? key;

  final String title;

  final String url;
}

extension NavigatorStateExtension on _i5.NavigationService {
  Future<dynamic> navigateToPortFolioView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.portFolioView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToWebViewLoader({
    _i4.Key? key,
    required String title,
    required String url,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.webViewLoader,
        arguments: WebViewLoaderArguments(key: key, title: title, url: url),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
