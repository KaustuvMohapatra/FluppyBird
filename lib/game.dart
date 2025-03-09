import 'dart:async';

import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flappy_bird/components/background.dart';
import 'package:flappy_bird/components/bird.dart';
import 'package:flappy_bird/components/ground.dart';

class FlappyBirdGame extends FlameGame with TapDetector{
  /*Basic Game Components*/
  late Bird bird;
  late Background background;
  late Ground ground;

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
    
  }

  /* TAP */
  @override
  void onTap(){
    bird.flap();
  }
}