// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_ui_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProfileUiState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileUiState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileUiState()';
}


}

/// @nodoc
class $ProfileUiStateCopyWith<$Res>  {
$ProfileUiStateCopyWith(ProfileUiState _, $Res Function(ProfileUiState) __);
}


/// Adds pattern-matching-related methods to [ProfileUiState].
extension ProfileUiStatePatterns on ProfileUiState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AnonymousState value)?  anonymous,TResult Function( LoadingState value)?  loading,TResult Function( SuccessState value)?  success,TResult Function( ErrorState value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AnonymousState() when anonymous != null:
return anonymous(_that);case LoadingState() when loading != null:
return loading(_that);case SuccessState() when success != null:
return success(_that);case ErrorState() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AnonymousState value)  anonymous,required TResult Function( LoadingState value)  loading,required TResult Function( SuccessState value)  success,required TResult Function( ErrorState value)  error,}){
final _that = this;
switch (_that) {
case AnonymousState():
return anonymous(_that);case LoadingState():
return loading(_that);case SuccessState():
return success(_that);case ErrorState():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AnonymousState value)?  anonymous,TResult? Function( LoadingState value)?  loading,TResult? Function( SuccessState value)?  success,TResult? Function( ErrorState value)?  error,}){
final _that = this;
switch (_that) {
case AnonymousState() when anonymous != null:
return anonymous(_that);case LoadingState() when loading != null:
return loading(_that);case SuccessState() when success != null:
return success(_that);case ErrorState() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  anonymous,TResult Function()?  loading,TResult Function( Profile profile)?  success,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AnonymousState() when anonymous != null:
return anonymous();case LoadingState() when loading != null:
return loading();case SuccessState() when success != null:
return success(_that.profile);case ErrorState() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  anonymous,required TResult Function()  loading,required TResult Function( Profile profile)  success,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case AnonymousState():
return anonymous();case LoadingState():
return loading();case SuccessState():
return success(_that.profile);case ErrorState():
return error(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  anonymous,TResult? Function()?  loading,TResult? Function( Profile profile)?  success,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case AnonymousState() when anonymous != null:
return anonymous();case LoadingState() when loading != null:
return loading();case SuccessState() when success != null:
return success(_that.profile);case ErrorState() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class AnonymousState implements ProfileUiState {
  const AnonymousState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnonymousState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileUiState.anonymous()';
}


}




/// @nodoc


class LoadingState implements ProfileUiState {
  const LoadingState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadingState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileUiState.loading()';
}


}




/// @nodoc


class SuccessState implements ProfileUiState {
  const SuccessState(this.profile);
  

 final  Profile profile;

/// Create a copy of ProfileUiState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuccessStateCopyWith<SuccessState> get copyWith => _$SuccessStateCopyWithImpl<SuccessState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuccessState&&(identical(other.profile, profile) || other.profile == profile));
}


@override
int get hashCode => Object.hash(runtimeType,profile);

@override
String toString() {
  return 'ProfileUiState.success(profile: $profile)';
}


}

/// @nodoc
abstract mixin class $SuccessStateCopyWith<$Res> implements $ProfileUiStateCopyWith<$Res> {
  factory $SuccessStateCopyWith(SuccessState value, $Res Function(SuccessState) _then) = _$SuccessStateCopyWithImpl;
@useResult
$Res call({
 Profile profile
});




}
/// @nodoc
class _$SuccessStateCopyWithImpl<$Res>
    implements $SuccessStateCopyWith<$Res> {
  _$SuccessStateCopyWithImpl(this._self, this._then);

  final SuccessState _self;
  final $Res Function(SuccessState) _then;

/// Create a copy of ProfileUiState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? profile = null,}) {
  return _then(SuccessState(
null == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as Profile,
  ));
}


}

/// @nodoc


class ErrorState implements ProfileUiState {
  const ErrorState(this.message);
  

 final  String message;

/// Create a copy of ProfileUiState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorStateCopyWith<ErrorState> get copyWith => _$ErrorStateCopyWithImpl<ErrorState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ErrorState&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ProfileUiState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $ErrorStateCopyWith<$Res> implements $ProfileUiStateCopyWith<$Res> {
  factory $ErrorStateCopyWith(ErrorState value, $Res Function(ErrorState) _then) = _$ErrorStateCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ErrorStateCopyWithImpl<$Res>
    implements $ErrorStateCopyWith<$Res> {
  _$ErrorStateCopyWithImpl(this._self, this._then);

  final ErrorState _self;
  final $Res Function(ErrorState) _then;

/// Create a copy of ProfileUiState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ErrorState(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
