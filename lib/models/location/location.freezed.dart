// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'location.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Location {

 int get id; String get name; double get latitude; double get longitude; String get countryCode; String get countryName; bool get hasFixedPrayerTime; int? get prayerDependentId;
/// Create a copy of Location
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LocationCopyWith<Location> get copyWith => _$LocationCopyWithImpl<Location>(this as Location, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Location&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.countryCode, countryCode) || other.countryCode == countryCode)&&(identical(other.countryName, countryName) || other.countryName == countryName)&&(identical(other.hasFixedPrayerTime, hasFixedPrayerTime) || other.hasFixedPrayerTime == hasFixedPrayerTime)&&(identical(other.prayerDependentId, prayerDependentId) || other.prayerDependentId == prayerDependentId));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,latitude,longitude,countryCode,countryName,hasFixedPrayerTime,prayerDependentId);

@override
String toString() {
  return 'Location(id: $id, name: $name, latitude: $latitude, longitude: $longitude, countryCode: $countryCode, countryName: $countryName, hasFixedPrayerTime: $hasFixedPrayerTime, prayerDependentId: $prayerDependentId)';
}


}

/// @nodoc
abstract mixin class $LocationCopyWith<$Res>  {
  factory $LocationCopyWith(Location value, $Res Function(Location) _then) = _$LocationCopyWithImpl;
@useResult
$Res call({
 int id, String name, double latitude, double longitude, String countryCode, String countryName, bool hasFixedPrayerTime, int? prayerDependentId
});




}
/// @nodoc
class _$LocationCopyWithImpl<$Res>
    implements $LocationCopyWith<$Res> {
  _$LocationCopyWithImpl(this._self, this._then);

  final Location _self;
  final $Res Function(Location) _then;

/// Create a copy of Location
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? latitude = null,Object? longitude = null,Object? countryCode = null,Object? countryName = null,Object? hasFixedPrayerTime = null,Object? prayerDependentId = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,countryCode: null == countryCode ? _self.countryCode : countryCode // ignore: cast_nullable_to_non_nullable
as String,countryName: null == countryName ? _self.countryName : countryName // ignore: cast_nullable_to_non_nullable
as String,hasFixedPrayerTime: null == hasFixedPrayerTime ? _self.hasFixedPrayerTime : hasFixedPrayerTime // ignore: cast_nullable_to_non_nullable
as bool,prayerDependentId: freezed == prayerDependentId ? _self.prayerDependentId : prayerDependentId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// @nodoc


class _Location implements Location {
  const _Location({required this.id, required this.name, required this.latitude, required this.longitude, required this.countryCode, required this.countryName, required this.hasFixedPrayerTime, this.prayerDependentId});
  

@override final  int id;
@override final  String name;
@override final  double latitude;
@override final  double longitude;
@override final  String countryCode;
@override final  String countryName;
@override final  bool hasFixedPrayerTime;
@override final  int? prayerDependentId;

/// Create a copy of Location
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LocationCopyWith<_Location> get copyWith => __$LocationCopyWithImpl<_Location>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Location&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.countryCode, countryCode) || other.countryCode == countryCode)&&(identical(other.countryName, countryName) || other.countryName == countryName)&&(identical(other.hasFixedPrayerTime, hasFixedPrayerTime) || other.hasFixedPrayerTime == hasFixedPrayerTime)&&(identical(other.prayerDependentId, prayerDependentId) || other.prayerDependentId == prayerDependentId));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,latitude,longitude,countryCode,countryName,hasFixedPrayerTime,prayerDependentId);

@override
String toString() {
  return 'Location(id: $id, name: $name, latitude: $latitude, longitude: $longitude, countryCode: $countryCode, countryName: $countryName, hasFixedPrayerTime: $hasFixedPrayerTime, prayerDependentId: $prayerDependentId)';
}


}

/// @nodoc
abstract mixin class _$LocationCopyWith<$Res> implements $LocationCopyWith<$Res> {
  factory _$LocationCopyWith(_Location value, $Res Function(_Location) _then) = __$LocationCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, double latitude, double longitude, String countryCode, String countryName, bool hasFixedPrayerTime, int? prayerDependentId
});




}
/// @nodoc
class __$LocationCopyWithImpl<$Res>
    implements _$LocationCopyWith<$Res> {
  __$LocationCopyWithImpl(this._self, this._then);

  final _Location _self;
  final $Res Function(_Location) _then;

/// Create a copy of Location
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? latitude = null,Object? longitude = null,Object? countryCode = null,Object? countryName = null,Object? hasFixedPrayerTime = null,Object? prayerDependentId = freezed,}) {
  return _then(_Location(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,countryCode: null == countryCode ? _self.countryCode : countryCode // ignore: cast_nullable_to_non_nullable
as String,countryName: null == countryName ? _self.countryName : countryName // ignore: cast_nullable_to_non_nullable
as String,hasFixedPrayerTime: null == hasFixedPrayerTime ? _self.hasFixedPrayerTime : hasFixedPrayerTime // ignore: cast_nullable_to_non_nullable
as bool,prayerDependentId: freezed == prayerDependentId ? _self.prayerDependentId : prayerDependentId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
