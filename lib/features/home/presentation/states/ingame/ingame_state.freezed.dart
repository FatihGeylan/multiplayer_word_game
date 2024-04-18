// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ingame_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$IngameState {
  bool get isLoading => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  List<List<Letter>> get baseLetters => throw _privateConstructorUsedError;
  List<List<Letter>> get myLetters => throw _privateConstructorUsedError;
  List<List<Letter>> get opponentLetters => throw _privateConstructorUsedError;
  Option<ValueFailure> get wordFailure => throw _privateConstructorUsedError;
  int get rowIndex => throw _privateConstructorUsedError;
  int get columnIndex => throw _privateConstructorUsedError;
  int get wordLength => throw _privateConstructorUsedError;
  String get gameId => throw _privateConstructorUsedError;
  bool get isCheckingOpponent => throw _privateConstructorUsedError;
  int get inactivityTime => throw _privateConstructorUsedError;
  int get hurryTime => throw _privateConstructorUsedError;
  bool get isEnemyFinished => throw _privateConstructorUsedError;
  Option<GameResult> get gameResult => throw _privateConstructorUsedError;
  Option<Challenge> get rematchRequest => throw _privateConstructorUsedError;
  Option<PregameInfo> get pregameInfo => throw _privateConstructorUsedError;
  bool get isRematchRejected => throw _privateConstructorUsedError;
  bool get isRematchSent => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $IngameStateCopyWith<IngameState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IngameStateCopyWith<$Res> {
  factory $IngameStateCopyWith(
          IngameState value, $Res Function(IngameState) then) =
      _$IngameStateCopyWithImpl<$Res, IngameState>;
  @useResult
  $Res call(
      {bool isLoading,
      String code,
      List<List<Letter>> baseLetters,
      List<List<Letter>> myLetters,
      List<List<Letter>> opponentLetters,
      Option<ValueFailure> wordFailure,
      int rowIndex,
      int columnIndex,
      int wordLength,
      String gameId,
      bool isCheckingOpponent,
      int inactivityTime,
      int hurryTime,
      bool isEnemyFinished,
      Option<GameResult> gameResult,
      Option<Challenge> rematchRequest,
      Option<PregameInfo> pregameInfo,
      bool isRematchRejected,
      bool isRematchSent});
}

