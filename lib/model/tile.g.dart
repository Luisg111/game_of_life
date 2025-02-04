// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tile.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TileCWProxy {
  Tile x(int x);

  Tile y(int y);

  Tile isAlive(bool isAlive);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Tile(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Tile(...).copyWith(id: 12, name: "My name")
  /// ````
  Tile call({
    int x,
    int y,
    bool isAlive,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTile.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTile.copyWith.fieldName(...)`
class _$TileCWProxyImpl implements _$TileCWProxy {
  const _$TileCWProxyImpl(this._value);

  final Tile _value;

  @override
  Tile x(int x) => this(x: x);

  @override
  Tile y(int y) => this(y: y);

  @override
  Tile isAlive(bool isAlive) => this(isAlive: isAlive);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Tile(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Tile(...).copyWith(id: 12, name: "My name")
  /// ````
  Tile call({
    Object? x = const $CopyWithPlaceholder(),
    Object? y = const $CopyWithPlaceholder(),
    Object? isAlive = const $CopyWithPlaceholder(),
  }) {
    return Tile(
      x == const $CopyWithPlaceholder()
          ? _value.x
          // ignore: cast_nullable_to_non_nullable
          : x as int,
      y == const $CopyWithPlaceholder()
          ? _value.y
          // ignore: cast_nullable_to_non_nullable
          : y as int,
      isAlive == const $CopyWithPlaceholder()
          ? _value.isAlive
          // ignore: cast_nullable_to_non_nullable
          : isAlive as bool,
    );
  }
}

extension $TileCopyWith on Tile {
  /// Returns a callable class that can be used as follows: `instanceOfTile.copyWith(...)` or like so:`instanceOfTile.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TileCWProxy get copyWith => _$TileCWProxyImpl(this);
}
