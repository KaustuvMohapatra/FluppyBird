import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flappy_bird/components/ground.dart';
import 'package:flappy_bird/components/pipe.dart';
import 'package:flappy_bird/constants.dart';
import 'package:flappy_bird/game.dart';

class Bird extends SpriteComponent with CollisionCallbacks{
  /*INIT BIRD*/
  Bird():super(
    position:Vector2(birdStartX, birdStartY),
    size:Vector2(birdWidth, birdHeight)
    );

  //Physical world components
  double velocity = 0;

  /* LOAD */
  @override
  FutureOr<void> onLoad() async{
    //Load Bird Sprite
    sprite=await Sprite.load('bird.png');

    //Collision Hit Box
    add(RectangleHitbox());
  }

  /* JUMP/FLAP */
  void flap(){
    velocity=jumpStrength;
  }

  /* UPDATE */
  @override
  void update(double dt){
    velocity += gravity*dt;
    //updating bird's position
    position.y += velocity*dt;
  }

  //Collision with another object
  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);
    //Collision with ground check
    if(other is Ground){
      (parent as FlappyBirdGame).gameOver();
    }
    //Collision with pipe check
    if(other is Pipe){
      (parent as FlappyBirdGame).gameOver();
    }
  }
}