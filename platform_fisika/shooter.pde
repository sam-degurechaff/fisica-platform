class FShooter extends FGameObject {
  int direction=L;
  int speed=50;
  int frame=0;
  int t;
  FShooter(float x, float y) {
    super(gridSize*2, gridSize*2);
    setPosition(x, y);
    setName("shooter");
    setRotatable(false);
    attachImage(shooter_run[frameCount%14]);
  }
  void act() {
    //attachImage( goomba[frameCount%2]);
    animate();
    checkForCollisions();
    move();
    bullet();
  }
  void animate() {
    //println(frame);
    float pd=player.getX();
    float sd=getX();
    float ra=sd-pd;
    if (frame>=shooter_run.length)frame=0;
    if (frameCount%14==0) {
      if (direction==R) attachImage(shooter_run[frame]);
      else  attachImage(reverseImage(shooter_run[frame]));
      frame++;
      if (direction==R||pd<sd&&ra<80) attachImage(shooter_shoot[frame]);
      if (direction==L||pd>sd&&ra<80)  attachImage(reverseImage(shooter_shoot[frame]));
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
  void bullet() {
    FBox b=new FBox(gridSize, gridSize);
    float x=getX();
    float y = getY();
    int hs;
    b.setPosition(x, y);
    if (x>player.getX())hs=-1;
    else {
      hs=1;
    }
    b.attachImage(bullet);

    b.setVelocity(hs*300, -10);
    b.setName("hammer");

    b.setSensor(true);

    t--;
    if (t==0) {
      world.add(b);

      t=10;
    }
  }
}
