import 'package:stacked/stacked.dart';

class ThemeService with ReactiveServiceMixin {
  bool? _isDarkMode;
  bool? get isDarkMode => _isDarkMode;
  void toggleDarkMode() {
    _isDarkMode = false;
    _isDarkMode = !_isDarkMode!;
    notifyListeners();
  }
}
