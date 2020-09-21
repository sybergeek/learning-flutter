import 'dart:async';

import 'package:flapper_bird/barriers.dart';
import 'package:flapper_bird/bird.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static double birdYaxis = 0;
  double timeFlight = 0;
  double height = 0;
  double initheight = birdYaxis;
  bool gameHasStarted = false;
  static double barrierXone = 1.0;
  double barrierXtwo = barrierXone + 1.5;

  void jump() {
    setState(() {
      timeFlight = 0;
      height = 0;
      initheight = birdYaxis;
    });
    // startGame();
  }

  void startGame() {
    gameHasStarted = true;
    Timer.periodic(Duration(milliseconds: 30), (timer) {
      timeFlight += 0.025;
      height = -4.9 * timeFlight * timeFlight + 2.8 * timeFlight;
      setState(() {
        birdYaxis = initheight - height;
        // print(gameHasStarted);
      });

      setState(() {
        if (barrierXone < -1.6) {
          barrierXone += 3.2;
        } else {
          barrierXone -= 0.02;
        }
      });

      setState(() {
        if (barrierXtwo < -1.6) {
          barrierXtwo += 3.2;
        } else {
          barrierXtwo -= 0.02;
        }
      });

      if (birdYaxis > 1) {
        timer.cancel();
        // birdYaxis = 1;
        // height = 0;
        gameHasStarted = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (gameHasStarted) {
          jump();
        } else {
          startGame();
        }
      },
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Expanded(
                flex: 3,
                child: Stack(
                  children: <Widget>[
                    AnimatedContainer(
                      alignment: Alignment(0, birdYaxis),
                      duration: Duration(
                        milliseconds: 0,
                      ),
                      color: Colors.blue,
                      child: MyBird(),
                    ),
                    Container(
                      alignment: Alignment(0, -0.4),
                      child: gameHasStarted
                          ? Text("")
                          : Text(
                              "T A P  T O  P L A Y",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                    ),
                    AnimatedContainer(
                      alignment: Alignment(barrierXone, 1.1),
                      duration: Duration(milliseconds: 0),
                      child: MyBarrier(
                        size: 150.0,
                      ),
                    ),
                    AnimatedContainer(
                      alignment: Alignment(barrierXone, -1.1),
                      duration: Duration(milliseconds: 0),
                      child: MyBarrier(
                        size: 150.0,
                      ),
                    ),
                    AnimatedContainer(
                      alignment: Alignment(barrierXtwo, 1.1),
                      duration: Duration(milliseconds: 0),
                      child: MyBarrier(
                        size: 200.0,
                      ),
                    ),
                    AnimatedContainer(
                      alignment: Alignment(barrierXtwo, -1.1),
                      duration: Duration(milliseconds: 0),
                      child: MyBarrier(
                        size: 100.0,
                      ),
                    ),
                  ],
                )),
            Container(
              height: 15,
              color: Colors.green,
            ),
            Expanded(
              child: Container(
                color: Colors.brown,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "SCORE",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "0",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "BEST",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "10",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
