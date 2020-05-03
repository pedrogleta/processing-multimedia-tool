import controlP5.*;
import com.hamoid.*;

boolean setuped = false;

public void resizeImages(PImage[] imgs) {
  for (int i = 0; i <= 2; i++) {
    imgs[i].resize(135,90);
  }
}

void settings(){
  size(1080,720);
}

void setup() {
  background(200);
  
  ControlP5 cp5 = new ControlP5(this);
  
  PImage[] videoRecorderImages = {
    loadImage("videoRecorderDefault.png"),
    loadImage("videoRecorderHover.png"),
    loadImage("videoRecorderActive.png")
  };
  
  PImage[] imageRecorderImages = {
    loadImage("imageRecorderDefault.png"),
    loadImage("imageRecorderHover.png"),
    loadImage("imageRecorderActive.png")
  };
  
  resizeImages(videoRecorderImages);
  resizeImages(imageRecorderImages);

  cp5.addButton("VideoRecorder")
     .setPosition(260,300)
     .setValue(0)
     .setImages(videoRecorderImages)
     .setSize(20,20)
     .updateSize();
  
  cp5.addButton("ImageRecorder")
     .setPosition(660,300)
     .setValue(0)
     .setImages(imageRecorderImages)
     .setSize(20,20)
     .updateSize();

  setuped = true;
}

void draw() {
}

public void VideoRecorder(){
  if (setuped) {
    String[] args = {"VideoRecorder"};
    VideoRecorder vr = new VideoRecorder();
    PApplet.runSketch(args,vr);
  }
}

public void ImageRecorder(){
  if (setuped) {
    String[] args = {"ImageRecorder"};
    ImageRecorder ir = new ImageRecorder();
    PApplet.runSketch(args,ir);
  }
}

//Video Recorder
public class VideoRecorder extends PApplet {
  VideoExport videoExport;
  ControlP5 cp5;
  String videoName;
  boolean videoStarted;
  boolean setuped = false;
  int pickedColor = 0;
  
  void settings() {
    size(1080,720);
  }
  
  void setup() {
  noStroke();
  background(200);
  
  cp5 = new ControlP5(this);
  
  PImage[] startImages = {
    loadImage("startdefault.png"),
    loadImage("starthover.png"),
    loadImage("startactive.png")
  };
  
  PImage[] stopImages = {
    loadImage("stopdefault.png"),
    loadImage("stophover.png"),
    loadImage("stopactive.png")
  };
  
  PImage blueImage = loadImage("blue.png");
  PImage redImage = loadImage("red.png");
  PImage greenImage = loadImage("green.png");
  PImage blackImage = loadImage("black.png");
  PImage eraser = loadImage("eraser.png");
  
  eraser.resize(50,50);
  blackImage.resize(50,50);
  greenImage.resize(50,50);
  redImage.resize(50,50);
  blueImage.resize(50,50);
  resizeImages(startImages);
  resizeImages(stopImages);
  
  PFont font = createFont("arial", 20);
  cp5.addTextfield("videoName")
     .setPosition(100, 600)
     .setSize(200,40)
     .setFont(font)
     .setFocus(true);
  
  cp5.addButton("startRecording")
     .setPosition(500,600)
     .setValue(0)
     .setImages(startImages)
     .setSize(20,20)
     .updateSize();
     
   cp5.addButton("stopRecording")
     .setPosition(700,600)
     .setValue(0)
     .setImages(stopImages)
     .setSize(20,20)
     .updateSize();
     
  cp5.addButton("blue")
     .setPosition(30,30)
     .setImage(blueImage)
     .setSize(50,50);
     
  cp5.addButton("red")
     .setPosition(90,30)
     .setImage(redImage)
     .setSize(50,50);
     
  cp5.addButton("green")
     .setPosition(150,30)
     .setImage(greenImage)
     .setSize(50,50);
     
  cp5.addButton("black")
     .setPosition(210,30)
     .setImage(blackImage)
     .setSize(50,50);
     
  cp5.addButton("eraser")
     .setPosition(270,30)
     .setImage(eraser)
     .setSize(50,50);
     
   setuped = true;
  }
  
