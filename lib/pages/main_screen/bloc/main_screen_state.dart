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

  @override
  List<Object?> get props => [
        tiles,
        step,
        isRunning,
        stepDurationMs,
      ];
}
