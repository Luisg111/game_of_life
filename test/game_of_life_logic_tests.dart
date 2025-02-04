import 'package:flutter_test/flutter_test.dart';
import 'package:game_of_life/model/coordinate.dart';
import 'package:game_of_life/utility/game_of_life_logic.dart';

void main() {
  test('count neighbours, no neighbours are alive', () {
    Map<Coordinates, bool> playfield = {
      Coordinates(x: 0, y: 0): false,
      Coordinates(x: 1, y: 0): false,
      Coordinates(x: 2, y: 0): false,
      Coordinates(x: 0, y: 1): false,
      Coordinates(x: 1, y: 1): false,
      Coordinates(x: 2, y: 1): false,
      Coordinates(x: 0, y: 2): false,
      Coordinates(x: 1, y: 2): false,
      Coordinates(x: 2, y: 2): false,
    };

    var sizeX = 3;
    var sizeY = 3;

    var neighbours = GameOfLifeLogic.countNeighbours(
        playField: playfield, tile: Coordinates(x: 1, y: 1), sizeX: sizeX, sizeY: sizeY);

    expect(neighbours, 0);
  });

  test('count neighbours, all neighbours are alive', () {
    Map<Coordinates, bool> playfield = {
      Coordinates(x: 0, y: 0): true,
      Coordinates(x: 1, y: 0): true,
      Coordinates(x: 2, y: 0): true,
      Coordinates(x: 0, y: 1): true,
      Coordinates(x: 1, y: 1): true,
      Coordinates(x: 2, y: 1): true,
      Coordinates(x: 0, y: 2): true,
      Coordinates(x: 1, y: 2): true,
      Coordinates(x: 2, y: 2): true,
    };

    var sizeX = 3;
    var sizeY = 3;

    var neighbours = GameOfLifeLogic.countNeighbours(
        playField: playfield, tile: Coordinates(x: 1, y: 1), sizeX: sizeX, sizeY: sizeY);

    expect(neighbours, 8);
  });

  test('field should not count itself', () {
    Map<Coordinates, bool> playfield = {
      Coordinates(x: 0, y: 0): false,
      Coordinates(x: 1, y: 0): false,
      Coordinates(x: 2, y: 0): false,
      Coordinates(x: 0, y: 1): false,
      Coordinates(x: 1, y: 1): true,
      Coordinates(x: 2, y: 1): false,
      Coordinates(x: 0, y: 2): false,
      Coordinates(x: 1, y: 2): false,
      Coordinates(x: 2, y: 2): false,
    };

    var sizeX = 3;
    var sizeY = 3;

    var neighbours = GameOfLifeLogic.countNeighbours(
        playField: playfield, tile: Coordinates(x: 1, y: 1), sizeX: sizeX, sizeY: sizeY);

    expect(neighbours, 0);
  });

  test('field on edge of playfield', () {
    Map<Coordinates, bool> playfield = {
      Coordinates(x: 0, y: 0): false,
      Coordinates(x: 1, y: 0): false,
      Coordinates(x: 2, y: 0): false,
      Coordinates(x: 0, y: 1): false,
      Coordinates(x: 1, y: 1): true,
      Coordinates(x: 2, y: 1): false,
      Coordinates(x: 0, y: 2): false,
      Coordinates(x: 1, y: 2): false,
      Coordinates(x: 2, y: 2): false,
    };

    var sizeX = 3;
    var sizeY = 3;

    var neighbours = GameOfLifeLogic.countNeighbours(
        playField: playfield, tile: Coordinates(x: 2, y: 2), sizeX: sizeX, sizeY: sizeY);

    expect(neighbours, 1);
  });
}
