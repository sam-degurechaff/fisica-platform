//https://www.youtube.com/playlist?list=PL__Tph-7Dyp0yifP3b3-GZBz9TRW128xa
import fisica.*;

float zoom=1.5;
color black=#000000;
color gray=#DEDEDE;
color green=#00FF00;
color red=#FF0000;
color blue=#0000FF;
color white=#FFFFFF;
color orange=#F0A000;
color brown=#099662;
color dice = #0fffff;
color ttgreen=#58FF00;
color ttigreen=#58ff01;
color bridgered=#8B1616;
color trampolineblue=#00CAE3;
color lavared=#D61500;
PImage map, stone, spike, ice, treeTrunk, img, treetopc, treetopi, bridge, lava, trampoline;
int gridSize=28;
boolean wkey, akey, skey, dkey, upkey, downkey, rightkey, leftkey, jph,de;
FWorld world ;
FPlayer player;
ArrayList<FGameObject>terrain;

void setup() {
  size(600, 600);
  terrain=new ArrayList<FGameObject>();
  Fisica.init(this);
  map=loadImage("map2.png");
  loadWorld(map);
  loadPlayer();
}
void loadWorld(PImage img) {

  stone = loadImage("brick.png");
  treeTrunk = loadImage("tree_trunk.png");
  ice = loadImage("blueBlock.png");
  spike=loadImage("spike.png");
  treetopc=loadImage("treetop_center.png");
  treetopi=loadImage("tree_intersect.png");
  bridge=loadImage("bridge_center.png");
  trampoline=loadImage("trampoline");
  lava=loadImage("lava1.png");
  world=new FWorld(-1000, -1000, 3000, 3000);
  world.setGravity(0, 900);

  for (int y=0; y<map.width; y++) {
    for (int x=0; x<map.width; x++) {
      color c=img.get(x, y);
      FBox b=new FBox(gridSize, gridSize);
      b.setPosition(x*gridSize, y*gridSize);
      b.setStatic(true);
      if (c==gray) {
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
      if (c==red) {
        b.attachImage(spike);
        b.setSensor(true);
        b.setName("spike");
        world.add(b);
      }
      if (c==ttgreen) {
        b.attachImage(treetopc);

        b.setName("treetopc");
        world.add(b);
      }
      if (c==ttigreen) {
        b.attachImage(treetopi);

        b.setName("treetopci");
        world.add(b);
      }
      if (c==black) {
        b=new FBox(gridSize, gridSize);
        b.setPosition(x*gridSize, y*gridSize);
        b.setStatic(true);
        world.add(b);
      }
      if (c==bridgered) {
        FBridge br=new FBridge(x*gridSize, y*gridSize);
        terrain.add(br);
        world.add(br);
      }
      if (c==trampolineblue) {
        FTrampoline br=new FTrampoline(x*gridSize, y*gridSize);
        terrain.add(br);
        world.add(br);
      }
      if (c==lavared) {
        
        
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
  actWorld();
  //println(player.getX(), player.getY());
}

void actWorld() {
  player.act();
  for (int i=0; i<terrain.size(); i++) {
    FGameObject t=terrain.get(i);
    t.act();
  }
}
void drawWorld() {
  pushMatrix();
  translate(-player.getX()*zoom+width/2, -player.getY()*zoom+height/2);
  scale(zoom);
  world.step();
  world.draw();
  popMatrix();
}
