// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'prescription_ui_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PrescriptionUiState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PrescriptionUiState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PrescriptionUiState()';
}


}

/// @nodoc
class $PrescriptionUiStateCopyWith<$Res>  {
$PrescriptionUiStateCopyWith(PrescriptionUiState _, $Res Function(PrescriptionUiState) __);
}


/// Adds pattern-matching-related methods to [PrescriptionUiState].
extension PrescriptionUiStatePatterns on PrescriptionUiState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( InitialState value)?  initial,TResult Function( LoadingState value)?  loading,TResult Function( SuccessState value)?  success,TResult Function( AnalyzeSuccessState value)?  analyzeSuccess,TResult Function( ErrorState value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case InitialState() when initial != null:
return initial(_that);case LoadingState() when loading != null:
return loading(_that);case SuccessState() when success != null:
return success(_that);case AnalyzeSuccessState() when analyzeSuccess != null:
return analyzeSuccess(_that);case ErrorState() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( InitialState value)  initial,required TResult Function( LoadingState value)  loading,required TResult Function( SuccessState value)  success,required TResult Function( AnalyzeSuccessState value)  analyzeSuccess,required TResult Function( ErrorState value)  error,}){
final _that = this;
switch (_that) {
case InitialState():
return initial(_that);case LoadingState():
return loading(_that);case SuccessState():
return success(_that);case AnalyzeSuccessState():
return analyzeSuccess(_that);case ErrorState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( InitialState value)?  initial,TResult? Function( LoadingState value)?  loading,TResult? Function( SuccessState value)?  success,TResult? Function( AnalyzeSuccessState value)?  analyzeSuccess,TResult? Function( ErrorState value)?  error,}){
final _that = this;
switch (_that) {
case InitialState() when initial != null:
return initial(_that);case LoadingState() when loading != null:
return loading(_that);case SuccessState() when success != null:
return success(_that);case AnalyzeSuccessState() when analyzeSuccess != null:
return analyzeSuccess(_that);case ErrorState() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<Prescription> prescription,  bool isLoadingMore,  bool hasMore)?  success,TResult Function( AnalyzePrescription analyzePrescription)?  analyzeSuccess,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case InitialState() when initial != null:
return initial();case LoadingState() when loading != null:
return loading();case SuccessState() when success != null:
return success(_that.prescription,_that.isLoadingMore,_that.hasMore);case AnalyzeSuccessState() when analyzeSuccess != null:
return analyzeSuccess(_that.analyzePrescription);case ErrorState() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<Prescription> prescription,  bool isLoadingMore,  bool hasMore)  success,required TResult Function( AnalyzePrescription analyzePrescription)  analyzeSuccess,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case InitialState():
return initial();case LoadingState():
return loading();case SuccessState():
return success(_that.prescription,_that.isLoadingMore,_that.hasMore);case AnalyzeSuccessState():
return analyzeSuccess(_that.analyzePrescription);case ErrorState():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<Prescription> prescription,  bool isLoadingMore,  bool hasMore)?  success,TResult? Function( AnalyzePrescription analyzePrescription)?  analyzeSuccess,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case InitialState() when initial != null:
return initial();case LoadingState() when loading != null:
return loading();case SuccessState() when success != null:
return success(_that.prescription,_that.isLoadingMore,_that.hasMore);case AnalyzeSuccessState() when analyzeSuccess != null:
return analyzeSuccess(_that.analyzePrescription);case ErrorState() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class InitialState implements PrescriptionUiState {
  const InitialState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InitialState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PrescriptionUiState.initial()';
}


}




/// @nodoc


class LoadingState implements PrescriptionUiState {
  const LoadingState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadingState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PrescriptionUiState.loading()';
}


}




/// @nodoc


class SuccessState implements PrescriptionUiState {
  const SuccessState({required final  List<Prescription> prescription, this.isLoadingMore = false, this.hasMore = true}): _prescription = prescription;
  