/// @nodoc
class _$IngameStateCopyWithImpl<$Res, $Val extends IngameState>
    implements $IngameStateCopyWith<$Res> {
  _$IngameStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? code = null,
    Object? baseLetters = null,
    Object? myLetters = null,
    Object? opponentLetters = null,
    Object? wordFailure = null,
    Object? rowIndex = null,
    Object? columnIndex = null,
    Object? wordLength = null,
    Object? gameId = null,
    Object? isCheckingOpponent = null,
    Object? inactivityTime = null,
    Object? hurryTime = null,
    Object? isEnemyFinished = null,
    Object? gameResult = null,
    Object? rematchRequest = null,
    Object? pregameInfo = null,
    Object? isRematchRejected = null,
    Object? isRematchSent = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      baseLetters: null == baseLetters
          ? _value.baseLetters
          : baseLetters // ignore: cast_nullable_to_non_nullable
              as List<List<Letter>>,
      myLetters: null == myLetters
          ? _value.myLetters
          : myLetters // ignore: cast_nullable_to_non_nullable
              as List<List<Letter>>,
      opponentLetters: null == opponentLetters
          ? _value.opponentLetters
          : opponentLetters // ignore: cast_nullable_to_non_nullable
              as List<List<Letter>>,
      wordFailure: null == wordFailure
          ? _value.wordFailure
          : wordFailure // ignore: cast_nullable_to_non_nullable
              as Option<ValueFailure>,
      rowIndex: null == rowIndex
          ? _value.rowIndex
          : rowIndex // ignore: cast_nullable_to_non_nullable
              as int,
      columnIndex: null == columnIndex
          ? _value.columnIndex
          : columnIndex // ignore: cast_nullable_to_non_nullable
              as int,
      wordLength: null == wordLength
          ? _value.wordLength
          : wordLength // ignore: cast_nullable_to_non_nullable
              as int,
      gameId: null == gameId
          ? _value.gameId
          : gameId // ignore: cast_nullable_to_non_nullable
              as String,
      isCheckingOpponent: null == isCheckingOpponent
          ? _value.isCheckingOpponent
          : isCheckingOpponent // ignore: cast_nullable_to_non_nullable
              as bool,
      inactivityTime: null == inactivityTime
          ? _value.inactivityTime
          : inactivityTime // ignore: cast_nullable_to_non_nullable
              as int,
      hurryTime: null == hurryTime
          ? _value.hurryTime
          : hurryTime // ignore: cast_nullable_to_non_nullable
              as int,
      isEnemyFinished: null == isEnemyFinished
          ? _value.isEnemyFinished
          : isEnemyFinished // ignore: cast_nullable_to_non_nullable
              as bool,
      gameResult: null == gameResult
          ? _value.gameResult
          : gameResult // ignore: cast_nullable_to_non_nullable
              as Option<GameResult>,
      rematchRequest: null == rematchRequest
          ? _value.rematchRequest
          : rematchRequest // ignore: cast_nullable_to_non_nullable
              as Option<Challenge>,
      pregameInfo: null == pregameInfo
          ? _value.pregameInfo
          : pregameInfo // ignore: cast_nullable_to_non_nullable
              as Option<PregameInfo>,
      isRematchRejected: null == isRematchRejected
          ? _value.isRematchRejected
          : isRematchRejected // ignore: cast_nullable_to_non_nullable
              as bool,
      isRematchSent: null == isRematchSent
          ? _value.isRematchSent
          : isRematchSent // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IngameStateImplCopyWith<$Res>
    implements $IngameStateCopyWith<$Res> {
  factory _$$IngameStateImplCopyWith(
          _$IngameStateImpl value, $Res Function(_$IngameStateImpl) then) =
      __$$IngameStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      String code,
      List<List<Letter>> baseLetters,
      List<List<Letter>> myLetters,
      List<List<Letter>> opponentLetters,
      Option<ValueFailure> wordFailure,
      int rowIndex,
      int columnIndex,
      int wordLength,
      String gameId,
      bool isCheckingOpponent,
      int inactivityTime,
      int hurryTime,
      bool isEnemyFinished,
      Option<GameResult> gameResult,
      Option<Challenge> rematchRequest,
      Option<PregameInfo> pregameInfo,
      bool isRematchRejected,
      bool isRematchSent});
}

