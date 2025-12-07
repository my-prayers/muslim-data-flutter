import 'dart:ui';

/// Languages that available for muslim data.
enum Language {
  en(Locale('en')),
  ar(Locale('ar')),
  ckb(Locale('ckb')),
  ckbBadini(
    // Central Kurdish (Badini)
    Locale.fromSubtags(
      languageCode: 'ckb',
      scriptCode: 'Badini',
      countryCode: 'IQ',
    ),
  ),
  fa(Locale('fa')),
  ru(Locale('ru'));

  const Language(this.locale);

  final Locale locale;

  /// Returns the corresponding [Language] for the given locale.
  ///
  /// Matching priority:
  /// 1. Exact match (languageCode + scriptCode)
  /// 2. Language code match only
  /// 3. English as default
  static Language fromLocale(Locale? locale) {
    const defaultLanguage = Language.en;
    // Return default language if locale is null
    if (locale == null) {
      return defaultLanguage;
    }

    // First, try to find exact match (languageCode + scriptCode)
    final exactMatch = Language.values.firstWhere(
      (language) => language.locale == locale,
      orElse: () => defaultLanguage,
    );

    // Return exact match if found, or if the locale is English
    if (exactMatch != defaultLanguage || locale.languageCode == 'en') {
      return exactMatch;
    }

    // If no exact match, try to match by languageCode only
    return Language.values.firstWhere(
      (language) => language.locale.languageCode == locale.languageCode,
      orElse: () => defaultLanguage,
    );
  }

  /// List of supported locales.
  static List<Locale> get supportedLocales =>
      Language.values.map((e) => e.locale).toList();
}
