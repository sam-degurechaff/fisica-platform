class FGoomba extends FGameObject {
  int direction=L;
  int speed=50;
  int frame=0;
  FGoomba(float x, float y) {
    super();
    setPosition(x, y);
    setName("goomba");
    setRotatable(false);
    attachImage(goomba[frameCount%2]);
  }
  void act() {
    //attachImage( goomba[frameCount%2]);
    animate();
    checkForCollisions();
    move();
  }
  void animate() {
    //println(frame);
    if (frame>=hammerbro.length)frame=0;
    if (frameCount%5==0) {
      if (direction==R) attachImage(goomba[frame]);
      else  attachImage(reverseImage(goomba[frame]));
      frame++;
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
        if (player.getY()<getY()-gridSize/2) {
          world.remove(this);
          enemies.remove(this);
          player.setVelocity(player.getVelocityX(), -300);
        } else {
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
