part of "main_screen_bloc.dart";

@CopyWith()
class MainScreenState extends Equatable {
  final Map<Coordinates,bool> tiles;
  final bool isRunning;
  final int step;

  const MainScreenState({
    this.tiles = const {},
    this.step = 0,
    this.isRunning = false,
  });

  @override
  List<Object?> get props => [
        tiles,
        step,
        isRunning,
      ];
}
