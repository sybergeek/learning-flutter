import 'dart:math';

import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swarm_game/components/highscore_text.dart';
import 'package:swarm_game/components/score_text.dart';
import 'package:swarm_game/components/start_text.dart';

import 'package:swarm_game/enemy_spawner.dart';
import 'package:swarm_game/game_state.dart';
import 'package:swarm_game/components/enemy.dart';
import 'package:swarm_game/components/player.dart';
import 'package:swarm_game/components/health_bar.dart';

class GameController extends Game {
  final SharedPreferences storage;
  Random rand;
  Size screenSize;
  double tileSize;
  Player player;
  EnemySpawner enemySpawner;
  List<Enemy> enemies;
  HealthBar healthBar;
  int score;
  ScoreText scoreText;
  GameState state;
  HighscoreText highscoreText;
  StartText startButton;

  GameController(this.storage) {
    initialize();
  }

  void initialize() async {
    resize(await Flame.util.initialDimensions());
    state = GameState.menu;
    rand = Random();
    player = Player(this);
    enemies = List<Enemy>();
    enemySpawner = EnemySpawner(this);
    healthBar = HealthBar(this);
    score = 0;
    highscoreText = HighscoreText(this);
    startButton = StartText(this);
    scoreText = ScoreText(this);
    // spawnEnemy();
  }

  void render(Canvas c) {
    Rect background = Rect.fromLTWH(0, 0, screenSize.width, screenSize.height);
    Paint backgroundPaint = Paint()..color = Color(0xFFFAFAFA);
    c.drawRect(background, backgroundPaint);

    player.render(c);

    if (state == GameState.menu) {
      startButton.render(c);
      highscoreText.render(c);
    } else {
      enemies.forEach((Enemy enemy) => enemy.render(c));
      healthBar.render(c);
      scoreText.render(c);
    }
  }

  void update(double t) {
    if (state == GameState.menu) {
      startButton.update(t);
      highscoreText.update(t);
    } else if (state == GameState.playing) {
      enemySpawner.update(t);
      enemies.forEach((Enemy enemy) => enemy.update(t));
      enemies.removeWhere((Enemy enemy) => enemy.isDead);
      player.update(t);
      scoreText.update(t);
      healthBar.update(t);
    }
  }

  void resize(Size size) {
    screenSize = size;
    tileSize = screenSize.width / 10;
  }

  void onTapDown(TapDownDetails d) {
    // print(d.globalPosition);
    if (state == GameState.menu) {
      state = GameState.playing;
    } else if (state == GameState.playing) {
      enemies.forEach((Enemy enemy) {
        if (enemy.enemyRect.contains(d.globalPosition)) {
          enemy.onTapDown();
        }
      });
    }
  }

  void spawnEnemy() {
    double x, y;
    switch (rand.nextInt(4)) {
      case 0: // Top
        x = rand.nextDouble() * screenSize.width;
        y = -tileSize * 2.5;
        break;
      case 1: // Right
        x = screenSize.width + tileSize * 2.5;
        y = rand.nextDouble() * screenSize.height;
        break;
      case 2: // Down
        x = rand.nextDouble() * screenSize.width;
        y = screenSize.height + tileSize * 2.5;
        break;
      case 3: // Left
        x = -tileSize * 2.5;
        y = rand.nextDouble() * screenSize.height;
        break;
    }
    enemies.add(Enemy(this, x, y));
  }
}
