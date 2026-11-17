import 'dart:io';

import 'package:tictactoe/domain/game.dart';

/// Safe, deterministic classroom example; no device or personal data required.
void main() {
  final game = Game();
  for (final cell in [0, 3, 1, 4, 2]) {
    if (!game.play(cell)) throw StateError('Example move was rejected');
  }
  if (game.winner != Mark.x || game.wins(Mark.x) != 1) {
    throw StateError('Expected one X win');
  }
  stdout.writeln(
    'X wins the top row. Score: X=${game.wins(Mark.x)}, O=${game.wins(Mark.o)}',
  );
  game.nextRound();
  stdout.writeln('New round: ${game.turn.label} starts; score is preserved.');
}
