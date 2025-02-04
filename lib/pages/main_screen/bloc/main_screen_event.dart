part of  "main_screen_bloc.dart";

sealed class MainScreenEvent {}

class MainScreenPlayPressed extends MainScreenEvent {
  MainScreenPlayPressed();
}

class MainScreenAdvanceSingleStep extends MainScreenEvent {
  MainScreenAdvanceSingleStep();
}

class MainScreenResetPressed extends MainScreenEvent {
  MainScreenResetPressed();
}