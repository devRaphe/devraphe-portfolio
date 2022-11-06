import 'package:devraphe/l10n/l10n.dart';
import 'package:devraphe/utilities/theme/port_folio_theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:stacked/stacked.dart';

import 'package:stacked_services/stacked_services.dart';

import 'app/app.locator.dart';
import 'app/app.router.dart';
import 'services/locale_service/locale_service.dart';
import 'services/theme_service/theme_service.dart';

void main() async {
  await setupLocator();

  runApp(const PorfolioView());
}

class PorfolioView extends StatelessWidget {
  const PorfolioView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return ViewModelBuilder.reactive(
          viewModelBuilder: () => PortfolioViewModel(),
          builder: (context, model, child) {
            return MaterialApp(
              title: 'PortFolio App',
              theme: PortFolioTheme.lightTheme,
              darkTheme: PortFolioTheme.darkTheme,
              // themeMode: model?.isDarkMode? ThemeMode.dark:ThemeMode.light,
              onGenerateRoute: StackedRouter().onGenerateRoute,
              navigatorKey: StackedService.navigatorKey,
              debugShowCheckedModeBanner: false,
              locale: model.locale,
              supportedLocales: L10n.all,
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
            );
          },
        );
      },
    );
  }
}

class PortfolioViewModel extends ReactiveViewModel {
  final _localeService = locator<LocaleService>();
  final _themeService = locator<ThemeService>();

  Locale get locale =>
      _localeService.locale ??
      const Locale(
        'en',
      );

  bool? get isDarkMode => _themeService.isDarkMode;

  @override
  List<ReactiveServiceMixin> get reactiveServices =>
      [_localeService, _themeService];
}
