/// The only marks on a tic-tac-toe board. X always opens a round.
enum Mark {
  x,
  o;

  Mark get other => this == x ? o : x;
  String get label => name.toUpperCase();
}

const _lines = [
  [0, 1, 2], [3, 4, 5], [6, 7, 8],
  [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6],
];

/// A round and its session score. No Flutter, timers, network or persistence.
class Game {
  final List<Mark?> _cells = List.filled(9, null);
  final Map<Mark, int> _wins = {Mark.x: 0, Mark.o: 0};
  Mark _turn = Mark.x;
  Mark? _winner;
  List<int> _winningCells = const [];
  int _draws = 0;

  List<Mark?> get cells => List.unmodifiable(_cells);
  Mark get turn => _turn;
  Mark? get winner => _winner;
  List<int> get winningCells => List.unmodifiable(_winningCells);
  int get draws => _draws;
  int wins(Mark mark) => _wins[mark]!;
  bool get isDraw => _winner == null && !_cells.contains(null);
  bool get isOver => _winner != null || isDraw;

  /// Invalid coordinates are programmer errors; unavailable moves are rejected.
  bool play(int index) {
    RangeError.checkValidIndex(index, _cells);
    if (isOver || _cells[index] != null) return false;
    _cells[index] = _turn;
    _winningCells = _lineFor(_turn);
    if (_winningCells.isNotEmpty) {
      _winner = _turn;
      _wins[_turn] = wins(_turn) + 1;
    } else if (isDraw) {
      _draws++;
    } else {
      _turn = _turn.other;
    }
    return true;
  }

  List<int> _lineFor(Mark mark) {
    for (final line in _lines) {
      if (line.every((i) => _cells[i] == mark)) return line;
    }
    return const [];
  }

  void nextRound() {
    _cells.fillRange(0, 9, null);
    _turn = Mark.x;
    _winner = null;
    _winningCells = const [];
  }

  void resetScores() {
    _wins.updateAll((_, _) => 0);
    _draws = 0;
    nextRound();
  }

  /// A deterministic, casual opponent: win, block, center, then first free cell.
  /// It is deliberately beatable, not a minimax or random opponent.
  int? computerMove() {
    if (isOver) return null;
    for (final mark in [_turn, _turn.other]) {
      for (final line in _lines) {
        final empty = line.where((i) => _cells[i] == null).toList();
        if (empty.length == 1 &&
            line.where((i) => _cells[i] == mark).length == 2) {
          return empty.single;
        }
      }
    }
    if (_cells[4] == null) return 4;
    return _cells.indexOf(null);
  }
}
