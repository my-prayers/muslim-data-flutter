// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'azkar_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AzkarCategory {

 int get id; String get name;
/// Create a copy of AzkarCategory
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AzkarCategoryCopyWith<AzkarCategory> get copyWith => _$AzkarCategoryCopyWithImpl<AzkarCategory>(this as AzkarCategory, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AzkarCategory&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}


@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'AzkarCategory(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class $AzkarCategoryCopyWith<$Res>  {
  factory $AzkarCategoryCopyWith(AzkarCategory value, $Res Function(AzkarCategory) _then) = _$AzkarCategoryCopyWithImpl;
@useResult
$Res call({
 int id, String name
});




}
/// @nodoc
class _$AzkarCategoryCopyWithImpl<$Res>
    implements $AzkarCategoryCopyWith<$Res> {
  _$AzkarCategoryCopyWithImpl(this._self, this._then);

  final AzkarCategory _self;
  final $Res Function(AzkarCategory) _then;

/// Create a copy of AzkarCategory
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc


class _AzkarCategory implements AzkarCategory {
  const _AzkarCategory({required this.id, required this.name});
  

@override final  int id;
@override final  String name;

/// Create a copy of AzkarCategory
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AzkarCategoryCopyWith<_AzkarCategory> get copyWith => __$AzkarCategoryCopyWithImpl<_AzkarCategory>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AzkarCategory&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}


@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'AzkarCategory(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class _$AzkarCategoryCopyWith<$Res> implements $AzkarCategoryCopyWith<$Res> {
  factory _$AzkarCategoryCopyWith(_AzkarCategory value, $Res Function(_AzkarCategory) _then) = __$AzkarCategoryCopyWithImpl;
@override @useResult
$Res call({
 int id, String name
});




}
/// @nodoc
class __$AzkarCategoryCopyWithImpl<$Res>
    implements _$AzkarCategoryCopyWith<$Res> {
  __$AzkarCategoryCopyWithImpl(this._self, this._then);

  final _AzkarCategory _self;
  final $Res Function(_AzkarCategory) _then;

/// Create a copy of AzkarCategory
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,}) {
  return _then(_AzkarCategory(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
