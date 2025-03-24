/// Languages that available for muslim data.
enum Language {
  en('en'), // English
  ar('ar'), // Arabic
  ckb('ckb'), // Central Kurdish
  ckbBadini('ckb_BADINI'), // Central Kurdish (Badini)
  fa('fa'), // Persian
  ru('ru'); // Russian

  const Language(this.value);

  final String value;
}