/// @nodoc
class __$$IngameStateImplCopyWithImpl<$Res>
    extends _$IngameStateCopyWithImpl<$Res, _$IngameStateImpl>
    implements _$$IngameStateImplCopyWith<$Res> {
  __$$IngameStateImplCopyWithImpl(
      _$IngameStateImpl _value, $Res Function(_$IngameStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? code = null,
    Object? baseLetters = null,
    Object? myLetters = null,
    Object? opponentLetters = null,
    Object? wordFailure = null,
    Object? rowIndex = null,
    Object? columnIndex = null,
    Object? wordLength = null,
    Object? gameId = null,
    Object? isCheckingOpponent = null,
    Object? inactivityTime = null,
    Object? hurryTime = null,
    Object? isEnemyFinished = null,
    Object? gameResult = null,
    Object? rematchRequest = null,
    Object? pregameInfo = null,
    Object? isRematchRejected = null,
    Object? isRematchSent = null,
  }) {
    return _then(_$IngameStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      baseLetters: null == baseLetters
          ? _value._baseLetters
          : baseLetters // ignore: cast_nullable_to_non_nullable
              as List<List<Letter>>,
      myLetters: null == myLetters
          ? _value._myLetters
          : myLetters // ignore: cast_nullable_to_non_nullable
              as List<List<Letter>>,
      opponentLetters: null == opponentLetters
          ? _value._opponentLetters
          : opponentLetters // ignore: cast_nullable_to_non_nullable
              as List<List<Letter>>,
      wordFailure: null == wordFailure
          ? _value.wordFailure
          : wordFailure // ignore: cast_nullable_to_non_nullable
              as Option<ValueFailure>,
      rowIndex: null == rowIndex
          ? _value.rowIndex
          : rowIndex // ignore: cast_nullable_to_non_nullable
              as int,
      columnIndex: null == columnIndex
          ? _value.columnIndex
          : columnIndex // ignore: cast_nullable_to_non_nullable
              as int,
      wordLength: null == wordLength
          ? _value.wordLength
          : wordLength // ignore: cast_nullable_to_non_nullable
              as int,
      gameId: null == gameId
          ? _value.gameId
          : gameId // ignore: cast_nullable_to_non_nullable
              as String,
      isCheckingOpponent: null == isCheckingOpponent
          ? _value.isCheckingOpponent
          : isCheckingOpponent // ignore: cast_nullable_to_non_nullable
              as bool,
      inactivityTime: null == inactivityTime
          ? _value.inactivityTime
          : inactivityTime // ignore: cast_nullable_to_non_nullable
              as int,
      hurryTime: null == hurryTime
          ? _value.hurryTime
          : hurryTime // ignore: cast_nullable_to_non_nullable
              as int,
      isEnemyFinished: null == isEnemyFinished
          ? _value.isEnemyFinished
          : isEnemyFinished // ignore: cast_nullable_to_non_nullable
              as bool,
      gameResult: null == gameResult
          ? _value.gameResult
          : gameResult // ignore: cast_nullable_to_non_nullable
              as Option<GameResult>,
      rematchRequest: null == rematchRequest
          ? _value.rematchRequest
          : rematchRequest // ignore: cast_nullable_to_non_nullable
              as Option<Challenge>,
      pregameInfo: null == pregameInfo
          ? _value.pregameInfo
          : pregameInfo // ignore: cast_nullable_to_non_nullable
              as Option<PregameInfo>,
      isRematchRejected: null == isRematchRejected
          ? _value.isRematchRejected
          : isRematchRejected // ignore: cast_nullable_to_non_nullable
              as bool,
      isRematchSent: null == isRematchSent
          ? _value.isRematchSent
          : isRematchSent // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$IngameStateImpl extends _IngameState {
  _$IngameStateImpl(
      {required this.isLoading,
      required this.code,
      required final List<List<Letter>> baseLetters,
      required final List<List<Letter>> myLetters,
      required final List<List<Letter>> opponentLetters,
      required this.wordFailure,
      required this.rowIndex,
      required this.columnIndex,
      required this.wordLength,
      required this.gameId,
      required this.isCheckingOpponent,
      required this.inactivityTime,
      required this.hurryTime,
      required this.isEnemyFinished,
      required this.gameResult,
      required this.rematchRequest,
      required this.pregameInfo,
      required this.isRematchRejected,
      required this.isRematchSent})
      : _baseLetters = baseLetters,
        _myLetters = myLetters,
        _opponentLetters = opponentLetters,
        super._();

  @override
  final bool isLoading;
  @override
  final String code;
  final List<List<Letter>> _baseLetters;
  @override
  List<List<Letter>> get baseLetters {
    if (_baseLetters is EqualUnmodifiableListView) return _baseLetters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_baseLetters);
  }

  final List<List<Letter>> _myLetters;
  @override
  List<List<Letter>> get myLetters {
    if (_myLetters is EqualUnmodifiableListView) return _myLetters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_myLetters);
  }

  final List<List<Letter>> _opponentLetters;
  @override
  List<List<Letter>> get opponentLetters {
    if (_opponentLetters is EqualUnmodifiableListView) return _opponentLetters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_opponentLetters);
  }

  @override
  final Option<ValueFailure> wordFailure;
  @override
  final int rowIndex;
  @override
  final int columnIndex;
  @override
  final int wordLength;
  @override
  final String gameId;
  @override
  final bool isCheckingOpponent;
  @override
  final int inactivityTime;
  @override
  final int hurryTime;
  @override
  final bool isEnemyFinished;
  @override
  final Option<GameResult> gameResult;
  @override
  final Option<Challenge> rematchRequest;
  @override
  final Option<PregameInfo> pregameInfo;
  @override
  final bool isRematchRejected;
  @override
  final bool isRematchSent;

  @override
  String toString() {
    return 'IngameState(isLoading: $isLoading, code: $code, baseLetters: $baseLetters, myLetters: $myLetters, opponentLetters: $opponentLetters, wordFailure: $wordFailure, rowIndex: $rowIndex, columnIndex: $columnIndex, wordLength: $wordLength, gameId: $gameId, isCheckingOpponent: $isCheckingOpponent, inactivityTime: $inactivityTime, hurryTime: $hurryTime, isEnemyFinished: $isEnemyFinished, gameResult: $gameResult, rematchRequest: $rematchRequest, pregameInfo: $pregameInfo, isRematchRejected: $isRematchRejected, isRematchSent: $isRematchSent)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IngameStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.code, code) || other.code == code) &&
            const DeepCollectionEquality()
                .equals(other._baseLetters, _baseLetters) &&
            const DeepCollectionEquality()
                .equals(other._myLetters, _myLetters) &&
            const DeepCollectionEquality()
                .equals(other._opponentLetters, _opponentLetters) &&
            (identical(other.wordFailure, wordFailure) ||
                other.wordFailure == wordFailure) &&
            (identical(other.rowIndex, rowIndex) ||
                other.rowIndex == rowIndex) &&
            (identical(other.columnIndex, columnIndex) ||
                other.columnIndex == columnIndex) &&
            (identical(other.wordLength, wordLength) ||
                other.wordLength == wordLength) &&
            (identical(other.gameId, gameId) || other.gameId == gameId) &&
            (identical(other.isCheckingOpponent, isCheckingOpponent) ||
                other.isCheckingOpponent == isCheckingOpponent) &&
            (identical(other.inactivityTime, inactivityTime) ||
                other.inactivityTime == inactivityTime) &&
            (identical(other.hurryTime, hurryTime) ||
                other.hurryTime == hurryTime) &&
            (identical(other.isEnemyFinished, isEnemyFinished) ||
                other.isEnemyFinished == isEnemyFinished) &&
            (identical(other.gameResult, gameResult) ||
                other.gameResult == gameResult) &&
            (identical(other.rematchRequest, rematchRequest) ||
                other.rematchRequest == rematchRequest) &&
            (identical(other.pregameInfo, pregameInfo) ||
                other.pregameInfo == pregameInfo) &&
            (identical(other.isRematchRejected, isRematchRejected) ||
                other.isRematchRejected == isRematchRejected) &&
            (identical(other.isRematchSent, isRematchSent) ||
                other.isRematchSent == isRematchSent));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        isLoading,
        code,
        const DeepCollectionEquality().hash(_baseLetters),
        const DeepCollectionEquality().hash(_myLetters),
        const DeepCollectionEquality().hash(_opponentLetters),
        wordFailure,
        rowIndex,
        columnIndex,
        wordLength,
        gameId,
        isCheckingOpponent,
        inactivityTime,
        hurryTime,
        isEnemyFinished,
        gameResult,
        rematchRequest,
        pregameInfo,
        isRematchRejected,
        isRematchSent
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IngameStateImplCopyWith<_$IngameStateImpl> get copyWith =>
      __$$IngameStateImplCopyWithImpl<_$IngameStateImpl>(this, _$identity);
}

