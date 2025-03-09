import 'dart:async';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flappy_bird/constants.dart';
import '../game.dart';

class Pipe extends SpriteComponent with CollisionCallbacks,HasGameRef<FlappyBirdGame>{
  //Deterimine if the pipe is top or bottom
  final bool isTopPipe;
  //Score boolean check
  bool scored = false;

  //Initialization
  Pipe(Vector2 position,Vector2 size, {required this.isTopPipe}):
  super(position:position,size:size);

  //Load 
  @override
  Future<void> onLoad() async {
    //Load Sprite Image
    sprite = await Sprite.load(isTopPipe ? 'pipe_top.png':'pipe_bottom.png');

    //Hit Box Collision
    add(RectangleHitbox());
  }

  //Update the pipes
  @override
  void update(double dt) {
    //pipe scrolls to the left
    position.x-=groundScrollingSpeed*dt;

    //Check if bird passed the pipe
    if(!scored && position.x+size.x<gameRef.bird.position.x){
      scored=true;
      //Increment score only for top pipes in order to prevent double counting
      if(isTopPipe){
        gameRef.incrementScore();
      }
    }

    //Remove pipe if goes off screen
    if(position.x+size.x<=0){
      removeFromParent();
    }
  }
}