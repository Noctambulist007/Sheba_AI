// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lives_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LivesResponse {

@JsonKey(name: 'lives_remaining', defaultValue: 0) int get livesRemaining;@JsonKey(name: 'max_lives', defaultValue: 0) int get maxLives;@JsonKey(name: 'last_reset', defaultValue: '') String get lastReset;@JsonKey(name: 'next_reset', defaultValue: '') String get nextReset;
/// Create a copy of LivesResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LivesResponseCopyWith<LivesResponse> get copyWith => _$LivesResponseCopyWithImpl<LivesResponse>(this as LivesResponse, _$identity);

  /// Serializes this LivesResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LivesResponse&&(identical(other.livesRemaining, livesRemaining) || other.livesRemaining == livesRemaining)&&(identical(other.maxLives, maxLives) || other.maxLives == maxLives)&&(identical(other.lastReset, lastReset) || other.lastReset == lastReset)&&(identical(other.nextReset, nextReset) || other.nextReset == nextReset));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,livesRemaining,maxLives,lastReset,nextReset);

@override
String toString() {
  return 'LivesResponse(livesRemaining: $livesRemaining, maxLives: $maxLives, lastReset: $lastReset, nextReset: $nextReset)';
}


}

/// @nodoc
abstract mixin class $LivesResponseCopyWith<$Res>  {
  factory $LivesResponseCopyWith(LivesResponse value, $Res Function(LivesResponse) _then) = _$LivesResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'lives_remaining', defaultValue: 0) int livesRemaining,@JsonKey(name: 'max_lives', defaultValue: 0) int maxLives,@JsonKey(name: 'last_reset', defaultValue: '') String lastReset,@JsonKey(name: 'next_reset', defaultValue: '') String nextReset
});




}
/// @nodoc
class _$LivesResponseCopyWithImpl<$Res>
    implements $LivesResponseCopyWith<$Res> {
  _$LivesResponseCopyWithImpl(this._self, this._then);

  final LivesResponse _self;
  final $Res Function(LivesResponse) _then;

/// Create a copy of LivesResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? livesRemaining = null,Object? maxLives = null,Object? lastReset = null,Object? nextReset = null,}) {
  return _then(_self.copyWith(
livesRemaining: null == livesRemaining ? _self.livesRemaining : livesRemaining // ignore: cast_nullable_to_non_nullable
as int,maxLives: null == maxLives ? _self.maxLives : maxLives // ignore: cast_nullable_to_non_nullable
as int,lastReset: null == lastReset ? _self.lastReset : lastReset // ignore: cast_nullable_to_non_nullable
as String,nextReset: null == nextReset ? _self.nextReset : nextReset // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [LivesResponse].
extension LivesResponsePatterns on LivesResponse {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LivesResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LivesResponse() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LivesResponse value)  $default,){
final _that = this;
switch (_that) {
case _LivesResponse():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LivesResponse value)?  $default,){
final _that = this;
switch (_that) {
case _LivesResponse() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'lives_remaining', defaultValue: 0)  int livesRemaining, @JsonKey(name: 'max_lives', defaultValue: 0)  int maxLives, @JsonKey(name: 'last_reset', defaultValue: '')  String lastReset, @JsonKey(name: 'next_reset', defaultValue: '')  String nextReset)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LivesResponse() when $default != null:
return $default(_that.livesRemaining,_that.maxLives,_that.lastReset,_that.nextReset);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'lives_remaining', defaultValue: 0)  int livesRemaining, @JsonKey(name: 'max_lives', defaultValue: 0)  int maxLives, @JsonKey(name: 'last_reset', defaultValue: '')  String lastReset, @JsonKey(name: 'next_reset', defaultValue: '')  String nextReset)  $default,) {final _that = this;
switch (_that) {
case _LivesResponse():
return $default(_that.livesRemaining,_that.maxLives,_that.lastReset,_that.nextReset);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'lives_remaining', defaultValue: 0)  int livesRemaining, @JsonKey(name: 'max_lives', defaultValue: 0)  int maxLives, @JsonKey(name: 'last_reset', defaultValue: '')  String lastReset, @JsonKey(name: 'next_reset', defaultValue: '')  String nextReset)?  $default,) {final _that = this;
switch (_that) {
case _LivesResponse() when $default != null:
return $default(_that.livesRemaining,_that.maxLives,_that.lastReset,_that.nextReset);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LivesResponse implements LivesResponse {
  const _LivesResponse({@JsonKey(name: 'lives_remaining', defaultValue: 0) required this.livesRemaining, @JsonKey(name: 'max_lives', defaultValue: 0) required this.maxLives, @JsonKey(name: 'last_reset', defaultValue: '') required this.lastReset, @JsonKey(name: 'next_reset', defaultValue: '') required this.nextReset});
  factory _LivesResponse.fromJson(Map<String, dynamic> json) => _$LivesResponseFromJson(json);

@override@JsonKey(name: 'lives_remaining', defaultValue: 0) final  int livesRemaining;
@override@JsonKey(name: 'max_lives', defaultValue: 0) final  int maxLives;
@override@JsonKey(name: 'last_reset', defaultValue: '') final  String lastReset;
@override@JsonKey(name: 'next_reset', defaultValue: '') final  String nextReset;

/// Create a copy of LivesResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LivesResponseCopyWith<_LivesResponse> get copyWith => __$LivesResponseCopyWithImpl<_LivesResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LivesResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LivesResponse&&(identical(other.livesRemaining, livesRemaining) || other.livesRemaining == livesRemaining)&&(identical(other.maxLives, maxLives) || other.maxLives == maxLives)&&(identical(other.lastReset, lastReset) || other.lastReset == lastReset)&&(identical(other.nextReset, nextReset) || other.nextReset == nextReset));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,livesRemaining,maxLives,lastReset,nextReset);

@override
String toString() {
  return 'LivesResponse(livesRemaining: $livesRemaining, maxLives: $maxLives, lastReset: $lastReset, nextReset: $nextReset)';
}


}

/// @nodoc
abstract mixin class _$LivesResponseCopyWith<$Res> implements $LivesResponseCopyWith<$Res> {
  factory _$LivesResponseCopyWith(_LivesResponse value, $Res Function(_LivesResponse) _then) = __$LivesResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'lives_remaining', defaultValue: 0) int livesRemaining,@JsonKey(name: 'max_lives', defaultValue: 0) int maxLives,@JsonKey(name: 'last_reset', defaultValue: '') String lastReset,@JsonKey(name: 'next_reset', defaultValue: '') String nextReset
});




}
/// @nodoc
class __$LivesResponseCopyWithImpl<$Res>
    implements _$LivesResponseCopyWith<$Res> {
  __$LivesResponseCopyWithImpl(this._self, this._then);

  final _LivesResponse _self;
  final $Res Function(_LivesResponse) _then;

/// Create a copy of LivesResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? livesRemaining = null,Object? maxLives = null,Object? lastReset = null,Object? nextReset = null,}) {
  return _then(_LivesResponse(
livesRemaining: null == livesRemaining ? _self.livesRemaining : livesRemaining // ignore: cast_nullable_to_non_nullable
as int,maxLives: null == maxLives ? _self.maxLives : maxLives // ignore: cast_nullable_to_non_nullable
as int,lastReset: null == lastReset ? _self.lastReset : lastReset // ignore: cast_nullable_to_non_nullable
as String,nextReset: null == nextReset ? _self.nextReset : nextReset // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
