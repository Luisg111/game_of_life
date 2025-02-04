import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';

import '../../../model/coordinate.dart';

part 'main_screen_bloc.g.dart';

part 'main_screen_state.dart';

part 'main_screen_event.dart';

const int sizeX = 30;
const int sizeY = 30;

class MainScreenBloc extends Bloc<MainScreenEvent, MainScreenState> {
  Timer? autoPlayTimer;

  MainScreenBloc() : super(MainScreenState.empty()) {
    on<MainScreenPlayPressed>(_onMainScreenPlayPressed);
    on<MainScreenAdvanceSingleStep>(_onMainScreenAdvanceSingleStep);
    on<MainScreenResetPressed>(_onMainScreenResetPressed);
    on<MainScreenTileKlicked>(_onMainScreenTileKlicked);
    on<MainScreenAutoplaySpeedChanged>(_onMainScreenAutoplaySpeedChanged);
  }

  void _onMainScreenAutoplaySpeedChanged(MainScreenAutoplaySpeedChanged event, Emitter<MainScreenState> emit) {
    emit(state.copyWith(stepDurationMs: event.newValue));
  }

  void _onMainScreenTileKlicked(MainScreenTileKlicked event, Emitter<MainScreenState> emit) {
    final tiles = Map.of(state.tiles);
    final coordinates = event.coordinates;
    tiles[coordinates] = !tiles[coordinates]!;
    emit(state.copyWith(tiles: tiles));
  }

  void _onMainScreenPlayPressed(MainScreenPlayPressed event, Emitter<MainScreenState> emit) {
    if (state.isRunning) {
      _stopAutoplay();
    } else {
      _startAutoplay();
    }
    emit(state.copyWith(isRunning: !state.isRunning));
  }

  void _onMainScreenAdvanceSingleStep(MainScreenAdvanceSingleStep event, Emitter<MainScreenState> emit) {
    _continueStep(emit);
  }

  void _onMainScreenResetPressed(MainScreenResetPressed event, Emitter<MainScreenState> emit) {
    emit(MainScreenState.empty());
  }

  void _startAutoplay() {
    //cancel old timer if it is still running
    autoPlayTimer?.cancel();
    //advance manually before timer starts (timer waits first and then calls callback)
    add(MainScreenAdvanceSingleStep());
    autoPlayTimer = Timer.periodic(Duration(milliseconds: state.stepDurationMs), (timer) {
      add(MainScreenAdvanceSingleStep());
    });
  }

  void _stopAutoplay() {
    autoPlayTimer?.cancel();
    autoPlayTimer == null;
  }

  void _continueStep(Emitter<MainScreenState> emit) {
    var tiles = Map.of(state.tiles);
    //remember old tiles for state determination
    var oldTiles = state.tiles;
    for (int x = 0; x <= sizeX; x++) {
      for (int y = 0; y <= sizeY; y++) {
        var pos = Coordinates(x: x, y: y);
        var neighbourCount = _countNeighbours(pos);
        if (oldTiles[pos] == true) {
          if (neighbourCount == 2 || neighbourCount == 3) {
            continue;
          } else {
            tiles[pos] = false;
          }
        } else {
          if (neighbourCount == 3) {
            tiles[pos] = true;
          } else {
            continue;
          }
        }
      }
    }
    emit(state.copyWith(tiles: tiles, step: state.step + 1));
  }

  int _countNeighbours(Coordinates tile) {
    int neighbours = 0;
    for (int x = -1; x <= 1; x++) {
      for (int y = -1; y <= 1; y++) {
        var currentTile = Coordinates(x: (tile.x + x) % sizeX, y: (tile.y + y) % sizeY);
        //tile would check itself => continue
        if (tile == currentTile) {
          continue;
        }

        if (state.tiles[currentTile] ?? false) {
          neighbours++;
        }
      }
    }
    return neighbours;
  }
}
