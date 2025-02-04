import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';

part 'tile.g.dart';

@CopyWith()
class Tile extends Equatable{
  final int x;
  final int y;
  final bool isAlive;

  const Tile(this.x, this.y, this.isAlive);

  @override
  List<Object?> get props => [x, y, isAlive];
}