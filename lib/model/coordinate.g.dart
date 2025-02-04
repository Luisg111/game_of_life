// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coordinate.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CoordinatesCWProxy {
  Coordinates x(int x);

  Coordinates y(int y);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Coordinates(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Coordinates(...).copyWith(id: 12, name: "My name")
  /// ````
  Coordinates call({
    int x,
    int y,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCoordinates.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCoordinates.copyWith.fieldName(...)`
class _$CoordinatesCWProxyImpl implements _$CoordinatesCWProxy {
  const _$CoordinatesCWProxyImpl(this._value);

  final Coordinates _value;

  @override
  Coordinates x(int x) => this(x: x);

  @override
  Coordinates y(int y) => this(y: y);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Coordinates(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Coordinates(...).copyWith(id: 12, name: "My name")
  /// ````
  Coordinates call({
    Object? x = const $CopyWithPlaceholder(),
    Object? y = const $CopyWithPlaceholder(),
  }) {
    return Coordinates(
      x: x == const $CopyWithPlaceholder()
          ? _value.x
          // ignore: cast_nullable_to_non_nullable
          : x as int,
      y: y == const $CopyWithPlaceholder()
          ? _value.y
          // ignore: cast_nullable_to_non_nullable
          : y as int,
    );
  }
}

extension $CoordinatesCopyWith on Coordinates {
  /// Returns a callable class that can be used as follows: `instanceOfCoordinates.copyWith(...)` or like so:`instanceOfCoordinates.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CoordinatesCWProxy get copyWith => _$CoordinatesCWProxyImpl(this);
}
