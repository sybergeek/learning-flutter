import 'package:flutter/material.dart';
import 'package:swarm_game/game_controller.dart';

class StartText {
  final GameController gameController;
  TextPainter painter;
  Offset position;

  StartText(this.gameController) {
    painter = TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    position = Offset.zero;
  }

  void render(Canvas c) {
    painter.paint(c, position);
  }

  void update(double t) {
    // int highscore = gameController.storage.getInt('highscore') ?? 0;

    painter.text = TextSpan(
      text: 'Tap anywhere to start',
      style: TextStyle(
        color: Colors.black,
        fontSize: 30.0,
      ),
    );
    painter.layout();
    position = Offset(
      (gameController.screenSize.width / 2) - (painter.width / 2),
      (gameController.screenSize.height * 0.7) - (painter.height / 2),
    );
  }
}
