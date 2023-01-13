class FTrampoline extends FGameObject {
  FTrampoline(float x, float y) {
    super();
    setPosition(x, y);
    attachImage(trampoline);
    setName("trampoline");
    setStatic(true);
  }
  void act() {
   
    if (isTouching("player")) {
      jph=true;
    }
  }
}
