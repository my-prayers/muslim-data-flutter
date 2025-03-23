import 'package:freezed_annotation/freezed_annotation.dart';

part 'azkar_category.freezed.dart';

/// Azkar Category model.
@freezed
abstract class AzkarCategory with _$AzkarCategory {
  const factory AzkarCategory({required int id, required String name}) =
      _AzkarCategory;
}
