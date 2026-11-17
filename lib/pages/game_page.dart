import 'package:material_ui/material_ui.dart';
import 'package:flutter/services.dart';

import '../domain/game.dart';

const _ink = Color(0xFF202D2B);
const _teal = Color(0xFF146B60);
const _rust = Color(0xFFAA432D);

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  final _game = Game();
  bool _computer = false;

  void _play(int index) {
    setState(() {
      if (!_game.play(index)) return;
      if (_computer && !_game.isOver && _game.turn == Mark.o) {
        final reply = _game.computerMove();
        if (reply != null) _game.play(reply);
      }
    });
  }

  String get _status {
    if (_game.winner != null) return '${_game.winner!.label} wins!';
    if (_game.isDraw) return 'A well-played draw';
    return '${_game.turn.label}, your move';
  }

  @override
  Widget build(BuildContext context) => CallbackShortcuts(
    bindings: {
      for (var i = 0; i < 9; i++)
        SingleActivator(_numberKeys[i]): () => _play(i),
    },
    child: Focus(
      autofocus: true,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1080),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Icon(Icons.grid_3x3_rounded, color: _teal, size: 28),
                          SizedBox(width: 10),
                          Text(
                            'PLAY / CLASSICS',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              letterSpacing: 2,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),
                    LayoutBuilder(
                      builder: (context, constraints) {
                        if (constraints.maxWidth >= 800) {
                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(child: _intro()),
                              const SizedBox(width: 64),
                              Expanded(child: _arena()),
                            ],
                          );
                        }
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Tic Tac Toe',
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            const SizedBox(height: 24),
                            _mode(),
                            const SizedBox(height: 24),
                            _arena(),
                            const SizedBox(height: 32),
                            _intro(showMode: false),
                          ],
                        );
                      },
                    ),
                    const SizedBox(height: 32),
                    const Text(
                      'Made for a little friendly competition.',
                      style: TextStyle(color: Color(0xFF50605B)),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );

  Widget _intro({bool showMode = true}) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        'Simple game.\nGood company.',
        style: TextStyle(
          fontSize: 48,
          height: 1.08,
          fontWeight: FontWeight.w800,
          letterSpacing: -2,
        ),
      ),
      const SizedBox(height: 20),
      const Text(
        'Tic Tac Toe',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
      ),
      const SizedBox(height: 12),
      const Text(
        'Three in a row. One shared board.\nTake turns with a friend, or challenge the computer.',
        style: TextStyle(fontSize: 17, height: 1.6),
      ),
      const SizedBox(height: 28),
      if (showMode) _mode(),
      const SizedBox(height: 28),
      Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFFD2D8CE)),
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'A small guide',
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 8),
            Text(
              'Connect three marks across, down or diagonally. Each finished round adds to the score.',
              style: TextStyle(height: 1.6),
            ),
            SizedBox(height: 12),
            Text(
              'Keyboard: 1–9 selects a cell, from top left to bottom right. Or use Tab and Enter / Space.',
              style: TextStyle(height: 1.6),
            ),
          ],
        ),
      ),
    ],
  );

  Widget _mode() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Wrap(
        spacing: 8,
        runSpacing: 8,
        children: [
          for (final mode in [false, true])
            ChoiceChip(
              label: Text(mode ? 'Computer' : 'Two players'),
              avatar: Icon(
                mode ? Icons.smart_toy_outlined : Icons.people_outline,
                size: 18,
              ),
              selected: _computer == mode,
              onSelected: (_) => setState(() {
                if (_computer == mode) return;
                _computer = mode;
                _game.resetScores();
              }),
            ),
        ],
      ),
      const SizedBox(height: 12),
      Text(
        _computer
            ? 'You are X. The computer is O. A casual, beatable opponent.'
            : 'X goes first. Pass the turn to O after each move.',
        style: const TextStyle(height: 1.5),
      ),
    ],
  );

  Widget _arena() => ConstrainedBox(
    constraints: const BoxConstraints(maxWidth: 500),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Wrap(
          alignment: WrapAlignment.spaceBetween,
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 16,
          runSpacing: 8,
          children: [
            Semantics(
              liveRegion: true,
              header: true,
              child: Text(
                _status,
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Text(
              _game.isOver ? 'ROUND COMPLETE' : 'LET’S PLAY',
              style: const TextStyle(
                fontSize: 11,
                letterSpacing: 1.5,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Text(
          _game.isOver
              ? 'Keep the score. Start a fresh board when you’re ready.'
              : 'Choose an empty square to place your mark.',
          style: const TextStyle(height: 1.5),
        ),
        const SizedBox(height: 20),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: _ink,
            borderRadius: BorderRadius.circular(28),
          ),
          child: GridView.count(
            crossAxisCount: 3,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: List.generate(9, _cell),
          ),
        ),
        const SizedBox(height: 20),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          alignment: WrapAlignment.spaceBetween,
          children: [
            _score('X wins', _game.wins(Mark.x), _teal),
            _score('Draws', _game.draws, _ink),
            _score('O wins', _game.wins(Mark.o), _rust),
          ],
        ),
        const SizedBox(height: 20),
        FilledButton.icon(
          onPressed: () => setState(_game.nextRound),
          icon: const Icon(Icons.refresh_rounded),
          label: Text(_game.isOver ? 'Play again' : 'Restart round'),
        ),
        const SizedBox(height: 8),
        TextButton(
          onPressed: () => setState(_game.resetScores),
          child: const Text('Reset scores'),
        ),
        const Text(
          'Scores stay for this session. Changing mode resets them.',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 12, height: 1.5),
        ),
      ],
    ),
  );

  Widget _score(String label, int score, Color color) => Semantics(
    label: '$label: $score',
    excludeSemantics: true,
    child: Column(
      children: [
        Text(
          '$score',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w800,
            color: color,
          ),
        ),
        Text(
          label,
          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
        ),
      ],
    ),
  );

  Widget _cell(int index) {
    final mark = _game.cells[index];
    final winning = _game.winningCells.contains(index);
    final available = mark == null && !_game.isOver;
    return Semantics(
      label:
          'Row ${index ~/ 3 + 1}, column ${index % 3 + 1}: ${mark?.label ?? 'empty'}${winning ? ', winning cell' : ''}',
      button: true,
      enabled: available,
      onTap: available ? () => _play(index) : null,
      excludeSemantics: true,
      child: FilledButton(
        key: ValueKey('cell-$index'),
        onPressed: available ? () => _play(index) : null,
        style: ButtonStyle(
          padding: const WidgetStatePropertyAll(EdgeInsets.zero),
          backgroundColor: WidgetStatePropertyAll(
            winning ? const Color(0xFFC6E5C9) : const Color(0xFFFFFCF5),
          ),
          foregroundColor: WidgetStatePropertyAll(
            mark == Mark.o ? _rust : _teal,
          ),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          ),
          side: WidgetStateProperty.resolveWith(
            (states) => BorderSide(
              color: states.contains(WidgetState.focused)
                  ? _rust
                  : Colors.transparent,
              width: 4,
            ),
          ),
        ),
        child: FittedBox(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              mark?.label ?? '',
              textScaler: TextScaler.noScaling,
              style: const TextStyle(fontSize: 60, fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }
}

const _numberKeys = [
  LogicalKeyboardKey.digit1,
  LogicalKeyboardKey.digit2,
  LogicalKeyboardKey.digit3,
  LogicalKeyboardKey.digit4,
  LogicalKeyboardKey.digit5,
  LogicalKeyboardKey.digit6,
  LogicalKeyboardKey.digit7,
  LogicalKeyboardKey.digit8,
  LogicalKeyboardKey.digit9,
];
