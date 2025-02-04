part of "main_screen_bloc.dart";

@CopyWith()
class MainScreenState extends Equatable {
  final Map<Coordinates, bool> tiles;
  final bool isRunning;
  final int step;
  final int stepDurationMs;

  const MainScreenState({
    this.tiles = const {},
    this.step = 0,
    this.isRunning = false,
    this.stepDurationMs = 1000,
  });

  factory MainScreenState.empty() {
    final tiles = <Coordinates, bool>{};
    for (var i = 0; i < sizeX; i++) {
      for (var j = 0; j < sizeY; j++) {
        tiles[Coordinates(x: i, y: j)] = false;
      }
    }
    return MainScreenState(
      tiles: tiles,
      step: 0,
      stepDurationMs: 1000,
      isRunning: false,
    );
  }

  @override
  List<Object?> get props => [
        tiles,
        step,
        isRunning,
        stepDurationMs,
      ];
}
