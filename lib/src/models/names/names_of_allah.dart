/// Name of Allah model that holds name of Allah with its translation.
class NameOfAllah {
  final int id;
  final String name;
  final String translation;

  const NameOfAllah({
    required this.id,
    required this.name,
    required this.translation,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is NameOfAllah &&
        other.id == id &&
        other.name == name &&
        other.translation == translation;
  }

  @override
  int get hashCode => Object.hash(id, name, translation);

  @override
  String toString() =>
      'NameOfAllah(id: $id, name: $name, translation: $translation)';
}
