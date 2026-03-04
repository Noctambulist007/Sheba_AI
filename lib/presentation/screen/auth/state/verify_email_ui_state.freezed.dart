// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verify_email_ui_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$VerifyEmailUiState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VerifyEmailUiState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VerifyEmailUiState()';
}


}

/// @nodoc
class $VerifyEmailUiStateCopyWith<$Res>  {
$VerifyEmailUiStateCopyWith(VerifyEmailUiState _, $Res Function(VerifyEmailUiState) __);
}


/// Adds pattern-matching-related methods to [VerifyEmailUiState].
extension VerifyEmailUiStatePatterns on VerifyEmailUiState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( VerifyEmailInitialState value)?  initial,TResult Function( VerifyEmailLoadingState value)?  loading,TResult Function( VerifyEmailVerifiedState value)?  verified,TResult Function( VerifyEmailUnverifiedState value)?  unverified,TResult Function( VerifyEmailErrorState value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case VerifyEmailInitialState() when initial != null:
return initial(_that);case VerifyEmailLoadingState() when loading != null:
return loading(_that);case VerifyEmailVerifiedState() when verified != null:
return verified(_that);case VerifyEmailUnverifiedState() when unverified != null:
return unverified(_that);case VerifyEmailErrorState() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( VerifyEmailInitialState value)  initial,required TResult Function( VerifyEmailLoadingState value)  loading,required TResult Function( VerifyEmailVerifiedState value)  verified,required TResult Function( VerifyEmailUnverifiedState value)  unverified,required TResult Function( VerifyEmailErrorState value)  error,}){
final _that = this;
switch (_that) {
case VerifyEmailInitialState():
return initial(_that);case VerifyEmailLoadingState():
return loading(_that);case VerifyEmailVerifiedState():
return verified(_that);case VerifyEmailUnverifiedState():
return unverified(_that);case VerifyEmailErrorState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( VerifyEmailInitialState value)?  initial,TResult? Function( VerifyEmailLoadingState value)?  loading,TResult? Function( VerifyEmailVerifiedState value)?  verified,TResult? Function( VerifyEmailUnverifiedState value)?  unverified,TResult? Function( VerifyEmailErrorState value)?  error,}){
final _that = this;
switch (_that) {
case VerifyEmailInitialState() when initial != null:
return initial(_that);case VerifyEmailLoadingState() when loading != null:
return loading(_that);case VerifyEmailVerifiedState() when verified != null:
return verified(_that);case VerifyEmailUnverifiedState() when unverified != null:
return unverified(_that);case VerifyEmailErrorState() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function()?  verified,TResult Function()?  unverified,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case VerifyEmailInitialState() when initial != null:
return initial();case VerifyEmailLoadingState() when loading != null:
return loading();case VerifyEmailVerifiedState() when verified != null:
return verified();case VerifyEmailUnverifiedState() when unverified != null:
return unverified();case VerifyEmailErrorState() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function()  verified,required TResult Function()  unverified,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case VerifyEmailInitialState():
return initial();case VerifyEmailLoadingState():
return loading();case VerifyEmailVerifiedState():
return verified();case VerifyEmailUnverifiedState():
return unverified();case VerifyEmailErrorState():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function()?  verified,TResult? Function()?  unverified,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case VerifyEmailInitialState() when initial != null:
return initial();case VerifyEmailLoadingState() when loading != null:
return loading();case VerifyEmailVerifiedState() when verified != null:
return verified();case VerifyEmailUnverifiedState() when unverified != null:
return unverified();case VerifyEmailErrorState() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class VerifyEmailInitialState implements VerifyEmailUiState {
  const VerifyEmailInitialState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VerifyEmailInitialState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VerifyEmailUiState.initial()';
}


}




/// @nodoc


class VerifyEmailLoadingState implements VerifyEmailUiState {
  const VerifyEmailLoadingState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VerifyEmailLoadingState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VerifyEmailUiState.loading()';
}


}




/// @nodoc


class VerifyEmailVerifiedState implements VerifyEmailUiState {
  const VerifyEmailVerifiedState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VerifyEmailVerifiedState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VerifyEmailUiState.verified()';
}


}




/// @nodoc


class VerifyEmailUnverifiedState implements VerifyEmailUiState {
  const VerifyEmailUnverifiedState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VerifyEmailUnverifiedState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VerifyEmailUiState.unverified()';
}


}




/// @nodoc


class VerifyEmailErrorState implements VerifyEmailUiState {
  const VerifyEmailErrorState(this.message);
  

 final  String message;

/// Create a copy of VerifyEmailUiState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VerifyEmailErrorStateCopyWith<VerifyEmailErrorState> get copyWith => _$VerifyEmailErrorStateCopyWithImpl<VerifyEmailErrorState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VerifyEmailErrorState&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'VerifyEmailUiState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $VerifyEmailErrorStateCopyWith<$Res> implements $VerifyEmailUiStateCopyWith<$Res> {
  factory $VerifyEmailErrorStateCopyWith(VerifyEmailErrorState value, $Res Function(VerifyEmailErrorState) _then) = _$VerifyEmailErrorStateCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$VerifyEmailErrorStateCopyWithImpl<$Res>
    implements $VerifyEmailErrorStateCopyWith<$Res> {
  _$VerifyEmailErrorStateCopyWithImpl(this._self, this._then);

  final VerifyEmailErrorState _self;
  final $Res Function(VerifyEmailErrorState) _then;

/// Create a copy of VerifyEmailUiState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(VerifyEmailErrorState(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
