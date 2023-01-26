class FTb extends FGameObject {
  int direction=L;
  int speed=50;
  int frame=0;
  FTb(float x, float y) {
    super(gridSize*2, gridSize*2);
    setPosition(x+gridSize/2, y+gridSize/2);
    // println(x, y);
    setName("thwomp");
    setRotatable(false);
    attachImage(Tb[frameCount%2]);
    setStatic(true);
  }
  void act() {
    //attachImage( goomba[frameCount%2]);
    animate();
    checkForCollisions();
    // move();
  }
  void animate() {
    //println(frame);
    if (frame>=goomba.length)frame=0;
    if (player.getX()<getX()+gridSize/2&&player.getX()>getX()-gridSize/2) {
      setStatic(false);
      attachImage(Tb[1]);
    }
  }

  void checkForCollisions() {
    ArrayList<FContact>contacts=getContacts();
    for (int i=0; i<contacts.size(); i++) {
      FContact fc =contacts.get(i);

      if (fc.contains("wall")) {
        direction=direction*-1;
        setPosition(getX()+direction, getY());
        break;
      }
      if (fc.contains("player")) {
        if (player.getY()>getY()-gridSize/2+30) {

          player.setPosition(0, 0);
        }
      }
    }
  }
  void move() {
    float vy=getVelocityY();
    setVelocity(speed*direction, vy);
  }
}
