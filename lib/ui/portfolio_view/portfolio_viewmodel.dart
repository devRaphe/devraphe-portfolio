import 'package:devraphe/services/base/faliure.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../app/app.locator.dart';
import '../../app/app.logger.dart';
import '../../app/app.router.dart';
import '../../services/locale_service/locale_service.dart';
import '../../services/url_launcher_service/url_launcher_service.dart';

class PortFolioViewModel extends ReactiveViewModel {
  final _navigationService = locator<NavigationService>();
  final _urlLuauncherService = locator<UrlLauncherService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _localeService = locator<LocaleService>();
  final _log = getLogger('PortFolioViewModel');

  void navigateToWebView({required String url, required String title}) {
    _navigationService.navigateTo(Routes.webViewLoader,
        arguments: WebViewLoaderArguments(
          title: title,
          url: url,
        ));
  }

  Locale get locale =>
      _localeService.locale ??
      const Locale(
        'en',
      );

  void setLocale(Locale locale) {
    try {
      _localeService.setLocale(locale);
    } on Failure catch (e) {
      _log.e(e.devMessage);
      _bottomSheetService.showBottomSheet(
          title: 'Error', description: e.prettyMessage);
    }
  }

  Future dialMyNumber(String phoneNumber) async {
    try {
      await _urlLuauncherService.launchPhone(phoneNumber);
    } on Failure catch (e) {
      _log.e(e.devMessage);
      _bottomSheetService.showBottomSheet(
          title: 'An error occured', description: e.devMessage);
    }
  }

  Future emailMe(String email) async {
    try {
      await _urlLuauncherService.launchEmail(email);
    } on Failure catch (e) {
      _log.e(e.devMessage);
      _bottomSheetService.showBottomSheet(
          title: 'An error occured', description: e.devMessage);
    }
  }

  final icons = [
    FontAwesomeIcons.github,
    FontAwesomeIcons.twitter,
    FontAwesomeIcons.linkedinIn,
  ];

  final title = [
    'My GitHub',
    'My Twitter',
    'My LinkedIn',
  ];

  final links = [
    'https://github.com/devraphe',
    'https://twitter.com/intent/follow?screen_name=devraphe',
    'https://www.linkedin.com/in/etiabasi-ezekiel/',
  ];

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_localeService];
}
