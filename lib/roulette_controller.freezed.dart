// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'roulette_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RouletteState {
  String get title => throw _privateConstructorUsedError;
  double get value => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String title, double value) stop,
    required TResult Function(String title, double value) running,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String title, double value)? stop,
    TResult? Function(String title, double value)? running,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String title, double value)? stop,
    TResult Function(String title, double value)? running,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RouletteStateStop value) stop,
    required TResult Function(RouletteStateRunning value) running,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RouletteStateStop value)? stop,
    TResult? Function(RouletteStateRunning value)? running,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RouletteStateStop value)? stop,
    TResult Function(RouletteStateRunning value)? running,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of RouletteState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RouletteStateCopyWith<RouletteState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RouletteStateCopyWith<$Res> {
  factory $RouletteStateCopyWith(
          RouletteState value, $Res Function(RouletteState) then) =
      _$RouletteStateCopyWithImpl<$Res, RouletteState>;
  @useResult
  $Res call({String title, double value});
}

/// @nodoc
class _$RouletteStateCopyWithImpl<$Res, $Val extends RouletteState>
    implements $RouletteStateCopyWith<$Res> {
  _$RouletteStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RouletteState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RouletteStateStopImplCopyWith<$Res>
    implements $RouletteStateCopyWith<$Res> {
  factory _$$RouletteStateStopImplCopyWith(_$RouletteStateStopImpl value,
          $Res Function(_$RouletteStateStopImpl) then) =
      __$$RouletteStateStopImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, double value});
}

/// @nodoc
class __$$RouletteStateStopImplCopyWithImpl<$Res>
    extends _$RouletteStateCopyWithImpl<$Res, _$RouletteStateStopImpl>
    implements _$$RouletteStateStopImplCopyWith<$Res> {
  __$$RouletteStateStopImplCopyWithImpl(_$RouletteStateStopImpl _value,
      $Res Function(_$RouletteStateStopImpl) _then)
      : super(_value, _then);

  /// Create a copy of RouletteState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? value = null,
  }) {
    return _then(_$RouletteStateStopImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$RouletteStateStopImpl implements RouletteStateStop {
  const _$RouletteStateStopImpl({required this.title, this.value = 0});

  @override
  final String title;
  @override
  @JsonKey()
  final double value;

  @override
  String toString() {
    return 'RouletteState.stop(title: $title, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RouletteStateStopImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, value);

  /// Create a copy of RouletteState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RouletteStateStopImplCopyWith<_$RouletteStateStopImpl> get copyWith =>
      __$$RouletteStateStopImplCopyWithImpl<_$RouletteStateStopImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String title, double value) stop,
    required TResult Function(String title, double value) running,
  }) {
    return stop(title, value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String title, double value)? stop,
    TResult? Function(String title, double value)? running,
  }) {
    return stop?.call(title, value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String title, double value)? stop,
    TResult Function(String title, double value)? running,
    required TResult orElse(),
  }) {
    if (stop != null) {
      return stop(title, value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RouletteStateStop value) stop,
    required TResult Function(RouletteStateRunning value) running,
  }) {
    return stop(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RouletteStateStop value)? stop,
    TResult? Function(RouletteStateRunning value)? running,
  }) {
    return stop?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RouletteStateStop value)? stop,
    TResult Function(RouletteStateRunning value)? running,
    required TResult orElse(),
  }) {
    if (stop != null) {
      return stop(this);
    }
    return orElse();
  }
}

abstract class RouletteStateStop implements RouletteState {
  const factory RouletteStateStop(
      {required final String title,
      final double value}) = _$RouletteStateStopImpl;

  @override
  String get title;
  @override
  double get value;

  /// Create a copy of RouletteState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RouletteStateStopImplCopyWith<_$RouletteStateStopImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RouletteStateRunningImplCopyWith<$Res>
    implements $RouletteStateCopyWith<$Res> {
  factory _$$RouletteStateRunningImplCopyWith(_$RouletteStateRunningImpl value,
          $Res Function(_$RouletteStateRunningImpl) then) =
      __$$RouletteStateRunningImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, double value});
}

/// @nodoc
class __$$RouletteStateRunningImplCopyWithImpl<$Res>
    extends _$RouletteStateCopyWithImpl<$Res, _$RouletteStateRunningImpl>
    implements _$$RouletteStateRunningImplCopyWith<$Res> {
  __$$RouletteStateRunningImplCopyWithImpl(_$RouletteStateRunningImpl _value,
      $Res Function(_$RouletteStateRunningImpl) _then)
      : super(_value, _then);

  /// Create a copy of RouletteState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? value = null,
  }) {
    return _then(_$RouletteStateRunningImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$RouletteStateRunningImpl implements RouletteStateRunning {
  const _$RouletteStateRunningImpl({required this.title, required this.value});

  @override
  final String title;
  @override
  final double value;

  @override
  String toString() {
    return 'RouletteState.running(title: $title, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RouletteStateRunningImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, value);

  /// Create a copy of RouletteState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RouletteStateRunningImplCopyWith<_$RouletteStateRunningImpl>
      get copyWith =>
          __$$RouletteStateRunningImplCopyWithImpl<_$RouletteStateRunningImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String title, double value) stop,
    required TResult Function(String title, double value) running,
  }) {
    return running(title, value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String title, double value)? stop,
    TResult? Function(String title, double value)? running,
  }) {
    return running?.call(title, value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String title, double value)? stop,
    TResult Function(String title, double value)? running,
    required TResult orElse(),
  }) {
    if (running != null) {
      return running(title, value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RouletteStateStop value) stop,
    required TResult Function(RouletteStateRunning value) running,
  }) {
    return running(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RouletteStateStop value)? stop,
    TResult? Function(RouletteStateRunning value)? running,
  }) {
    return running?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RouletteStateStop value)? stop,
    TResult Function(RouletteStateRunning value)? running,
    required TResult orElse(),
  }) {
    if (running != null) {
      return running(this);
    }
    return orElse();
  }
}

abstract class RouletteStateRunning implements RouletteState {
  const factory RouletteStateRunning(
      {required final String title,
      required final double value}) = _$RouletteStateRunningImpl;

  @override
  String get title;
  @override
  double get value;

  /// Create a copy of RouletteState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RouletteStateRunningImplCopyWith<_$RouletteStateRunningImpl>
      get copyWith => throw _privateConstructorUsedError;
}
