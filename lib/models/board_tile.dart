import 'package:flutter/material.dart';

class BoardTile {
  final int id;
  String symbol;
  Color color;
  bool enable;

  BoardTile(
    this.id, {
    this.symbol = '',
    this.color = Colors.black26,
    this.enable = true,
  });
}
