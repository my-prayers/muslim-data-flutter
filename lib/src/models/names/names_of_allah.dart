import 'package:freezed_annotation/freezed_annotation.dart';

part 'names_of_allah.freezed.dart';

/// Name of Allah model that holds name of Allah with its translation.
@freezed
abstract class NameOfAllah with _$NameOfAllah {
  const factory NameOfAllah({
    required int id,
    required String name,
    required String translation,
  }) = _NameOfAllah;
}
