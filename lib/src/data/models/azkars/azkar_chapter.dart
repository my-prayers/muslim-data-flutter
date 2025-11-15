/// Azkar Chapter model that holds azkar chapter information.
class AzkarChapter {
  final int id;
  final int categoryId;
  final String categoryName;
  final String name;

  const AzkarChapter({
    required this.id,
    required this.categoryId,
    required this.categoryName,
    required this.name,
  });

  /// Creates a copy of the current AzkarChapter with optional new values.
  AzkarChapter copyWith({
    int? id,
    int? categoryId,
    String? categoryName,
    String? name,
  }) {
    return AzkarChapter(
      id: id ?? this.id,
      categoryId: categoryId ?? this.categoryId,
      categoryName: categoryName ?? this.categoryName,
      name: name ?? this.name,
    );
  }

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
