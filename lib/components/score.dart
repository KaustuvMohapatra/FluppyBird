import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/text.dart';
import 'package:flappy_bird/game.dart';
import 'package:flutter/material.dart';

class ScoreText extends TextComponent with HasGameRef<FlappyBirdGame>{
  //Initialize
  ScoreText() : super(
    text: '0',
    textRenderer: TextPaint(
      style:TextStyle(
        color:Colors.grey.shade900,
        fontSize: 50,
      )
    )
  );

  //Load
  @override
  FutureOr<void> onLoad() {
    //Set position of the score
    position =Vector2(
      (gameRef.size.x-size.x)/2, //This centers the score
      gameRef.size.y-size.y-50,   //This puts it bit above the bottom
    );
  }

  //Update the score
  @override
  void update(double dt) {
    final newText = gameRef.score.toString();
    if(text!=newText){
      text=newText;
    }
  }
}