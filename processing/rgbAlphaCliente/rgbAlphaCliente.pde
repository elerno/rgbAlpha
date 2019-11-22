import de.bezier.data.sql.*;
import java.util.Collections;

MySQL RgbAlphaXt;

DataBD BD;

// Client specific variables.

int clientNo;


int[] pxPerCycleOptions = {1300, 500, 300, 200, 700, 1100};
int pixelsPerCycle;
int[] cylcesPerLineOptions = {8, 1, 2, 3, 1, 5};
int cyclesPerLine;

//Declare global variables.
int offset;
int imageWidth;
int imageHeight;
int halfWidth;
int halfHeight;
int aurWidth;
int remWidth;
int aurHeight;
int remHeight;

float element1n2Red;
float element1n2Green;
float element1n2Blue;

boolean datosRecopilados = false;
boolean whited = false;
int whiteCount = 0;

Fondo F;
Elementos1y2 E1y2;
Elemento3 E3;
Elemento4 E4;
Elemento5 E5;
Elemento6 E6;
Elemento7 E7;

float[] bckgrndEndRGB;
float[] e2endX1X2;
float[] e7EndAlphaMinMax;



///////////////////////////////////////////////////

void setup() {
  //Canvas set-up
  size (1024, 600);
  clientNo = int(random(1, 7));
  pixelsPerCycle = pxPerCycleOptions[clientNo - 1];
  cyclesPerLine = cylcesPerLineOptions[clientNo - 1];
  //fullScreen();
  //background(255);
  frameRate(12);
  //Set the golbal variables
  offset = 25;
  imageWidth = width - offset;
  imageHeight = height - offset;
  halfWidth = imageWidth / 2;
  halfHeight = imageHeight / 2;
  aurWidth = int(imageWidth * .618);
  remWidth = imageWidth - aurWidth;
  aurHeight = int(imageHeight * .382);
  remHeight = imageHeight - aurHeight;
  // Draw a balck frame.
  strokeWeight(50);
  stroke(0);
  fill(255);
  rect(0, 0, width, height);
  strokeWeight(1); // reset stroke weight.
  F = new Fondo(offset, imageWidth, imageHeight, halfWidth, halfHeight, aurWidth, remWidth, aurHeight, remHeight);
  E1y2 = new Elementos1y2(offset, imageWidth, imageHeight, halfWidth, halfHeight, aurWidth, remWidth, aurHeight, remHeight);
  E3 = new Elemento3(offset, imageWidth, imageHeight, halfWidth, halfHeight, aurWidth, remWidth, aurHeight, remHeight);
  E4 = new Elemento4(offset, imageWidth, imageHeight, halfWidth, halfHeight, aurWidth, remWidth, aurHeight, remHeight);
  E5 = new Elemento5(offset, imageWidth, imageHeight, halfWidth, halfHeight, aurWidth, remWidth, aurHeight, remHeight);
  E6 = new Elemento6(offset, imageWidth, imageHeight, halfWidth, halfHeight, aurWidth, remWidth, aurHeight, remHeight);
  E7 = new Elemento7(offset, imageWidth, imageHeight, halfWidth, halfHeight, aurWidth, remWidth, aurHeight, remHeight);

  BD = new DataBD();

  String bdUser     = "rgbAlpha";
  String bdPass     = "1edith*Eugenio#3";
  String database = "RgbAlphaXt";
  String dbPort   = "3306";

  RgbAlphaXt = new MySQL( this, "192.168.1.1"  + ":" + dbPort, database, bdUser, bdPass );

  if (RgbAlphaXt.connect()) {
    RgbAlphaXt.query( "SELECT COUNT(*) FROM tUsuarios" );
    RgbAlphaXt.next();
    println( "number of rows: " + RgbAlphaXt.getInt(1) );
  } else {
    // connection failed !
  }
  noCursor();
}


////////////////////////////////////////////////

