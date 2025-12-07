/// Azkar Item model that holds azkar item information.
class AzkarItem {
  final int id;
  final int chapterId;
  final String? item;
  final String? transliteration;
  final String? count;
  final String? topNote;
  final String? bottomNote;
  final String? translation;
  final String reference;

  AzkarItem({
    required this.id,
    required this.chapterId,
    this.item,
    this.transliteration,
    this.count,
    this.topNote,
    this.bottomNote,
    this.translation,
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
        other.transliteration == transliteration &&
        other.count == count &&
        other.topNote == topNote &&
        other.bottomNote == bottomNote &&
        other.translation == translation &&
        other.reference == reference;
  }

  @override
  int get hashCode {
    return Object.hash(
      id,
      chapterId,
      item,
      transliteration,
      count,
      topNote,
      bottomNote,
      translation,
      reference,
    );
  }

  @override
  String toString() {
    return 'AzkarItem(id: $id, chapterId: $chapterId, item: $item, transliteration: $transliteration, count: $count, topNote: $topNote, bottomNote: $bottomNote, translation: $translation, reference: $reference)';
  }
}
