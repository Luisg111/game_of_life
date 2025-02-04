part of  "main_screen_bloc.dart";

sealed class MainScreenEvent {}

class MainScreenInitialize extends MainScreenEvent {
  MainScreenInitialize();
}

class MainScreenPlayPressed extends MainScreenEvent {
  MainScreenPlayPressed();
}

class MainScreenAdvanceSingleStep extends MainScreenEvent {
  MainScreenAdvanceSingleStep();
}

class MainScreenResetPressed extends MainScreenEvent {
  MainScreenResetPressed();
}

class MainScreenTileKlicked extends MainScreenEvent {
  final Coordinates coordinates;

  MainScreenTileKlicked(this.coordinates);
}