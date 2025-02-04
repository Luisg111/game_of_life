import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';

import '../../../model/tile.dart';

part 'main_screen_bloc.g.dart';

part 'main_screen_state.dart';

part 'main_screen_event.dart';

class MainScreenBloc extends Bloc<MainScreenEvent, MainScreenState> {
  MainScreenBloc() : super(const MainScreenState()){
    on<MainScreenPlayPressed>(_onMainScreenPlayPressed);
    on<MainScreenAdvanceSingleStep>(_onMainScreenAdvanceSingleStep);
    on<MainScreenResetPressed>(_onMainScreenResetPressed);
  }

  void _onMainScreenPlayPressed(MainScreenPlayPressed event, Emitter<MainScreenState> emit) {
    emit(state.copyWith(isRunning: !state.isRunning));
  }

  void _onMainScreenAdvanceSingleStep(MainScreenAdvanceSingleStep event, Emitter<MainScreenState> emit) {

  }

  void _onMainScreenResetPressed(MainScreenResetPressed event, Emitter<MainScreenState> emit) {
    emit(const MainScreenState());
  }
}