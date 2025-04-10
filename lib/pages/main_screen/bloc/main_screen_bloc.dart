import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';

import '../../../model/coordinate.dart';
import '../../../utility/game_of_life_logic.dart';

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

  void _onMainScreenAutoplaySpeedChanged(
      MainScreenAutoplaySpeedChanged event, Emitter<MainScreenState> emit) {
    emit(state.copyWith(stepDurationMs: event.newValue));
    if (state.isRunning) {
      _startAutoplay();
    }
  }

  void _onMainScreenTileKlicked(
      MainScreenTileKlicked event, Emitter<MainScreenState> emit) {
    final tiles = Map.of(state.tiles);
    final coordinates = event.coordinates;
    tiles[coordinates] = !tiles[coordinates]!;
    emit(state.copyWith(tiles: tiles));
  }

  void _onMainScreenPlayPressed(
      MainScreenPlayPressed event, Emitter<MainScreenState> emit) {
    if (state.isRunning) {
      _stopAutoplay();
    } else {
      _startAutoplay();
    }
    emit(state.copyWith(isRunning: !state.isRunning));
  }

  void _onMainScreenAdvanceSingleStep(
      MainScreenAdvanceSingleStep event, Emitter<MainScreenState> emit) {
    GameOfLifeLogic.continueStep(
        playField: state.tiles, sizeX: sizeX, sizeY: sizeY);
    emit(state.copyWith(tiles: state.tiles, step: (state.step) + 1));
  }

  void _onMainScreenResetPressed(
      MainScreenResetPressed event, Emitter<MainScreenState> emit) {
    emit(MainScreenState.empty());
  }

  void _startAutoplay() {
    //cancel old timer if it is still running
    autoPlayTimer?.cancel();
    //advance manually before timer starts (timer waits first and then calls callback)
    add(MainScreenAdvanceSingleStep());
    autoPlayTimer =
        Timer.periodic(Duration(milliseconds: state.stepDurationMs), (timer) {
      add(MainScreenAdvanceSingleStep());
    });
  }

  void _stopAutoplay() {
    autoPlayTimer?.cancel();
    autoPlayTimer == null;
  }
}
