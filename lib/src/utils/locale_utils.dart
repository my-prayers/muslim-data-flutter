import 'dart:ui';

extension LocaleUtils on Locale {
  /// Converts the [Locale] to a language code string.
  /// For example, Locale('en', 'US') becomes 'en_US'.
  String toCode() {
    final StringBuffer out = StringBuffer(languageCode);
    if (scriptCode != null && scriptCode!.isNotEmpty) {
      out.write('_$scriptCode');
    }
    return out.toString();
  }
}
