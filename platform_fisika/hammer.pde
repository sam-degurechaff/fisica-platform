class FHammer extends FGameObject {
  int direction=L;
  int speed=50;
  int frame=0;
  FHammer(float x, float y) {
    super();
    setPosition(x, y);
    setName("hammer");
    setRotatable(false);
    attachImage(hammerbro[frameCount%2]);
  }
  void act() {
    //attachImage( goomba[frameCount%2]);
    animate();
    checkForCollisions();
    move();
    hammer();
  }
  void animate() {
    //println(frame);
    if (frame>=hammerbro.length)frame=0;
    //if(frame==2)hammer.add;
    if (frameCount%2==0) {
      if (direction==R) attachImage(hammerbro[frame]);
      else  attachImage(reverseImage(hammerbro[frame]));
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
  void hammer() {
    FBox b=new FBox(gridSize, gridSize);
    float x=getX();
    float y = getY();
    b.setPosition(x, y);
    b.attachImage(hammer_obj);
    b.setFriction(4);
    b.setName("hammer");

    b.setSensor(true);

    if (frame==2)world.add(b);
  }
}
