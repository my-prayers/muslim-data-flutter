/// Prayer calculation methods.
enum CalculationMethod {
  makkah, // Umm al-Qura, Makkah
  mwl, // Muslim World League (MWL)
  isna, // Islamic Society of North America (ISNA)
  karachi, // University of Islamic Sciences, Karachi
  egypt, // Egyptian General Authority of Survey
  jafari, // Ithna Ashari
  tehran, // Institute of Geophysics, University of Tehran
  custom; // Custom Setting

  static Map<CalculationMethod, List<double>> methodList() {
    return {
      CalculationMethod.makkah: [18.5, 1.0, 0.0, 1.0, 90.0],
      CalculationMethod.mwl: [18.0, 1.0, 0.0, 0.0, 17.0],
      CalculationMethod.isna: [15.0, 1.0, 0.0, 0.0, 15.0],
      CalculationMethod.karachi: [18.0, 1.0, 0.0, 0.0, 18.0],
      CalculationMethod.egypt: [19.5, 1.0, 0.0, 0.0, 17.5],
      CalculationMethod.jafari: [16.0, 0.0, 4.0, 0.0, 14.0],
      CalculationMethod.tehran: [17.7, 0.0, 4.5, 0.0, 14.0],
      CalculationMethod.custom: [18.0, 1.0, 0.0, 0.0, 17.0],
    };
  }
}
