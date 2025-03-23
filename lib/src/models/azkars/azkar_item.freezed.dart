// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'azkar_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AzkarItem {

 int get id; int get chapterId; String get item; String get translation; String get reference;
/// Create a copy of AzkarItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AzkarItemCopyWith<AzkarItem> get copyWith => _$AzkarItemCopyWithImpl<AzkarItem>(this as AzkarItem, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AzkarItem&&(identical(other.id, id) || other.id == id)&&(identical(other.chapterId, chapterId) || other.chapterId == chapterId)&&(identical(other.item, item) || other.item == item)&&(identical(other.translation, translation) || other.translation == translation)&&(identical(other.reference, reference) || other.reference == reference));
}


@override
int get hashCode => Object.hash(runtimeType,id,chapterId,item,translation,reference);

@override
String toString() {
  return 'AzkarItem(id: $id, chapterId: $chapterId, item: $item, translation: $translation, reference: $reference)';
}


}

/// @nodoc
abstract mixin class $AzkarItemCopyWith<$Res>  {
  factory $AzkarItemCopyWith(AzkarItem value, $Res Function(AzkarItem) _then) = _$AzkarItemCopyWithImpl;
@useResult
$Res call({
 int id, int chapterId, String item, String translation, String reference
});




}
/// @nodoc
class _$AzkarItemCopyWithImpl<$Res>
    implements $AzkarItemCopyWith<$Res> {
  _$AzkarItemCopyWithImpl(this._self, this._then);

  final AzkarItem _self;
  final $Res Function(AzkarItem) _then;

/// Create a copy of AzkarItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? chapterId = null,Object? item = null,Object? translation = null,Object? reference = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,chapterId: null == chapterId ? _self.chapterId : chapterId // ignore: cast_nullable_to_non_nullable
as int,item: null == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as String,translation: null == translation ? _self.translation : translation // ignore: cast_nullable_to_non_nullable
as String,reference: null == reference ? _self.reference : reference // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc


class _AzkarItem implements AzkarItem {
  const _AzkarItem({required this.id, required this.chapterId, required this.item, required this.translation, required this.reference});
  

@override final  int id;
@override final  int chapterId;
@override final  String item;
@override final  String translation;
@override final  String reference;

/// Create a copy of AzkarItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AzkarItemCopyWith<_AzkarItem> get copyWith => __$AzkarItemCopyWithImpl<_AzkarItem>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AzkarItem&&(identical(other.id, id) || other.id == id)&&(identical(other.chapterId, chapterId) || other.chapterId == chapterId)&&(identical(other.item, item) || other.item == item)&&(identical(other.translation, translation) || other.translation == translation)&&(identical(other.reference, reference) || other.reference == reference));
}


@override
int get hashCode => Object.hash(runtimeType,id,chapterId,item,translation,reference);

@override
String toString() {
  return 'AzkarItem(id: $id, chapterId: $chapterId, item: $item, translation: $translation, reference: $reference)';
}


}

/// @nodoc
abstract mixin class _$AzkarItemCopyWith<$Res> implements $AzkarItemCopyWith<$Res> {
  factory _$AzkarItemCopyWith(_AzkarItem value, $Res Function(_AzkarItem) _then) = __$AzkarItemCopyWithImpl;
@override @useResult
$Res call({
 int id, int chapterId, String item, String translation, String reference
});




}
/// @nodoc
class __$AzkarItemCopyWithImpl<$Res>
    implements _$AzkarItemCopyWith<$Res> {
  __$AzkarItemCopyWithImpl(this._self, this._then);

  final _AzkarItem _self;
  final $Res Function(_AzkarItem) _then;

/// Create a copy of AzkarItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? chapterId = null,Object? item = null,Object? translation = null,Object? reference = null,}) {
  return _then(_AzkarItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,chapterId: null == chapterId ? _self.chapterId : chapterId // ignore: cast_nullable_to_non_nullable
as int,item: null == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as String,translation: null == translation ? _self.translation : translation // ignore: cast_nullable_to_non_nullable
as String,reference: null == reference ? _self.reference : reference // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
