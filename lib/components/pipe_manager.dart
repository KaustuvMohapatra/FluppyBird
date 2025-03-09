import 'dart:math';
import 'package:flame/components.dart';
import 'package:flappy_bird/components/pipe.dart';
import 'package:flappy_bird/constants.dart';
import 'package:flappy_bird/game.dart';

class PipeManager extends Component with HasGameRef<FlappyBirdGame>{
  //Continuous spawing of new pipes
  double pipeSpawnTimer = 0;
  @override
  void update(double dt) {
    //Generate a new pipe
    pipeSpawnTimer += dt;
    const double pipeInterval = 3;
     if(pipeSpawnTimer > pipeInterval){
      pipeSpawnTimer = 0;
      spawnPipe();
     }
  }

  //Spawn new pipes
  void spawnPipe(){
    final double screenHeight = gameRef.size.y;
    
    /* calculate pipe heights
    Max Height */
    final double maxPipeHeight = screenHeight - groundHeight - pipeGap - minPipeHeight;
     // Height of Bottom Pipe
     final double bottomPipeHeight = minPipeHeight + Random().nextDouble() * (maxPipeHeight - minPipeHeight);
     //Height of Top Pipe
     final double topPipeHeight = screenHeight - groundHeight - bottomPipeHeight - pipeGap;

     //Bottom Pipe Creation
     final bottomPipe = Pipe(
      //Position
      Vector2(gameRef.size.x,screenHeight-groundHeight-bottomPipeHeight),
      //Size of the pipe
      Vector2(pipeWidth,bottomPipeHeight),
      isTopPipe : false,
     );
     //Top Pipe Creation
     final topPipe = Pipe(
      //Position
      Vector2(gameRef.size.x,0),
      //Size of the pipe
      Vector2(pipeWidth,topPipeHeight),
      isTopPipe : true,
     );

     //Add both pipes
     gameRef.add(bottomPipe);
     gameRef.add(topPipe);
  }
}