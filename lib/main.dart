import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flame_texturepacker/flame_texturepacker.dart';

void main() {
  runApp(GameWidget(
    game: MyGame(),
  ));
}

class MyGame extends FlameGame {
  // late SpriteAnimation walk;
  late SpriteAnimationComponent girl;

  @override
  Future<void> onLoad() async {
    super.onLoad();
    final sprites = await fromJSONAtlas('spritesheet.png', 'spritesheet.json');
    SpriteAnimation walk = SpriteAnimation.spriteList(sprites, stepTime: 0.3);
    girl = SpriteAnimationComponent()
      ..animation = walk
      ..position = Vector2(100, 100)
      ..size = Vector2(200, 200);
    add(girl);
  }

  @override
  void update(double dt) {
    super.update(dt);
    // walk.update(dt);
    girl.update(dt);
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    // walk.getSprite().render(canvas);
  }
}
