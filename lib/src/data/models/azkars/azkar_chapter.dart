/// Azkar Chapter model that holds azkar chapter information.
class AzkarChapter {
  final int id;
  final int categoryId;
  final String name;

  const AzkarChapter({
    required this.id,
    required this.categoryId,
    required this.name,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AzkarChapter &&
        other.id == id &&
        other.categoryId == categoryId &&
        other.name == name;
  }

  @override
  int get hashCode => Object.hash(id, categoryId, name);

  @override
  String toString() =>
      'AzkarChapter(id: $id, categoryId: $categoryId, name: $name)';
}
