//https://www.youtube.com/playlist?list=PL__Tph-7Dyp0yifP3b3-GZBz9TRW128xa
import fisica.*;


color black=#000000;
color green=#00FF00;
color red=#FF0000;
color blue=#0000FF;
color white=#FFFFFF;
color orange=#F0A000;
color brown=#996633;
PImage map;
int gridSize=10;
boolean wkey, akey, skey, dkey, upkey, downkey, rightkey, leftkey;
FWorld world ;
FPlayer player;
void setup() {
  size(600, 600);
  Fisica.init(this);

  loadWorld(map);
  loadPlayer();
}
void loadWorld(PImage img) {


  world=new FWorld(-2000, -2000, 2000, 2000);
  world.setGravity(0, 900);
  map=loadImage("map.png");
  for (int y=0; y<map.width; y++) {
    for (int x=0; x<map.width; x++) {
      color c=map.get(x, y);
      if (c==black) {
        FBox b=new FBox(gridSize, gridSize);
        b.setPosition(x*gridSize, y*gridSize);
        b.setStatic(true);
        world.add(b);
      }
    }
  }
}
void loadPlayer() {
  player=new FPlayer();
  world.add(player);
}
void draw() {
  world.step();
  world.draw();
  player.act();
}
void drawWorld() {
  pushMatrix();
  translate(-player.getX()+width/2, player.getY()+height/2);
  world.step();
  world.draw();
  popMatrix();
}
