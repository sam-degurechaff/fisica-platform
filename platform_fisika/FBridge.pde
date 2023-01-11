class FBridge extends FGameObject {
  FBridge(float x, float y) {
    super();
    setPosition(0, 0);
    attachImage(bridge);
    setStatic(true);
  }
  void act() {
    if (isTouching("player")) {
      setStatic(false);
      setSensor(true);
    }
  }
}
