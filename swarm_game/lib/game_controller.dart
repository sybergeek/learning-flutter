import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/cupertino.dart';

import 'components/enemy.dart';
import 'components/player.dart';

class GameController extends Game {
  Size screenSize;
  double tileSize;
  Player player;
  Enemy enemy;

  GameController() {
    initialize();
  }

  void initialize() async {
    resize(await Flame.util.initialDimensions());
    player = Player(this);
    enemy = Enemy(this, 200, 200);
  }

  void render(Canvas c) {
    Rect background = Rect.fromLTWH(0, 0, screenSize.width, screenSize.height);
    Paint backgroundPaint = Paint()..color = Color(0xFFFAFAFA);
    c.drawRect(background, backgroundPaint);

    player.render(c);
    enemy.render(c);
  }

  void update(double t) {
    enemy.update(t);
    player.update(t);
  }

  void resize(Size size) {
    screenSize = size;
    tileSize = screenSize.width / 10;
  }

  void onTapDown(TapDownDetails d) {
    print(d.globalPosition);
    enemy.health--;
  }
}
