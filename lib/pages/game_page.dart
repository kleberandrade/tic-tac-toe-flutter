import 'package:flutter/material.dart';
import 'package:tictactoe/controllers/game_controller.dart';
import 'package:tictactoe/core/constants.dart';
import 'package:tictactoe/dialogs/custom_dialog.dart';
import 'package:tictactoe/enums/winner_type.dart';
import 'package:tictactoe/models/game_tile.dart';

class GamePage extends StatefulWidget {
  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  final _controller = GameController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  _buildAppBar() {
    return AppBar(
      title: Text(GAME_TITLE),
      centerTitle: true,
    );
  }

  _buildBody() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildBoard(),
          _buildPlayerMode(),
          _buildResetButton(),
        ],
      ),
    );
  }

  _buildResetButton() {
    return RaisedButton(
      padding: const EdgeInsets.all(20),
      child: Text(RESET_BUTTON_LABEL),
      onPressed: _onResetGame,
    );
  }

  _buildBoard() {
    return Expanded(
      child: GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: BOARD_SIZE,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          final tile = _controller.tiles[index];
          return _buildTile(tile);
        },
      ),
    );
  }

  _buildTile(GameTile tile) {
    return GestureDetector(
      onTap: () => _onMarkTile(tile),
      child: Container(
        color: tile.color,
        child: Center(
          child: Text(
            tile.symbol,
            style: TextStyle(
              fontSize: 72.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  _onResetGame() {
    setState(() {
      _controller.initialize();
    });
  }

  _onMarkTile(GameTile tile) {
    if (!tile.enable) return;

    setState(() {
      _controller.mark(tile);
    });

    _checkWinner();
  }

  _checkWinner() {
    var winner = _controller.checkWinner();
    if (winner == WinnerType.none) {
      if (!_controller.hasMoves) {
        _showTiedDialog();
      }
    } else {
      String symbol =
          winner == WinnerType.player1 ? PLAYER1_SYMBOL : PLAYER2_SYMBOL;
      _showWinnerDialog(symbol);
    }
  }

  _showWinnerDialog(String symbol) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return CustomDialog(
          title: WIN_TITLE.replaceAll('[SYMBOL]', symbol),
          message: DIALOG_MESSAGE,
          onPressed: _onResetGame,
        );
      },
    );
  }

  _showTiedDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return CustomDialog(
          title: TIED_TITLE,
          message: DIALOG_MESSAGE,
          onPressed: _onResetGame,
        );
      },
    );
  }

  _buildPlayerMode() {
    return Container();
  }
}
