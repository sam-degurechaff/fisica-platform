class FGameObject extends FBox {
  FGameObject() {
    super(gridSize, gridSize);
  }
  void act() {
  }
  boolean isTouching(String n) {
    ArrayList<FContact>contacts=getContacts();
    for (int i=0; i<contacts.size(); i++) {
      FContact fc =contacts.get(i);
      float vx=getVelocityX();
      if (wkey)setVelocity(vx, -500);
      if (fc.contains(n)) {
        return true;
      }
    }
    return false;
  }
}
