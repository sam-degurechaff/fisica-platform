class FHammer extends FGameObject {
  int direction=L;
  int speed=50;
  int frame=0;
  int t=8;
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
      if (fc.contains("player_hammer"))world.remove(this);
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
    int hs;
    b.setPosition(x, y);
    if (x>player.getX())hs=-1;
    else {
      hs=1;
    }
    b.attachImage(hammer_obj);
    b.setFriction(4);
    b.setVelocity(hs*20, -400);
    b.setName("hammer");

    b.setSensor(true);

    t--;
    if (t==0) {
      world.add(b);

      t=30;
    }
  }
}
