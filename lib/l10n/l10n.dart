import 'dart:ui';

class L10n {
  static final all = [
    const Locale(
      'en',
    ),
    const Locale(
      'fr',
    )
  ];

  static String getLanguageFlag(String language) {
    switch (language) {
      case 'en':
        return '🇬🇧';
      case 'fr':
        return '🇫🇷';
      default:
        return '🇬🇧';
    }
  }
}
