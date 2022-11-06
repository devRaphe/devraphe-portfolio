import 'package:devraphe/l10n/l10n.dart';
import 'package:devraphe/services/base/faliure.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class LocaleService with ReactiveServiceMixin {
  Locale? _locale;
  Locale? get locale => _locale;
  void setLocale(Locale locale) {
    try {
      if (!L10n.all.contains(locale)) return;
      _locale = locale;
      notifyListeners();
    } catch (e, s) {
      throw Failure(
          devMessage: e.toString() + s.toString(),
          prettyMessage: 'Unable to change your language');
    }
  }

  void clearLocale() {
    _locale = null;
    notifyListeners();
  }
}
