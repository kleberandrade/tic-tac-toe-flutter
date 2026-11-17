import 'package:flutter_test/flutter_test.dart';
import 'package:tictactoe/domain/game.dart';

void main() {
  const lines = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8],
    [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6],
  ];
  for (final line in lines) {
    for (final winner in Mark.values) {
      test('$winner wins on $line; round scores once and then locks', () {
        final game = Game();
        final fillers = List.generate(9, (i) => i)
            .where((i) => !line.contains(i)).toList();
        for (var i = 0; i < 3; i++) {
          if (winner == Mark.o) game.play(i == 2 ? fillers.last : fillers[i]);
          game.play(line[i]);
          if (winner == Mark.x && i < 2) game.play(i == 2 ? fillers.last : fillers[i]);
        }
        expect(game.winner, winner);
        expect(game.winningCells, line);
        expect(game.isOver, isTrue);
        expect(game.wins(winner), 1);
        expect(game.play(fillers.last), isFalse);
        expect(game.wins(winner), 1);
      });
    }
  }
  test('turns alternate; occupied cells and invalid indices do not change state', () {
    final game = Game();
    expect(game.turn, Mark.x);
    expect(game.play(4), isTrue);
    expect(game.turn, Mark.o);
    expect(game.play(4), isFalse);
    expect(game.turn, Mark.o);
    expect(() => game.play(-1), throwsRangeError);
    expect(() => game.play(9), throwsRangeError);
    expect(() => game.cells[0] = Mark.x, throwsUnsupportedError);
    expect(game.play(0), isTrue);
    expect(game.turn, Mark.x);
  });
  test('draw, next round and reset scores have distinct behavior', () {
    final game = Game();
    for (final move in [0, 1, 2, 4, 3, 5, 7, 6, 8]) {
      expect(game.play(move), isTrue);
    }
    expect(game.isDraw, isTrue);
    expect(game.draws, 1);
    expect(game.play(0), isFalse);
    expect(game.draws, 1);
    game.nextRound();
    expect(game.cells, everyElement(isNull));
    expect(game.turn, Mark.x);
    expect(game.draws, 1);
    expect(game.isOver, isFalse);
    for (final move in [0, 3, 1, 4, 2]) { game.play(move); }
    game.nextRound();
    expect(game.wins(Mark.x), 1);
    expect(game.winningCells, isEmpty);
    game.resetScores();
    expect(game.wins(Mark.x), 0);
    expect(game.wins(Mark.o), 0);
    expect(game.draws, 0);
    expect(game.cells, everyElement(isNull));
  });
  test('computer chooses legal moves, including the last cell, and stops at end', () {
    final game = Game();
    for (final move in [0, 1, 2, 4, 3, 5, 7, 6]) { game.play(move); }
    expect(game.computerMove(), 8);
    game.play(8);
    expect(game.computerMove(), isNull);
    game.nextRound();
    expect(game.computerMove(), inInclusiveRange(0, 8));
  });
  test('computer takes a win and blocks an immediate loss', () {
    final game = Game();
    for (final move in [0, 3, 8, 4, 1]) { game.play(move); }
    expect(game.computerMove(), 5);
    game.nextRound();
    for (final move in [0, 4, 1]) { game.play(move); }
    expect(game.computerMove(), 2);
  });
}
