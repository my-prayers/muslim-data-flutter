// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'azkar_chapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AzkarChapter {

 int get id; int get categoryId; String get name;
/// Create a copy of AzkarChapter
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AzkarChapterCopyWith<AzkarChapter> get copyWith => _$AzkarChapterCopyWithImpl<AzkarChapter>(this as AzkarChapter, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AzkarChapter&&(identical(other.id, id) || other.id == id)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.name, name) || other.name == name));
}


@override
int get hashCode => Object.hash(runtimeType,id,categoryId,name);

@override
String toString() {
  return 'AzkarChapter(id: $id, categoryId: $categoryId, name: $name)';
}


}

/// @nodoc
abstract mixin class $AzkarChapterCopyWith<$Res>  {
  factory $AzkarChapterCopyWith(AzkarChapter value, $Res Function(AzkarChapter) _then) = _$AzkarChapterCopyWithImpl;
@useResult
$Res call({
 int id, int categoryId, String name
});




}
/// @nodoc
class _$AzkarChapterCopyWithImpl<$Res>
    implements $AzkarChapterCopyWith<$Res> {
  _$AzkarChapterCopyWithImpl(this._self, this._then);

  final AzkarChapter _self;
  final $Res Function(AzkarChapter) _then;

/// Create a copy of AzkarChapter
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? categoryId = null,Object? name = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc


class _AzkarChapter implements AzkarChapter {
  const _AzkarChapter({required this.id, required this.categoryId, required this.name});
  

@override final  int id;
@override final  int categoryId;
@override final  String name;

/// Create a copy of AzkarChapter
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AzkarChapterCopyWith<_AzkarChapter> get copyWith => __$AzkarChapterCopyWithImpl<_AzkarChapter>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AzkarChapter&&(identical(other.id, id) || other.id == id)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.name, name) || other.name == name));
}


@override
int get hashCode => Object.hash(runtimeType,id,categoryId,name);

@override
String toString() {
  return 'AzkarChapter(id: $id, categoryId: $categoryId, name: $name)';
}


}

/// @nodoc
abstract mixin class _$AzkarChapterCopyWith<$Res> implements $AzkarChapterCopyWith<$Res> {
  factory _$AzkarChapterCopyWith(_AzkarChapter value, $Res Function(_AzkarChapter) _then) = __$AzkarChapterCopyWithImpl;
@override @useResult
$Res call({
 int id, int categoryId, String name
});




}
/// @nodoc
class __$AzkarChapterCopyWithImpl<$Res>
    implements _$AzkarChapterCopyWith<$Res> {
  __$AzkarChapterCopyWithImpl(this._self, this._then);

  final _AzkarChapter _self;
  final $Res Function(_AzkarChapter) _then;

/// Create a copy of AzkarChapter
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? categoryId = null,Object? name = null,}) {
  return _then(_AzkarChapter(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
