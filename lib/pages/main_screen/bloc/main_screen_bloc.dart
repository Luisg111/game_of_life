import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';

import '../../../model/coordinate.dart';
import '../../../model/tile.dart';

part 'main_screen_bloc.g.dart';

part 'main_screen_state.dart';

part 'main_screen_event.dart';

const int sizeX = 20;
const int sizeY = 20;

class MainScreenBloc extends Bloc<MainScreenEvent, MainScreenState> {
  MainScreenBloc() : super(const MainScreenState()) {
    on<MainScreenPlayPressed>(_onMainScreenPlayPressed);
    on<MainScreenAdvanceSingleStep>(_onMainScreenAdvanceSingleStep);
    on<MainScreenResetPressed>(_onMainScreenResetPressed);
    on<MainScreenTileKlicked>(_onMainScreenTileKlicked);
    on<MainScreenInitialize>(_initialize);
  }

  void _initialize(MainScreenInitialize event, Emitter<MainScreenState> emit) {
    _initializeTiles(emit);
  }

  void _onMainScreenTileKlicked(MainScreenTileKlicked event, Emitter<MainScreenState> emit) {
    print('Tile clicked: ${event.coordinates}');
    final tiles = Map.of(state.tiles);
    final coordinates = event.coordinates;
    tiles[coordinates] = !tiles[coordinates]!;
    emit(state.copyWith(tiles: tiles));
  }

  void _onMainScreenPlayPressed(MainScreenPlayPressed event, Emitter<MainScreenState> emit) {
    emit(state.copyWith(isRunning: !state.isRunning));
  }

  void _onMainScreenAdvanceSingleStep(MainScreenAdvanceSingleStep event, Emitter<MainScreenState> emit) {}

  void _onMainScreenResetPressed(MainScreenResetPressed event, Emitter<MainScreenState> emit) {
    final tiles = <Coordinates, bool>{};
    for (var i = 0; i < sizeX; i++) {
      for (var j = 0; j < sizeY; j++) {
        tiles[Coordinates(x: i, y: j)] = false;
      }
    }
    emit(state.copyWith(
      tiles: tiles,
      isRunning: false,
      step: 0,
    ));
  }

  void _initializeTiles(Emitter<MainScreenState> emit) {
    final tiles = <Coordinates, bool>{};
    for (var i = 0; i < sizeX; i++) {
      for (var j = 0; j < sizeY; j++) {
        tiles[Coordinates(x: i, y: j)] = false;
      }
    }
    emit(state.copyWith(tiles: tiles));
  }
}
