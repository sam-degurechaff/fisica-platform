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
color gumbayellow=#FADD00;
color wallgray=#797979;
color tbgreen=#87FF00;
color hammerbule=#0520FF;
color shooterred=#E80E0E;

PImage map, stone, spike, ice, treeTrunk, img, treetopc, treetopi, lava1, bridge, trampoline, gmb, thwomp, hammer_obj, bullet;
int gridSize=28;
boolean wkey, akey, skey, dkey, upkey, downkey, rightkey, leftkey, jph, de;
FWorld world ;
FPlayer player;
ArrayList<FGameObject>terrain;
ArrayList<FGameObject>enemies;
PImage[] lava = new PImage[6];
int f, hs;
PImage[] idle;
PImage[] jump;
PImage[] run;
PImage[] action;
PImage[]goomba=new PImage[2];
PImage[]Tb=new PImage[2];
PImage[]hammerbro=new PImage[2];
PImage[]shooter_run=new PImage[14];
PImage[]shooter_shoot=new PImage[14];





void setup() {
  size(600, 600);
  terrain=new ArrayList<FGameObject>();
  enemies=new ArrayList<FGameObject>();
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
  trampoline=loadImage("trampoline.png");
  hammer_obj=loadImage("hammer.png");
  bullet=loadImage("bullet1.png");


  lava[0] = loadImage( "lava1.png" );
  lava[1] = loadImage( "lava2.png" );
  lava[2] = loadImage( "lava3.png" );
  lava[3] = loadImage( "lava4.png" );
  lava[4] = loadImage( "lava5.png" );
  lava[5]=loadImage("lava0.png");

  idle =new PImage[2];
  idle[0]=loadImage("idle0.png");
  idle[1]=loadImage("idle1.png");
  jump =new PImage[1];
  jump[0]=loadImage("jump0.png");
  run =new PImage[3];
  run[0]=loadImage("runright0.png");
  run[1]=loadImage("runright1.png");
  run[2]=loadImage("runright2.png");
  action=idle;
  goomba=new PImage[2];
  goomba[0]=loadImage("goomba0.png");
  goomba[0].resize(gridSize, gridSize);
  goomba[1]=loadImage("goomba1.png");
  goomba[1].resize(gridSize, gridSize);
  Tb=new PImage[2];
  Tb[0]=loadImage("thwomp0.png");
  Tb[0].resize(gridSize*2, gridSize*2);
  Tb[1]=loadImage("thwomp1.png");
  Tb[1].resize(gridSize*2, gridSize*2);

  hammerbro=new PImage[2];
  hammerbro[0]=loadImage("hammerbro0.png");
  hammerbro[0].resize(gridSize, gridSize);
  hammerbro[1]=loadImage("hammerbro1.png");
  hammerbro[1].resize(gridSize, gridSize);

  shooter_run=new PImage[14];
  shooter_run[0]=loadImage("metal-slug-run-cyle-0.png");
  shooter_run[0].resize(gridSize, gridSize);
  shooter_run[1]=loadImage("metal-slug-run-cyle-1.png");
  shooter_run[1].resize(gridSize, gridSize);
  shooter_run[2]=loadImage("metal-slug-run-cyle-2.png");
  shooter_run[2].resize(gridSize, gridSize);
  shooter_run[3]=loadImage("metal-slug-run-cyle-3.png");
  shooter_run[3].resize(gridSize, gridSize);
  shooter_run[4]=loadImage("metal-slug-run-cyle-4.png");
  shooter_run[4].resize(gridSize, gridSize);
  shooter_run[5]=loadImage("metal-slug-run-cyle-5.png");
  shooter_run[5].resize(gridSize, gridSize);
  shooter_run[6]=loadImage("metal-slug-run-cyle-6.png");
  shooter_run[6].resize(gridSize, gridSize);
  shooter_run[7]=loadImage("metal-slug-run-cyle-7.png");
  shooter_run[7].resize(gridSize, gridSize);
  shooter_run[8]=loadImage("metal-slug-run-cyle-8.png");
  shooter_run[8].resize(gridSize, gridSize);
  shooter_run[9]=loadImage("metal-slug-run-cyle-9.png");
  shooter_run[9].resize(gridSize, gridSize);
  shooter_run[10]=loadImage("metal-slug-run-cyle-10.png");
  shooter_run[10].resize(gridSize, gridSize);
  shooter_run[11]=loadImage("metal-slug-run-cyle-11.png");
  shooter_run[11].resize(gridSize, gridSize);
  shooter_run[12]=loadImage("metal-slug-run-cyle-12.png");
  shooter_run[12].resize(gridSize, gridSize);
  shooter_run[13]=loadImage("metal-slug-run-cyle-13.png");
  shooter_run[13].resize(gridSize, gridSize);
  
  PImage[]shooter_shoot=new PImage[14];
  shooter_shoot[0]=loadImage("shoot cycle-0.png");
  shooter_shoot[0].resize(gridSize*2, gridSize*2);
  shooter_shoot[1]=loadImage("shoot cycle-1.png");
  shooter_shoot[1].resize(gridSize*2, gridSize*2);
  shooter_shoot[2]=loadImage("shoot cycle-2.png");
  shooter_shoot[2].resize(gridSize*2, gridSize*2);
  shooter_shoot[3]=loadImage("shoot cycle-3.png");
  shooter_shoot[3].resize(gridSize*2, gridSize*2);
  shooter_shoot[4]=loadImage("shoot cycle-4.png");
  shooter_shoot[4].resize(gridSize*2, gridSize*2);
  shooter_shoot[5]=loadImage("shoot cycle-5.png");
  shooter_shoot[5].resize(gridSize*2, gridSize*2);
  shooter_shoot[6]=loadImage("shoot cycle-6.png");
  shooter_shoot[6].resize(gridSize*2, gridSize*2);
  shooter_shoot[7]=loadImage("shoot cycle-7.png");
  shooter_shoot[7].resize(gridSize*2, gridSize*2);
  shooter_shoot[8]=loadImage("shoot cycle-8.png");
  shooter_shoot[8].resize(gridSize*2, gridSize*2);
  shooter_shoot[9]=loadImage("shoot cycle-9.png");
  shooter_shoot[9].resize(gridSize*2, gridSize*2);
  shooter_shoot[10]=loadImage("shoot cycle-10.png");
  shooter_shoot[10].resize(gridSize*2, gridSize*2);
  shooter_shoot[11]=loadImage("shoot cycle-11.png");
  shooter_shoot[11].resize(gridSize*2, gridSize*2);
  shooter_shoot[12]=loadImage("shoot cycle-12.png");
  shooter_shoot[12].resize(gridSize*2, gridSize*2);
  shooter_shoot[13]=loadImage("shoot cycle-13.png");
  shooter_shoot[13].resize(gridSize*2, gridSize*2);
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
      if (c==wallgray) {
        println("b");
        b.attachImage(stone);
        b.setFriction(4);
        b.setName("wall");
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
        FLava br=new FLava(x*gridSize, y*gridSize);
        terrain.add(br);
        world.add(br);
      }
      if (c==gumbayellow) {
        FGoomba gmb=new FGoomba(x*gridSize, y*gridSize);
        enemies.add(gmb);
        world.add(gmb);
      }
      if (c==tbgreen) {
        FTb gmb=new FTb(x*gridSize, y*gridSize);
        enemies.add(gmb);
        world.add(gmb);
      }
      if (c==hammerbule) {
        FHammer gmb=new FHammer(x*gridSize, y*gridSize);
        enemies.add(gmb);
        world.add(gmb);
      }
      if (c==shooterred) {
        FShooter gmb=new FShooter(x*gridSize, y*gridSize);
        enemies.add(gmb);
        world.add(gmb);
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
  for (int i=0; i<enemies.size(); i++) {
    FGameObject e=enemies.get(i);
    e.act();
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
