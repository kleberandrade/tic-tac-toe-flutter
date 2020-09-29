import 'package:tictactoe/core/constants.dart';
import 'package:tictactoe/enums/player_type.dart';
import 'package:tictactoe/enums/winner_type.dart';
import 'package:tictactoe/models/game_tile.dart';

class GameController {
  List<GameTile> tiles = [];
  List<int> movesPlayer1 = [];
  List<int> movesPlayer2 = [];
  PlayerType currentPlayer;
  bool isSinglePlayer;

  bool get hasMoves =>
      (movesPlayer1.length + movesPlayer2.length) != BOARD_SIZE;

  GameController() {
    initialize();
  }

  void initialize() {
    movesPlayer1.clear();
    movesPlayer2.clear();
    currentPlayer = PlayerType.player1;
    isSinglePlayer = false;
    tiles = List<GameTile>.generate(BOARD_SIZE, (index) => GameTile(index + 1));
  }

  void mark(GameTile tile) {
    if (currentPlayer == PlayerType.player1) {
      tile.symbol = PLAYER1_SYMBOL;
      tile.color = PLAYER1_COLOR;
      movesPlayer1.add(tile.id);
      currentPlayer = PlayerType.player2;
    } else {
      tile.symbol = PLAYER2_SYMBOL;
      tile.color = PLAYER2_COLOR;
      movesPlayer2.add(tile.id);
      currentPlayer = PlayerType.player1;
    }

    tile.enable = false;
  }

  bool _checkPlayerWinner(List<int> moves) {
    // Check rows
    if (moves.contains(1) && moves.contains(2) && moves.contains(3))
      return true;
    if (moves.contains(4) && moves.contains(5) && moves.contains(6))
      return true;
    if (moves.contains(7) && moves.contains(8) && moves.contains(9))
      return true;
    // Check columns
    if (moves.contains(1) && moves.contains(4) && moves.contains(7))
      return true;
    if (moves.contains(2) && moves.contains(5) && moves.contains(8))
      return true;
    if (moves.contains(3) && moves.contains(6) && moves.contains(9))
      return true;
    // Check diagonals
    if (moves.contains(1) && moves.contains(5) && moves.contains(9))
      return true;
    if (moves.contains(3) && moves.contains(5) && moves.contains(7))
      return true;

    return false;
  }

  WinnerType checkWinner() {
    if (_checkPlayerWinner(movesPlayer1)) return WinnerType.player1;
    if (_checkPlayerWinner(movesPlayer2)) return WinnerType.player2;
    return WinnerType.none;
  }
}
