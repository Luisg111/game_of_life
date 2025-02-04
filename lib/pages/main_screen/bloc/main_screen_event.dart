part of "main_screen_bloc.dart";

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

class MainScreenTileKlicked extends MainScreenEvent {
  final Coordinates coordinates;

  MainScreenTileKlicked(this.coordinates);
}

class MainScreenAutoplaySpeedChanged extends MainScreenEvent {
  final int newValue;

  MainScreenAutoplaySpeedChanged(this.newValue);
}
