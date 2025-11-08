/// Name of Allah model that holds name of Allah with its translation.
class NameOfAllah {
  final int id;
  final String name;
  final String translation;
  final String transliteration;

  const NameOfAllah({
    required this.id,
    required this.name,
    required this.translation,
    required this.transliteration,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is NameOfAllah &&
        other.id == id &&
        other.name == name &&
        other.translation == translation &&
        other.transliteration == transliteration;
  }

  @override
  int get hashCode => Object.hash(id, name, translation, transliteration);

  @override
  String toString() =>
      'NameOfAllah(id: $id, name: $name, translation: $translation, transliteration: $transliteration)';
}