  void draw() { 
    if (mousePressed) {
      fill(pickedColor);
      ellipse(mouseX, mouseY, 40, 40);
    }
    
    if (videoStarted) {
      videoExport.saveFrame();
    }
    
  }
  
  //Video Name Input
  public void videoName(String value) {
    if(setuped){
      videoName = value + ".mp4";
      videoExport = new VideoExport(this, videoName);
    }
  }
  
  //Color Buttons
  public void blue() {
    if (setuped) {
      pickedColor = color(0,0,255);
    }
  }
  
  public void red() {
    if (setuped) {
      pickedColor = color(255,0,0);
    }
  }
  
  public void green() {
    if (setuped) {
      pickedColor = color(0,255,0);
    }
  }
  
  public void black() {
    if (setuped) {
      pickedColor = color(0,0,0);
    }
  }
  
  public void eraser() {
    if (setuped) {
      pickedColor = 200;
    }
  }
  
  //Recording Controls
  public void startRecording() {
    if(setuped){
      videoExport.startMovie();
      videoStarted = true;
    }
  }
  
  public void stopRecording() {
    if(setuped){
      videoExport.endMovie();
      videoStarted = false;
    }
  }
}

public class JoJo extends PApplet {
 
  public void settings() {
    size(200, 100);
  }
  public void draw() {
    background(255);
    fill(0);
    ellipse(100, 50, 10, 10);
  }
}

public class Ricardo extends PApplet {
  public void settings() {
    size(400,400);
  }
  
  public void draw() {
    background(0);
  }
}

//Image Recorder
public class ImageRecorder extends PApplet {
  ControlP5 cp5;
  String imageName;
  boolean setuped = false;
  int pickedColor = 0;
  
  void settings() {
    size(1080,720);
  }
  
  void setup() {
    background(200);
    
    cp5 = new ControlP5(this);
    
    PImage[] captureImages = {
      loadImage("captureImageDefault.png"),
      loadImage("captureImageHover.png"),
      loadImage("captureImageActive.png")
    };
    
    PImage blueImage = loadImage("blue.png");
    PImage redImage = loadImage("red.png");
    PImage greenImage = loadImage("green.png");
    PImage blackImage = loadImage("black.png");
    PImage eraser = loadImage("eraser.png");
    
    eraser.resize(50,50);
    blackImage.resize(50,50);
    greenImage.resize(50,50);
    redImage.resize(50,50);
    blueImage.resize(50,50);
    resizeImages(captureImages);
    
    PFont font = createFont("arial", 20);
    cp5.addTextfield("imageName")
     .setPosition(100, 600)
     .setSize(200,40)
     .setFont(font)
     .setFocus(true);
     
    cp5.addButton("captureImage")
     .setPosition(500,600)
     .setValue(0)
     .setImages(captureImages)
     .setSize(20,20)
     .updateSize();
     
   cp5.addButton("blue")
     .setPosition(30,30)
     .setImage(blueImage)
     .setSize(50,50);
     
   cp5.addButton("red")
     .setPosition(90,30)
     .setImage(redImage)
     .setSize(50,50);
     
   cp5.addButton("green")
     .setPosition(150,30)
     .setImage(greenImage)
     .setSize(50,50);
     
   cp5.addButton("black")
     .setPosition(210,30)
     .setImage(blackImage)
     .setSize(50,50);
     
   cp5.addButton("eraser")
     .setPosition(270,30)
     .setImage(eraser)
     .setSize(50,50);
     
   setuped = true;
  }
  
  public void imageName(String value) {
    if(setuped){
      imageName = value + ".png";
    }
  }
  
  public void captureImage() {
    if (setuped) {
      save(imageName);
    }
  }
  
  void draw() { 
    if (mousePressed) {
      fill(pickedColor);
      ellipse(mouseX, mouseY, 40, 40);
    }
  }
  
  public void blue() {
    if (setuped) {
      pickedColor = color(0,0,255);
    }
  }
  
  public void red() {
    if (setuped) {
      pickedColor = color(255,0,0);
    }
  }
  
  public void green() {
    if (setuped) {
      pickedColor = color(0,255,0);
    }
  }
  
  public void black() {
    if (setuped) {
      pickedColor = color(0,0,0);
    }
  }
  
  public void eraser() {
    if (setuped) {
      pickedColor = 200;
    }
  }
  
}
