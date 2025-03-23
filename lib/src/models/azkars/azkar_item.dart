/// Azkar Item model that holds azkar item information.
class AzkarItem {
  final int id;
  final int chapterId;
  final String item;
  final String translation;
  final String reference;

  AzkarItem({
    required this.id,
    required this.chapterId,
    required this.item,
    required this.translation,
    required this.reference,
  });

  // Equality operator override
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AzkarItem &&
        other.id == id &&
        other.chapterId == chapterId &&
        other.item == item &&
        other.translation == translation &&
        other.reference == reference;
  }

  @override
  int get hashCode {
    return Object.hash(id, chapterId, item, translation, reference);
  }

  @override
  String toString() {
    return 'AzkarItem(id: $id, chapterId: $chapterId, item: $item, translation: $translation, reference: $reference)';
  }
}
