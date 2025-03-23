import 'package:freezed_annotation/freezed_annotation.dart';

part 'azkar_chapter.freezed.dart';

/// Azkar Chapter model that holds azkar chapter information.
@freezed
abstract class AzkarChapter with _$AzkarChapter {
  const factory AzkarChapter({
    required int id,
    required int categoryId,
    required String name,
  }) = _AzkarChapter;
}
