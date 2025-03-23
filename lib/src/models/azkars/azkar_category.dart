/// Azkar Category model.
class AzkarCategory {
  final int id;
  final String name;

  const AzkarCategory({required this.id, required this.name});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AzkarCategory && other.id == id && other.name == name;
  }

  @override
  int get hashCode => Object.hash(id, name);

  @override
  String toString() => 'AzkarCategory(id: $id, name: $name)';
}
