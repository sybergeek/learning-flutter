import 'dart:ui';

import 'package:swarm_game/game_controller.dart';

class HealthBar {
  final GameController gameController;
  Rect healthBarRect;
  Rect remainingHealthBarRect;

  HealthBar(this.gameController) {
    double barWidth = gameController.screenSize.width / 1.75;
    healthBarRect = Rect.fromLTWH(
      gameController.screenSize.width / 2 - barWidth / 2,
      gameController.screenSize.height * 0.8,
      barWidth,
      gameController.tileSize * 0.5,
    );
    remainingHealthBarRect = Rect.fromLTWH(
      gameController.screenSize.width / 2 - barWidth / 2,
      gameController.screenSize.height * 0.8,
      barWidth,
      gameController.tileSize * 0.5,
    );
  }

  void render(Canvas c) {
    Paint healthBarColor = Paint()..color = Color(0xFFFF0000);
    Paint remainingHealthBarColor = Paint()..color = Color(0xFF00FF00);
    c.drawRect(healthBarRect, healthBarColor);
    c.drawRect(remainingHealthBarRect, remainingHealthBarColor);
  }

  void update(double t) {
    double barWidth = gameController.screenSize.width / 1.75;
    double percentHealth =
        gameController.player.currentHealth / gameController.player.maxHealth;
    remainingHealthBarRect = Rect.fromLTWH(
      gameController.screenSize.width / 2 - barWidth / 2,
      gameController.screenSize.height * 0.8,
      barWidth * percentHealth,
      gameController.tileSize * 0.5,
    );
  }
}
