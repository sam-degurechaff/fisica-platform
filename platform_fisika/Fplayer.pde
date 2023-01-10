class FPlayer extends FBox {
  FPlayer() {
    super(gridSize, gridSize);
    setPosition(300, 0);
    setFillColor(red);
  }
  void act() {
    handleInput();
    checkForCollisions();
  }
  void handleInput() {
    float vy=getVelocityY();
    float vx=getVelocityX();
    if (akey)setVelocity(-500, vy);
    if (dkey)setVelocity(500, vy);
  //  if (wkey)setVelocity(vx, -500);
    if (skey)setVelocity(vx, 100);
  }
  void checkForCollisions() {
    ArrayList<FContact>contacts=getContacts();
    for (int i=0; i<contacts.size(); i++) {
      FContact fc =contacts.get(i);
      float vx=getVelocityX();
      if (wkey)setVelocity(vx, -500);
      if (fc.contains("spike")) {

        setPosition(5, 0);
        setVelocity(0, 0);
      }
    }
  }
}
