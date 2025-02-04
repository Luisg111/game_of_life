import '../model/coordinate.dart';

abstract class GameOfLifeLogic {
  static int countNeighbours({
    required Map<Coordinates, bool> playField,
    required Coordinates tile,
    required int sizeX,
    required int sizeY,
  }) {
    int neighbours = 0;
    for (int x = -1; x <= 1; x++) {
      for (int y = -1; y <= 1; y++) {
        var currentTile = Coordinates(x: (tile.x + x) % sizeX, y: (tile.y + y) % sizeY);
        //tile would check itself => continue
        if (tile == currentTile) {
          continue;
        }

        if (playField[currentTile] ?? false) {
          neighbours++;
        }
      }
    }
    return neighbours;
  }

  static void continueStep({
    required Map<Coordinates, bool> playField,
    required int sizeX,
    required int sizeY,
  }) {
    var tiles = playField;
    //remember old tiles for state determination
    var oldTiles = Map.of(tiles);
    for (int x = 0; x <= sizeX; x++) {
      for (int y = 0; y <= sizeY; y++) {
        var pos = Coordinates(x: x, y: y);
        var neighbourCount = GameOfLifeLogic.countNeighbours(
          playField: oldTiles,
          tile: pos,
          sizeX: sizeX,
          sizeY: sizeY,
        );
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
  }
}
