import 'dart:async';

import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flappy_bird/components/background.dart';
import 'package:flappy_bird/components/bird.dart';
import 'package:flappy_bird/components/ground.dart';
import 'package:flappy_bird/components/pipe.dart';
import 'package:flappy_bird/components/pipe_manager.dart';
import 'package:flappy_bird/components/score.dart';
import 'package:flappy_bird/constants.dart';
import 'package:flutter/material.dart';

class FlappyBirdGame extends FlameGame with TapDetector,HasCollisionDetection{
  /*Basic Game Components*/
  late Bird bird;
  late Background background;
  late Ground ground; 
  late PipeManager pipeManager;
  late ScoreText scoreText;

  /* LOAD */
  @override
  FutureOr<void> onLoad(){
    /* Background */
    background = Background(size);
    add(background);

    /* Ground */
    ground =Ground(size);
    add(ground);

    /* Bird */
    bird=Bird();
    add(bird);
    
    /* Pipe */
    pipeManager=PipeManager();
    add(pipeManager);

    /* Score */
    scoreText=ScoreText();
    add(scoreText);
  }

  /* TAP */
  @override
  void onTap(){
    bird.flap();
  }

  /* SCORE */
  int score=0;
  void incrementScore() => {
    score += 1
  };

  /* GAME OVER */
  bool isGameOver = false;
  void gameOver(){
    //Prevent Multiple GameOvers
    if(isGameOver) return ;
    isGameOver =true;
    pauseEngine();

    //Show Dialogue Box for Game Over
    showDialog(
      context: buildContext!, 
      builder: (context) => AlertDialog(
        title:const Text("Game Over"),
        content: Text("High Score : $score"),
        actions:[
          TextButton(
            onPressed: (){
              //Pop the box
              Navigator.pop(context);

              //Reset the game
              resetGame();
            }, 
            child: const Text("Restart"))
        ]
      )
    );
  }

  void resetGame(){
    bird.position = Vector2(birdStartX,birdStartY);
    bird.velocity = 0;
    score = 0;
    isGameOver = false;
    //Remove all pipes from the game
    children.whereType<Pipe>().forEach((Pipe pipe) => pipe.removeFromParent());
    resumeEngine();
  }
}