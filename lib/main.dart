import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flame_texturepacker/flame_texturepacker.dart';

void main() {
  print('start game');
  runApp(GameWidget(
    game: MySpriteTutorial(),
  ));
}

class MySpriteTutorial extends FlameGame {
  // SpriteAnimationComponent
  late SpriteAnimationComponent girlWalking;
  late SpriteComponent background;

  Future<void> onLoad() async {
    super.onLoad();
    print('load assets');
    //background
    background = SpriteComponent()
      ..sprite = await loadSprite('background.jpg')
      ..size = size;
    add(background);

    // sprites
    final spritesheet =
        await fromJSONAtlas('spritesheet.png', 'spritesheet.json');
    SpriteAnimation walk =
        SpriteAnimation.spriteList(spritesheet, stepTime: .1);
    girlWalking = SpriteAnimationComponent()
      ..animation = walk
      ..position = Vector2(0, 30)
      ..size = Vector2(100, 100);
    add(girlWalking);
  }

  void update(double dt) {
    super.update(dt);
    girlWalking.y += dt * 20;
    girlWalking.x += dt * 20;
  }
}
