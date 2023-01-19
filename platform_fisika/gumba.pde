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
    attachImage( goomba[frameCount%2]);
    animate();
    checkForCollisions();
    move();
  }
  void animate() {
    println("a");
    if (frame>=action.length)frame=0;
    if (frameCount%5==0) {
      if (direction==R) attachImage(goomba[frame]);
      if (direction==L)  attachImage(reverseImage(goomba[frame]));
      frame++;
    }
  }
  void handleInput() {
    float vy=getVelocityY();
    float vx=getVelocityX();
    if (abs(vy)<.1)action=idle;
    if (akey) {
      action=run;
      setVelocity(-500, vy);
      direction=L;
    }
    if (dkey) {
      action=run;
      setVelocity(500, vy);
      direction=R;
    }
    //  if (wkey)setVelocity(vx, -500);
    if (skey)setVelocity(vx, 100);

    if (wkey) {
      action=jump;
      setVelocity(vx, -500);
    }

    if (abs(vy)>.1)action=jump;
    if (jph==true) setVelocity(vx, -900);
    if (de==true)setPosition(30, 0);
  }
  void checkForCollisions() {
    ArrayList<FContact>contacts=getContacts();
    for (int i=0; i<contacts.size(); i++) {
      FContact fc =contacts.get(i);

      if (fc.contains("wall")) {

        direction*=-1;
        setPosition(getX()+direction, getY());
      }
    }
  }
  void move() {
    float vy=getVelocityY();
    setVelocity(speed*direction, vy);
  }
}
