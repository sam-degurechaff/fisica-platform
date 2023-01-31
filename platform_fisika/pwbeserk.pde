class FBeserk extends FGameObject {
  int t=10;
  FBeserk(float x, float y) {
    super();
    fill(red);
    setPosition(x, y);
    setName("beserk");
    setStatic(true);
  }
  void act() {

    if (isTouching("player")) {
      inv=true;
    }
    hammer();
  }
  void hammer() {
    FBox b=new FBox(gridSize, gridSize);
    float x=player.getX();
    float y = player.getY();
    int hs;
    b.setPosition(x, y);
    if (x>mouseX)hs=-1;
    else {
      hs=1;
    }
    b.attachImage(hammer_obj);
    b.setFriction(4);
    b.setVelocity(hs*220, -400);
    b.setName("player_hammer");

    b.setSensor(true);

    t--;
    if (t==0&&mousePressed&&ph==true) {
      world.add(b);

      t=20;
      
    }
  }
}
