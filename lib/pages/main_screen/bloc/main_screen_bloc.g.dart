// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_screen_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$MainScreenStateCWProxy {
  MainScreenState tiles(Map<Coordinates, bool> tiles);

  MainScreenState step(int step);

  MainScreenState isRunning(bool isRunning);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MainScreenState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MainScreenState(...).copyWith(id: 12, name: "My name")
  /// ````
  MainScreenState call({
    Map<Coordinates, bool> tiles,
    int step,
    bool isRunning,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfMainScreenState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfMainScreenState.copyWith.fieldName(...)`
class _$MainScreenStateCWProxyImpl implements _$MainScreenStateCWProxy {
  const _$MainScreenStateCWProxyImpl(this._value);

  final MainScreenState _value;

  @override
  MainScreenState tiles(Map<Coordinates, bool> tiles) => this(tiles: tiles);

  @override
  MainScreenState step(int step) => this(step: step);

  @override
  MainScreenState isRunning(bool isRunning) => this(isRunning: isRunning);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MainScreenState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MainScreenState(...).copyWith(id: 12, name: "My name")
  /// ````
  MainScreenState call({
    Object? tiles = const $CopyWithPlaceholder(),
    Object? step = const $CopyWithPlaceholder(),
    Object? isRunning = const $CopyWithPlaceholder(),
  }) {
    return MainScreenState(
      tiles: tiles == const $CopyWithPlaceholder()
          ? _value.tiles
          // ignore: cast_nullable_to_non_nullable
          : tiles as Map<Coordinates, bool>,
      step: step == const $CopyWithPlaceholder()
          ? _value.step
          // ignore: cast_nullable_to_non_nullable
          : step as int,
      isRunning: isRunning == const $CopyWithPlaceholder()
          ? _value.isRunning
          // ignore: cast_nullable_to_non_nullable
          : isRunning as bool,
    );
  }
}

extension $MainScreenStateCopyWith on MainScreenState {
  /// Returns a callable class that can be used as follows: `instanceOfMainScreenState.copyWith(...)` or like so:`instanceOfMainScreenState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$MainScreenStateCWProxy get copyWith => _$MainScreenStateCWProxyImpl(this);
}