 final  List<Prescription> _prescription;
 List<Prescription> get prescription {
  if (_prescription is EqualUnmodifiableListView) return _prescription;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_prescription);
}

@JsonKey() final  bool isLoadingMore;
@JsonKey() final  bool hasMore;

/// Create a copy of PrescriptionUiState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuccessStateCopyWith<SuccessState> get copyWith => _$SuccessStateCopyWithImpl<SuccessState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuccessState&&const DeepCollectionEquality().equals(other._prescription, _prescription)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_prescription),isLoadingMore,hasMore);

@override
String toString() {
  return 'PrescriptionUiState.success(prescription: $prescription, isLoadingMore: $isLoadingMore, hasMore: $hasMore)';
}


}

/// @nodoc
abstract mixin class $SuccessStateCopyWith<$Res> implements $PrescriptionUiStateCopyWith<$Res> {
  factory $SuccessStateCopyWith(SuccessState value, $Res Function(SuccessState) _then) = _$SuccessStateCopyWithImpl;
@useResult
$Res call({
 List<Prescription> prescription, bool isLoadingMore, bool hasMore
});




}
/// @nodoc
class _$SuccessStateCopyWithImpl<$Res>
    implements $SuccessStateCopyWith<$Res> {
  _$SuccessStateCopyWithImpl(this._self, this._then);

  final SuccessState _self;
  final $Res Function(SuccessState) _then;

/// Create a copy of PrescriptionUiState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? prescription = null,Object? isLoadingMore = null,Object? hasMore = null,}) {
  return _then(SuccessState(
prescription: null == prescription ? _self._prescription : prescription // ignore: cast_nullable_to_non_nullable
as List<Prescription>,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class AnalyzeSuccessState implements PrescriptionUiState {
  const AnalyzeSuccessState({required this.analyzePrescription});
  

 final  AnalyzePrescription analyzePrescription;

/// Create a copy of PrescriptionUiState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnalyzeSuccessStateCopyWith<AnalyzeSuccessState> get copyWith => _$AnalyzeSuccessStateCopyWithImpl<AnalyzeSuccessState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnalyzeSuccessState&&(identical(other.analyzePrescription, analyzePrescription) || other.analyzePrescription == analyzePrescription));
}


@override
int get hashCode => Object.hash(runtimeType,analyzePrescription);

@override
String toString() {
  return 'PrescriptionUiState.analyzeSuccess(analyzePrescription: $analyzePrescription)';
}


}

/// @nodoc
abstract mixin class $AnalyzeSuccessStateCopyWith<$Res> implements $PrescriptionUiStateCopyWith<$Res> {
  factory $AnalyzeSuccessStateCopyWith(AnalyzeSuccessState value, $Res Function(AnalyzeSuccessState) _then) = _$AnalyzeSuccessStateCopyWithImpl;
@useResult
$Res call({
 AnalyzePrescription analyzePrescription
});




}
/// @nodoc
class _$AnalyzeSuccessStateCopyWithImpl<$Res>
    implements $AnalyzeSuccessStateCopyWith<$Res> {
  _$AnalyzeSuccessStateCopyWithImpl(this._self, this._then);

  final AnalyzeSuccessState _self;
  final $Res Function(AnalyzeSuccessState) _then;

/// Create a copy of PrescriptionUiState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? analyzePrescription = null,}) {
  return _then(AnalyzeSuccessState(
analyzePrescription: null == analyzePrescription ? _self.analyzePrescription : analyzePrescription // ignore: cast_nullable_to_non_nullable
as AnalyzePrescription,
  ));
}


}

/// @nodoc


class ErrorState implements PrescriptionUiState {
  const ErrorState(this.message);
  

 final  String message;

/// Create a copy of PrescriptionUiState
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
  return 'PrescriptionUiState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $ErrorStateCopyWith<$Res> implements $PrescriptionUiStateCopyWith<$Res> {
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

/// Create a copy of PrescriptionUiState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ErrorState(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
