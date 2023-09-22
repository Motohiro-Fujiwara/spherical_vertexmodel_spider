import processing.opengl.*; 

String[] lines, lines2, lines3,lines4,lines5,lines6, pieces, pieces2, pieces3, pieces4, pieces5, pieces6;
int i,j,jmax,k,kmax;
int ifac = 0;
float a=1.2,b=0,c=0,d=2,e=0, f=5.0;
int cell_type=0;
int cell_lineage=0;

FloatList x = new FloatList ();
FloatList y = new FloatList ();
FloatList z = new FloatList ();

FloatList Fx = new FloatList ();
FloatList Fy = new FloatList ();
FloatList Fz = new FloatList ();

float Nx;
float Ny;
float Nz;

float Tx;
float Ty;
float Tz;

float Cx;
float Cy;
float Cz;

float D1;
float D2;
float D3;
float D4;
float D1_ave;
float D2_ave;
float D3_ave;
float D4_ave;

void setup(){
    size(800,800,OPENGL);
    frameRate(100);
    smooth(); 
}
 
void draw(){
   if(ifac<500)  {
    background(255);
    translate(width/2,height/2);
    
    rotateX(-0.0);
    rotateY(-1.57);
    rotateZ(-1.57);
   
    //cell
    lines = loadStrings("/Users/fujiwara/Desktop/vertex_spider/data3D_band/z_cellform"+ifac+".dat");
   //celltype
    lines2 = loadStrings("/Users/fujiwara/Desktop/vertex_spider/data3D_band/z_celltype"+ifac+".dat");
  //vertical vector
   lines3 = loadStrings("/Users/fujiwara/Desktop/vertex_spider/data3D_band/z_vertical_vector"+ifac+".dat");
  //center
   lines4 = loadStrings("/Users/fujiwara/Desktop/vertex_spider/data3D_band/z_centroid"+ifac+".dat");
 
  //cell
  for(i=0; i<lines.length; i++)  {
     pieces = split(lines[i], '\t');
    for (j=0; j<(pieces.length+1)/3; j++)  {
    x.append(b+(float(pieces[3*j]))*a) ;
    y.append(c+(float(pieces[3*j+1]))*a);
    z.append(e+(float(pieces[3*j+2]))*a);
    }
    
    //celltype
    pieces2 = split(lines2[i],  '\t');
    cell_type=int(pieces2[0]);
    cell_lineage=int(pieces2[1]);
    
    stroke(0);
    strokeWeight(3);
    if(cell_type==1){
     fill(60,180,255);
    }
    if(cell_type==2){
       noFill();
       noStroke();
    }
     if(cell_type==3){
      fill(60,240,255);
    }
     if(cell_type==4){
      //noFill();
      //noStroke();
    }
    if(cell_type==5){
       fill(60,60,255);
    }
    
    if(cell_type==6){
       noFill();
       strokeWeight(1);
    }
     
    if(i==1464){
      noFill();
    }
     if(cell_lineage==1){
      fill(200,0,0);
    }
    if(cell_lineage==2){
      fill(0,200,0);
    }
     if(cell_lineage==3){
      fill(0,100,100);
    }
    if(cell_type==-1){
       noFill();
       stroke(200,0,0);
    }
     //noFill();
     
  beginShape();
   jmax=x.size();
  for (j=0; j<jmax; j++) {
  vertex((float)x.get(j),(float)y.get(j),(float)z.get(j));
  //println((float)x.get(j),(float)y.get(j),(float)z.get(j));
  }
  vertex((float)x.get(0),(float)y.get(0),(float)z.get(0));
  endShape();
  
   for (j=0; j<jmax; j++) {
  x.remove(0);
  y.remove(0);
  z.remove(0);
  }
    }
      
  for(i=0; i<lines3.length; i++)  {
     pieces3 = split(lines3[i], '\t');
    Nx=b+(float(pieces3[0])*a);
    Ny=b+(float(pieces3[1])*a);
    Nz=b+(float(pieces3[2])*a);
  
    Tx=b+(float(pieces3[3])*a);
    Ty=b+(float(pieces3[4])*a);
    Tz=b+(float(pieces3[5])*a);
    
    pieces4 = split(lines4[i], '\t');
    Cx=b+(float(pieces4[0])*a);
    Cy=b+(float(pieces4[1])*a);
    Cz=b+(float(pieces4[2])*a);
     
    // strokeWeight(5);
     //point(Cx,Cy,Cz);
    
    //vertical vector
    /*  strokeWeight(2);
      stroke(0);
      beginShape(LINES);
      vertex(Cx, Cy, Cz);
      vertex(Cx+f*Nx, Cy+f*Ny, Cz+f*Nz);
      endShape();*/
      if(i==1464){
       strokeWeight(1.5);
      stroke(200,0,0);
      beginShape(LINES);
      //vertex(Cx-400*Nx, Cy-400*Ny, Cz-400*Nz);
     // vertex(Cx+400*Nx, Cy+400*Ny, Cz+400*Nz);
      endShape();
    }
      //tissue vector
      strokeWeight(1.5);
      stroke(200,0,0);
     // noStroke();
    //  if (Cz<0){
      beginShape(LINES);
     vertex(Cx, Cy, Cz);
     vertex(Cx+f*Tx, Cy+f*Ty, Cz+f*Tz);
      endShape();
     // }
   /*   if (Cz>=0){
      beginShape(LINES);
      vertex(Cx, Cy, Cz);
      vertex(Cx+f*Tx, Cy+f*-Ty, Cz+f*-Tz);
      endShape();
      }*/
      
      //println(Cx,Cy,Cz);
      //println(Nx,Ny,Nz);
    }
  
     noFill();
    //stroke(100);
    stroke(200,0,0);
    line(-550,0,0,550,0,0);
     stroke(0,200,0);
    line(0,-550,0,0,550,0);
     stroke(0,0,200);
    line(0,0,-550,0,0,550);
    //box(550);//zahyouzikunokawari
    
   ifac+=5;
  }
  println(ifac);
  mousePressed();
  //saveFrame("/Users/fujiwara/Desktop/vertex_spider/sketch_embryo/band_t2-1027-4/z_form3d-####.png");
}

void mousePressed() {
  loop();  // Holding down the mouse activates looping
}

void mouseReleased() {
  noLoop();  // Releasing the mouse stops looping draw()
}
