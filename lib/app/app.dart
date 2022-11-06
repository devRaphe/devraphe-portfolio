import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import '../services/locale_service/locale_service.dart';
import '../services/theme_service/theme_service.dart';
import '../services/url_launcher_service/url_launcher_service.dart';
import '../ui/portfolio_view/portfolio_view.dart';
import '../ui/webview_loader/webview_loader_view.dart';

@StackedApp(
  routes: [
    AdaptiveRoute(page: PortFolioView, initial: true),
    AdaptiveRoute(page: WebViewLoader)
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: UrlLauncherService),
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: LocaleService),
    LazySingleton(classType: ThemeService),
  ],
  logger: StackedLogger(),
)
class AppSetup {
  /* only used to configure application routes and dependency injection */
}
