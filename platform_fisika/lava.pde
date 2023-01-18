class FLava extends FGameObject {
  FLava(float x, float y) {
    super();
    setPosition(x, y);
    attachImage(lava[frameCount%6]);

    setName("lava");
    setStatic(true);
  }
  void act() {

    attachImage( lava[frameCount%6]);
    int timer=0;
    if (isTouching("player")) {
      timer=timer++;
    }
    if (timer>2)de=true;
    if (frameCount%6==0) f=f+1;
    if (f==6)f=0;
  }
}
