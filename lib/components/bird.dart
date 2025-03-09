import 'dart:async';

import 'package:flame/components.dart';
import 'package:flappy_bird/constants.dart';

class Bird extends SpriteComponent{
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
    sprite=await Sprite.load('bird.png');
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
}