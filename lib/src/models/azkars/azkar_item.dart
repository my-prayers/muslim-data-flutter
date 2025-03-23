import 'package:freezed_annotation/freezed_annotation.dart';

part 'azkar_item.freezed.dart';

/// Azkar Item model that holds azkar item information.
@freezed
abstract class AzkarItem with _$AzkarItem {
  const factory AzkarItem({
    required int id,
    required int chapterId,
    required String item,
    required String translation,
    required String reference,
  }) = _AzkarItem;
}
