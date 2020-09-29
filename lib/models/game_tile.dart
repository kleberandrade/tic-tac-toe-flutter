import 'package:flutter/material.dart';

class GameTile {
  final int id;
  String symbol;
  Color color;
  bool enable;

  GameTile(
    this.id, {
    this.symbol = '',
    this.color = Colors.black26,
    this.enable = true,
  });
}