abstract class _IngameState extends IngameState {
  factory _IngameState(
      {required final bool isLoading,
      required final String code,
      required final List<List<Letter>> baseLetters,
      required final List<List<Letter>> myLetters,
      required final List<List<Letter>> opponentLetters,
      required final Option<ValueFailure> wordFailure,
      required final int rowIndex,
      required final int columnIndex,
      required final int wordLength,
      required final String gameId,
      required final bool isCheckingOpponent,
      required final int inactivityTime,
      required final int hurryTime,
      required final bool isEnemyFinished,
      required final Option<GameResult> gameResult,
      required final Option<Challenge> rematchRequest,
      required final Option<PregameInfo> pregameInfo,
      required final bool isRematchRejected,
      required final bool isRematchSent}) = _$IngameStateImpl;
  _IngameState._() : super._();

  @override
  bool get isLoading;
  @override
  String get code;
  @override
  List<List<Letter>> get baseLetters;
  @override
  List<List<Letter>> get myLetters;
  @override
  List<List<Letter>> get opponentLetters;
  @override
  Option<ValueFailure> get wordFailure;
  @override
  int get rowIndex;
  @override
  int get columnIndex;
  @override
  int get wordLength;
  @override
  String get gameId;
  @override
  bool get isCheckingOpponent;
  @override
  int get inactivityTime;
  @override
  int get hurryTime;
  @override
  bool get isEnemyFinished;
  @override
  Option<GameResult> get gameResult;
  @override
  Option<Challenge> get rematchRequest;
  @override
  Option<PregameInfo> get pregameInfo;
  @override
  bool get isRematchRejected;
  @override
  bool get isRematchSent;
  @override
  @JsonKey(ignore: true)
  _$$IngameStateImplCopyWith<_$IngameStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
