class FPlayer extends FGameObject {
  int timer=20;
  int frame, direction;
  final int L=-1;
  final int R=1;
  FPlayer() {
    super();
    direction=R;
    setPosition(300, 0);
    setName("player");
    setRotatable(false);
    setFillColor(red);
  }
  void act() {


    animate();
    handleInput();
    checkForCollisions();
    if (isTouching("spike")) {
      setPosition(0, 0);
    }
  }
  void animate() {
    //println("a");
    if (frame>=action.length)frame=0;
    if (frameCount%5==0) {
      if (direction==R) attachImage(action[frame]);
      if (direction==L)  attachImage(reverseImage(action[frame]));
      frame++;
    }
  }
  void handleInput() {
    float vy=getVelocityY();
    float vx=getVelocityX();
    if (abs(vy)<.1)action=idle;
    if (akey) {
      action=run;
      setVelocity(-200, vy);
      direction=L;
    }
    if (dkey) {
      action=run;
      setVelocity(200, vy);
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
    if (de==true&&inv==false)setPosition(30, 0);
    if (inv==true) {
      timer=timer--;
      if (timer<=0) {
        inv=false;
        timer=20;
      }
    }
  }
  void checkForCollisions() {
    ArrayList<FContact>contacts=getContacts();
    for (int i=0; i<contacts.size(); i++) {
      FContact fc =contacts.get(i);

      if (fc.contains("spike")) {

        setPosition(5, 0);
        setVelocity(0, 0);
      }
      if (fc.contains("hammer")) {

        setPosition(5, 0);
        setVelocity(0, 0);
      }

      if (fc.contains("php"))ph=true;
    }
  }
}
