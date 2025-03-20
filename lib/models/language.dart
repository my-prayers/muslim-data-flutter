/// Languages that available for muslim data.
enum Language {
  en, // English
  ar, // Arabic
  ckb, // Central Kurdish
  ckbBadini, // Central Kurdish (Badini)
  fa, // Persian
  ru, // Russian
}

/// Language extension to get the value of the language.
extension LanguageExtension on Language {
  String get value {
    if (this == Language.ckbBadini) {
      return 'ckb_BADINI';
    }
    return name;
  }
}
