class FLava extends FGameObject {
  FLava(float x, float y) {
    super();
    setPosition(x, y);
    attachImage(lava[frameCount%8]);

    setName("lava");
    setStatic(true);
  }
  void act() {
    
    image( lava[frameCount%8],x,y);
    int timer=0;
    if (isTouching("player")) {
      timer=timer++;
    }
    if (timer>2)de=true;
  }
}
