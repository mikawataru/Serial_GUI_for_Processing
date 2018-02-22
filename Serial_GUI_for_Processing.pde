import processing.serial.*;
Serial device;

float   angleX;
float   angleY;
float   angleZ;
String  PortName = "COM7";
int     Baurate  = 115200;

void setup(){
  size(800, 600, P3D);
  angleX = 0;
  angleY = 0;
  angleZ = 0;
  device = new Serial(this, PortName, Baurate);
}
 
void draw(){
  background(0);
  rotateX(radians(-20));
  translate(width/2, height/2); 
  rotateX(radians(angleY));
  rotateY(radians(angleZ));
  rotateZ(radians(angleX));
  box(100, 100, 100);
}

void serialEvent(Serial p){

  String str = p.readStringUntil('\n');
  
  try{
    if(str!=null){
      str = trim(str);
      println(str);
      String[] data = splitTokens(str,",");
      angleY = float(data[1]);
      angleX = float(data[2]);  
      println(str);
    }
  }catch(RuntimeException e) {
    e.printStackTrace();
  }
  
}
