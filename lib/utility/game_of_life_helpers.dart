import '../model/coordinate.dart';

abstract class GameOfLifeHelpers {
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
}
