class FLava extends FGameObject {
  FLava(float x, float y) {
    super();
    setPosition(x, y);
    attachImage(lava);
    setName("lava");
    setStatic(true);
  }
  void act() {
    int timer=0;
    if (isTouching("player")) {
      timer=timer++;
    }
    if (timer>2)de=true;
  }
}
