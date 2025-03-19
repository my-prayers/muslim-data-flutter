// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'prayer_attribute.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PrayerAttribute {

 CalculationMethod get calculationMethod; AsrMethod get asrMethod; HigherLatitudeMethod get higherLatitudeMethod; List<int> get offset;
/// Create a copy of PrayerAttribute
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PrayerAttributeCopyWith<PrayerAttribute> get copyWith => _$PrayerAttributeCopyWithImpl<PrayerAttribute>(this as PrayerAttribute, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PrayerAttribute&&(identical(other.calculationMethod, calculationMethod) || other.calculationMethod == calculationMethod)&&(identical(other.asrMethod, asrMethod) || other.asrMethod == asrMethod)&&(identical(other.higherLatitudeMethod, higherLatitudeMethod) || other.higherLatitudeMethod == higherLatitudeMethod)&&const DeepCollectionEquality().equals(other.offset, offset));
}


@override
int get hashCode => Object.hash(runtimeType,calculationMethod,asrMethod,higherLatitudeMethod,const DeepCollectionEquality().hash(offset));

@override
String toString() {
  return 'PrayerAttribute(calculationMethod: $calculationMethod, asrMethod: $asrMethod, higherLatitudeMethod: $higherLatitudeMethod, offset: $offset)';
}


}

/// @nodoc
abstract mixin class $PrayerAttributeCopyWith<$Res>  {
  factory $PrayerAttributeCopyWith(PrayerAttribute value, $Res Function(PrayerAttribute) _then) = _$PrayerAttributeCopyWithImpl;
@useResult
$Res call({
 CalculationMethod calculationMethod, AsrMethod asrMethod, HigherLatitudeMethod higherLatitudeMethod, List<int> offset
});




}
/// @nodoc
class _$PrayerAttributeCopyWithImpl<$Res>
    implements $PrayerAttributeCopyWith<$Res> {
  _$PrayerAttributeCopyWithImpl(this._self, this._then);

  final PrayerAttribute _self;
  final $Res Function(PrayerAttribute) _then;

/// Create a copy of PrayerAttribute
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? calculationMethod = null,Object? asrMethod = null,Object? higherLatitudeMethod = null,Object? offset = null,}) {
  return _then(_self.copyWith(
calculationMethod: null == calculationMethod ? _self.calculationMethod : calculationMethod // ignore: cast_nullable_to_non_nullable
as CalculationMethod,asrMethod: null == asrMethod ? _self.asrMethod : asrMethod // ignore: cast_nullable_to_non_nullable
as AsrMethod,higherLatitudeMethod: null == higherLatitudeMethod ? _self.higherLatitudeMethod : higherLatitudeMethod // ignore: cast_nullable_to_non_nullable
as HigherLatitudeMethod,offset: null == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}

}


/// @nodoc


class _PrayerAttribute implements PrayerAttribute {
  const _PrayerAttribute({required this.calculationMethod, required this.asrMethod, required this.higherLatitudeMethod, final  List<int> offset = const [0, 0, 0, 0, 0, 0]}): _offset = offset;
  

@override final  CalculationMethod calculationMethod;
@override final  AsrMethod asrMethod;
@override final  HigherLatitudeMethod higherLatitudeMethod;
 final  List<int> _offset;
@override@JsonKey() List<int> get offset {
  if (_offset is EqualUnmodifiableListView) return _offset;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_offset);
}


/// Create a copy of PrayerAttribute
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PrayerAttributeCopyWith<_PrayerAttribute> get copyWith => __$PrayerAttributeCopyWithImpl<_PrayerAttribute>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PrayerAttribute&&(identical(other.calculationMethod, calculationMethod) || other.calculationMethod == calculationMethod)&&(identical(other.asrMethod, asrMethod) || other.asrMethod == asrMethod)&&(identical(other.higherLatitudeMethod, higherLatitudeMethod) || other.higherLatitudeMethod == higherLatitudeMethod)&&const DeepCollectionEquality().equals(other._offset, _offset));
}


@override
int get hashCode => Object.hash(runtimeType,calculationMethod,asrMethod,higherLatitudeMethod,const DeepCollectionEquality().hash(_offset));

@override
String toString() {
  return 'PrayerAttribute(calculationMethod: $calculationMethod, asrMethod: $asrMethod, higherLatitudeMethod: $higherLatitudeMethod, offset: $offset)';
}


}

/// @nodoc
abstract mixin class _$PrayerAttributeCopyWith<$Res> implements $PrayerAttributeCopyWith<$Res> {
  factory _$PrayerAttributeCopyWith(_PrayerAttribute value, $Res Function(_PrayerAttribute) _then) = __$PrayerAttributeCopyWithImpl;
@override @useResult
$Res call({
 CalculationMethod calculationMethod, AsrMethod asrMethod, HigherLatitudeMethod higherLatitudeMethod, List<int> offset
});




}
/// @nodoc
class __$PrayerAttributeCopyWithImpl<$Res>
    implements _$PrayerAttributeCopyWith<$Res> {
  __$PrayerAttributeCopyWithImpl(this._self, this._then);

  final _PrayerAttribute _self;
  final $Res Function(_PrayerAttribute) _then;

/// Create a copy of PrayerAttribute
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? calculationMethod = null,Object? asrMethod = null,Object? higherLatitudeMethod = null,Object? offset = null,}) {
  return _then(_PrayerAttribute(
calculationMethod: null == calculationMethod ? _self.calculationMethod : calculationMethod // ignore: cast_nullable_to_non_nullable
as CalculationMethod,asrMethod: null == asrMethod ? _self.asrMethod : asrMethod // ignore: cast_nullable_to_non_nullable
as AsrMethod,higherLatitudeMethod: null == higherLatitudeMethod ? _self.higherLatitudeMethod : higherLatitudeMethod // ignore: cast_nullable_to_non_nullable
as HigherLatitudeMethod,offset: null == offset ? _self._offset : offset // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}


}

// dart format on
