import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';

part "coordinate.g.dart";

@CopyWith()
class Coordinates extends Equatable {
  final int x;
  final int y;

  const Coordinates({required this.x, required this.y});

  @override
  List<Object?> get props => [x, y];
}