void draw() {
  if (datosRecopilados == false) {
    // Draw a balck frame.
    strokeWeight(50);
    stroke(0);
    fill(255);
    rect(0, 0, width, height);
    strokeWeight(1); // reset stroke weight.
    BD.obtenerDataPromedio();
    if(clientNo == 5) {
      BD.obtenerDataPromedio();
    } else if(clientNo == 2) {
      BD.obtenerDataMixta();
    } else {
    BD.obtenerDataUsuarioAleatorio();
    }
    datosRecopilados = true;
  } else { 
    if (F.calculado == false) {
      bckgrndEndRGB = F.calcular(BD.backgroundRedBD, 
                                  BD.backgroundGreenBD, 
                                  BD.backgroundBlueBD, 
                                  BD.imperfectionWeightBD, 
                                  BD.imperfectionPercentageBD
                                  );
      if(clientNo == 1 || clientNo == 4) {
        Collections.reverse(F.data);
      } else if (clientNo == 2 || clientNo == 5){
        Collections.shuffle(F.data);
      }
      //Collections.rotate(F.data, int(random(1, F.data.size()-1)));
    }
    if (F.calculado == true && F.dibujado == false) {
      F.dibujar(pixelsPerCycle);
    }

    //////////////////////////////////////////////////////////////////////////////////
//1
    if (E1y2.calculado1 == false && F.dibujado == true) {
      E1y2.resetDefaults();
      E1y2.calcular1(BD.element1n2RedBD, 
                      BD.element1n2GreenBD, 
                      BD.element1n2BlueBD, 
                      BD.gapPercentageBD
                      );
      if(clientNo == 1 || clientNo == 3) {
        Collections.reverse(E1y2.data);
      } else if (clientNo == 2 || clientNo == 5){
        Collections.rotate(E1y2.data, int(random(1, E1y2.data.size()-1)));
        if (clientNo % 2 == 0) {
          Collections.reverse(E1y2.data);
        }
        
      }
      //Collections.shuffle(E1y2.data);
    }
 //4
    if (E1y2.calculado1 == true && E1y2.dibujado2 == true && E1y2.dibujado1 == false) {
      if (frameCount % cyclesPerLine == 0) {
        E1y2.dibujar1();
      }
    }
//2
    if (E1y2.calculado2 == false && E1y2.calculado1 == true) {
      e2endX1X2 = E1y2.calcular2();
      //Collections.shuffle(E1y2.data2);
      //Collections.reverse(E1y2.data2);
      //Collections.rotate(E1y2.data2, int(random(1, E1y2.data2.size()-1)));
      if(clientNo == 1 || clientNo == 3) {
        Collections.reverse(E1y2.data2);
      } else if (clientNo == 2 || clientNo == 5){
        Collections.rotate(E1y2.data2, int(random(1, E1y2.data2.size()-1)));
        if (clientNo % 2 == 1) {
          Collections.reverse(E1y2.data2);
        }
      }
      //Collections.shuffle(E1y2.data2);
    }
//3
    if (E1y2.calculado2 == true && E1y2.dibujado2 == false) {
      if (frameCount % cyclesPerLine == 0) {
        E1y2.dibujar2();
      }
    }

    ////////////////////////////////////////////////////////////////////////////////////////

    if (E3.calculado == false && E1y2.dibujado1 == true) {
      //Variables taken from other classes
      E3.resetDefaults();
      E3.red = bckgrndEndRGB[0];
      E3.green = bckgrndEndRGB[1];
      E3.blue = bckgrndEndRGB[2];
      E3.x1 = e2endX1X2[0];
      E3.x2 = e2endX1X2[1];
      E3.calcular(BD.startAlphaBD, BD.endAlphaBD);
      Collections.reverse(E3.data);
    }

    if (E3.calculado == true && E3.dibujado == false) {
       if (frameCount % 13 == 0) {
         E3.dibujar();
       }
    }

    ////////////////////////////////////////////////////////////////////////////////////////

    if (E4.calculado == false && E3.dibujado == true) {
      E4.resetDefaults();
      //Variables taken from other classes
      E4.red = BD.element1n2RedBD;
      E4.green = BD.element1n2GreenBD;
      E4.blue = BD.element1n2BlueBD;
      E4.calcular(BD.maxAlphaBD);
      Collections.reverse(E4.data);
    }

    if (E4.calculado == true && E4.dibujado == false) {
      if (frameCount % 1 == 0) {
        E4.dibujar();
      }
    }

    ////////////////////////////////////////////////////////////////////////////////////////

    if (E5.calculado == false && E4.dibujado == true) {
      E5.calcular(BD.gray1BD, 
                   BD.gray2BD, 
                   BD.maxAlpha2BD, 
                   BD.lineChanceBD
                   );
      Collections.shuffle(E5.data);
    }

    if (E5.calculado == true && E5.dibujado == false) {
      if (frameCount % 2 == 0) {
        E5.dibujar();
      }
    }

    ////////////////////////////////////////////////////////////////////////////////////////

    if (E6.calculado == false && E5.dibujado == true) { 
      e7EndAlphaMinMax = E6.calcular(BD.startAlpha1BD, 
      BD.endAlpha1BD
        );
    }

    if (E6.calculado == true && E6.dibujado == false) {
      translate(aurWidth, (imageHeight * .25)+ 10);
      rotate(radians(22.5));
      if (frameCount % 1 == 0) {
        E6.dibujar();
      }
    }

    ////////////////////////////////////////////////////////////////////////////////////////

    if (E7.calculado == false && E6.dibujado == true) {
      E7.calcular(e7EndAlphaMinMax[0], e7EndAlphaMinMax[1]);
      Collections.reverse(E7.data);
      
    }

    if (E7.calculado == true && E7.dibujado == false) {
      translate(aurWidth, (imageHeight * .25)+ 10);
      rotate(radians(191.25));
      if (frameCount % 2 == 0) {
        E7.dibujar();
      }
    }
    if (E7.dibujado == true && whited == false) {
        whitener();
    }
    
    if (whited == true && datosRecopilados == true) {
      datosRecopilados = false;
      F.calculado = false;
      E1y2.calculado1 = false;
      E1y2.calculado2 = false;
      E3.calculado = false;
      E4.calculado = false;
      E5.calculado = false;
      E6.calculado = false;
      E7.calculado = false;
      F.dibujado = false;
      E1y2.dibujado1 = false;
      E1y2.dibujado2 = false;
      E3.dibujado = false;
      E4.dibujado = false;
      E5.dibujado = false;
      E6.dibujado = false;
      E7.dibujado = false;
      whited = false;
      whiteCount = 0;
      
    }
  }
}

void whitener() {
  if (whiteCount < 100) {
    noStroke();
    fill(255, 10);
    rect(0, 0, width, height);
    whiteCount +=1;
  } else {
    whited = true;
  }
  
}

void keyPressed() {
  // to disable all key presses (escape etc.)
  // this means it will be a challenge (but not impossible)
  // to get out on an exported full screen application
  if(key==27) {
    println("esc");
    key=0;
  }
}
