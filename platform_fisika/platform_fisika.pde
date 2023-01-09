//https://www.youtube.com/playlist?list=PL__Tph-7Dyp0yifP3b3-GZBz9TRW128xa
import fisica.*;

float zoom=1.5;
color black=#000000;
color green=#00FF00;
color red=#FF0000;
color blue=#0000FF;
color white=#FFFFFF;
color orange=#F0A000;
color brown=#099662;
color dice = #0fffff;
PImage map, stone, ice, treeTrunk, img;
int gridSize=28;
boolean wkey, akey, skey, dkey, upkey, downkey, rightkey, leftkey;
FWorld world ;
FPlayer player;
void setup() {
  size(600, 600);
  Fisica.init(this);
  map=loadImage("map2.png");
  loadWorld(map);
  loadPlayer();
}
void loadWorld(PImage img) {


  world=new FWorld(-2000, -2000, 2000, 2000);
  world.setGravity(0, 900);

  for (int y=0; y<map.width; y++) {
    for (int x=0; x<map.width; x++) {
      color c=img.get(x, y);
      FBox b=new FBox(gridSize, gridSize);
      b.setPosition(x*gridSize, y*gridSize);
      b.setStatic(true);
      if (c==black) {
        b.attachImage(stone);
        b.setFriction(4);
        b.setName("stone");
        world.add(b);
      }
      if (c==dice) {
        b.attachImage(ice);
        b.setFriction(0);
        b.setName("ice");
        world.add(b);
      }
      if (c==brown) {
        b.attachImage(treeTrunk);
        b.setFriction(4);
        b.setSensor(true);
        b.setName("tree trunk");
        world.add(b);
      }
      if (c==black) {
        b=new FBox(gridSize, gridSize);
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
  background(255);
  //world.step();
  //world.draw();
  player.act();
  drawWorld();
  println(player.getX(), player.getY());
}
void drawWorld() {
  pushMatrix();
  translate(-player.getX()*zoom+width/2, -player.getY()*zoom+height/2);
  scale(zoom);
  world.step();
  world.draw();
  popMatrix();
}
