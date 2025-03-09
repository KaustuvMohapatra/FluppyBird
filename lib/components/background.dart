import 'dart:async';

import 'package:flame/components.dart';

class Background extends SpriteComponent{
  //Background init 
  Background(Vector2 size) : super(
    size:size,
    position:Vector2(0,0)
  );
  @override
  Future<void> onLoad() async {
    //load bg sprite
    sprite =await Sprite.load('background.png');
  }
}