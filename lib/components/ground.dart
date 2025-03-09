import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flappy_bird/constants.dart';
import 'package:flappy_bird/game.dart';

class Ground extends SpriteComponent with HasGameRef<FlappyBirdGame>,CollisionCallbacks{
  //Background init 
  Ground(Vector2 size) : super();

  /* LOAD */
  @override
  Future<void> onLoad() async {
    //Set size and position of the ground
    size = Vector2(2* gameRef.size.x,groundHeight);
    position =Vector2(0,gameRef.size.y - groundHeight);

    //Load ground Sprite
    sprite = await Sprite.load('ground.png');

    //Collision Box
    add(RectangleHitbox());
  }

  /* Update Ground Movement */
  @override
  void update(double dt) {
    //Ground moves to left
    position.x -= groundScrollingSpeed * dt;

    //Reset ground movement for infinite scroll
    if(position.x+size.x/2<=0){
      position.x = 0;
    }

  }
}