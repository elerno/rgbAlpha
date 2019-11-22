import controlP5.*;
import de.bezier.data.sql.*;

ControlP5 cp5;
MySQL RgbAlphaXt;
Textarea textoIntro, textoFondo;
PFont font;
Texto T;
Pantalla1 P1;
Pantalla2 P2;
DataBD BD;

ControlWindow controlWindow;
Canvas cc;

boolean fondoColor = false;
boolean removeBC1 = false;
boolean removeBC2 = false;
boolean removeBC3 = false;
boolean removeBC4 = false;
boolean removeBC5 = false;
boolean removeBC6 = false;
boolean removeBC7 = false;
boolean removeBC8 = false;
boolean removeBC9 = false;
boolean removeBC10 = false;
boolean drawGroup3 = false;
boolean drawGroup4 = false;
boolean drawGroup5 = false;
boolean drawGroup6 = false;
boolean drawGroup7 = false;
boolean drawGroup8 = false;
boolean drawGroup9 = false;
boolean contAImperfeccion = false;
boolean probarImperfeccion = false;
boolean probarE1y2 = false;
boolean probarE3 = false;
boolean probarE4 = false;
boolean probarE5 = false;
boolean probarE6 = false;
int backgroundRed = 255; 
int backgroundGreen = 255;
int backgroundBlue = 255;
float imperfectionWeight = 2;
float imperfectionPercentage = 12.5;

float startAlpha;
float endAlpha;
float startAlpha1 = 35;
float endAlpha1 = 150;
float maxAlpha;
float maxAlpha2;

float gray1;
float gray2;
float lineChance = .5;

String correo;
int enviaCorreo  = 1;




void setup() {
  /////////////////////////CONFIGURACIÓN PARA DIBUJO//////////////////////
  //Set the golbal variables
  offset = 25;
  imageWidth = 1024 - offset;
  imageHeight = 600 - offset;
  halfWidth = imageWidth / 2;
  halfHeight = imageHeight / 2;
  aurWidth = int(imageWidth * .618);
  remWidth = imageWidth - aurWidth;
  aurHeight = int(imageHeight * .382);
  remHeight = imageHeight - aurHeight;
  // Draw a balck frame.
  F = new Fondo(offset, imageWidth, imageHeight, halfWidth, halfHeight, aurWidth, remWidth, aurHeight, remHeight);
  E1y2 = new Elementos1y2(offset, imageWidth, imageHeight, halfWidth, halfHeight, aurWidth, remWidth, aurHeight, remHeight);
  E3 = new Elemento3(offset, imageWidth, imageHeight, halfWidth, halfHeight, aurWidth, remWidth, aurHeight, remHeight);
  E4 = new Elemento4(offset, imageWidth, imageHeight, halfWidth, halfHeight, aurWidth, remWidth, aurHeight, remHeight);
  E5 = new Elemento5(offset, imageWidth, imageHeight, halfWidth, halfHeight, aurWidth, remWidth, aurHeight, remHeight);
  E6 = new Elemento6(offset, imageWidth, imageHeight, halfWidth, halfHeight, aurWidth, remWidth, aurHeight, remHeight);
  E7 = new Elemento7(offset, imageWidth, imageHeight, halfWidth, halfHeight, aurWidth, remWidth, aurHeight, remHeight);

  // Instancia la cp5, y dibuja el fondo.
  size(1424, 800);
  background(0);
  cp5 = new ControlP5(this);
  T = new Texto();
  P1 = new Pantalla1();
  P2 = new Pantalla2();
  P1.inicio();
  BD = new DataBD();

  String bdUser     = "rgbAlpha";
  String bdPass     = "1edith*Eugenio#3";
  String database = "RgbAlphaXt";
  String dbPort   = "3306";

  RgbAlphaXt = new MySQL( this, "localhost"  + ":" + dbPort, database, bdUser, bdPass );

  if (RgbAlphaXt.connect()) {
    RgbAlphaXt.query( "SELECT COUNT(*) FROM tUsuarios" );
    RgbAlphaXt.next();
    println( "number of rows: " + RgbAlphaXt.getInt(1) );
  } else {
    // connection failed !
  }
}

void draw() {
  if (cp5.getGroup("Mezcla de Colores")!=null && removeBC1 == true) {
    cp5.getGroup("Mezcla de Colores").remove();
    fill(0);
    noStroke();
    rect(width - 1024 - 10, 630, 550, 150);
    removeBC1 = false;
    contAImperfeccion = true;
  }
  if (contAImperfeccion == true) {
    P2.imperfeccion();
    contAImperfeccion = false;
  }
  if (cp5.getGroup("Definición de imperfecciones")!=null && removeBC2 == true) {
    cp5.getGroup("Definición de imperfecciones").remove();
    fill(0);
    noStroke();
    rect(width - 1024 - 10, 630, 560, 160);
    removeBC2 = false;
    drawGroup3 = true;
  }
  if (drawGroup3 == true) {
    P2.e1y2();
    drawGroup3 = false;
  }
  if (cp5.getGroup("Elementos 1 y 2")!=null && removeBC3 == true) {
    E1y2.dibujado2 = true;
    cp5.getGroup("Elementos 1 y 2").remove();
    fill(0);
    noStroke();
    rect(width - 1024 - 10, 630, 560, 160);
    removeBC3 = false;
    drawGroup4 = true;
  }
  if (drawGroup4 == true) {
    P2.e1y2Huecos();
    drawGroup4 = false;
  }
  if (cp5.getGroup("Huecos elementos 1 y 2")!=null && removeBC4 == true) {
    E1y2.dibujado2 = true;
    cp5.getGroup("Huecos elementos 1 y 2").remove();
    fill(0);
    noStroke();
    rect(width - 1024 - 10, 630, 560, 160);
    removeBC4 = false;
    drawGroup5 = true;
  }
  if (drawGroup5 == true) {
    P2.e3();
    drawGroup5 = false;
  }
  if (cp5.getGroup("Elemento 3")!=null && removeBC5 == true) {
    E3.dibujado = true;
    cp5.getGroup("Elemento 3").remove();
    fill(0);
    noStroke();
    rect(width - 1024 - 10, 630, 560, 160);
    removeBC5 = false;
    drawGroup6 = true;
  }
  if (drawGroup6 == true) {
    P2.e4();
    drawGroup6 = false;
  }
  if (cp5.getGroup("Elemento 4")!=null && removeBC6 == true) {
    E4.dibujado = true;
    cp5.getGroup("Elemento 4").remove();
    fill(0);
    noStroke();
    rect(width - 1024 - 10, 630, 560, 160);
    removeBC6 = false;
    drawGroup7 = true;
  }
  if (drawGroup7 == true) {
    P2.e5();
    drawGroup7 = false;
  }
  if (cp5.getGroup("Elemento 5")!=null && removeBC7 == true) {
    E5.dibujado = true;
    cp5.getGroup("Elemento 5").remove();
    fill(0);
    noStroke();
    rect(width - 1024 - 10, 630, 560, 160);
    removeBC7 = false;
    drawGroup8 = true;
  }
  if (drawGroup8 == true) {
    P2.e6();
    drawGroup8 = false;
  }
  if (cp5.getGroup("Elemento 6")!=null && removeBC8 == true) {
    E6.dibujado = true;
    cp5.getGroup("Elemento 6").remove();
    fill(0);
    noStroke();
    rect(width - 1024 - 10, 630, 560, 160);
    removeBC8 = false;
    drawGroup9 = true;
  }
  if (drawGroup9 == true) {
    P2.e7();
    drawGroup9 = false;
  }
  if (cp5.getGroup("Terminar")!=null && removeBC9 == true) {
    //    E6.dibujado = true;
    cp5.getGroup("Terminar").remove();
    cp5.getGroup("txt1").remove();
    cp5.getGroup("txt2").remove();
    cp5.getGroup("lienzo").remove();
    cp5.getController("cancel").hide();
    background(0);
    fill(0);
    noStroke();
    rect(width - 1024 - 10, 630, 560, 160);
    //    restart();
    P1.fin();
    removeBC9 = false;
  }
  if (removeBC10 == true) {
    //    E6.dibujado = true;
    cp5.remove("aceptar");
    cp5.getGroup("txt3").remove();
    textoIntro.setText("");
    textoIntro.close();
    background(0);
    fill(0);
    noStroke();
    rect(width - 1024 - 10, 630, 560, 160);
    restart();
    P1.inicio();
    removeBC10 = false;
  }
}
///////////////////////////////////////////////
//ESCUCHA EVENTOS DE LA GUI
///////////////////////////////////////////////

public void controlEvent(ControlEvent theEvent) {
}

///////////////////EVENTOS INICIO//////////////

public void comenzar() {
  background(0);
  cp5.remove("comenzar");
  textoIntro.setText("");
  textoIntro.close();
  fondoColor = true;
  P2.fondo();
  P2.cancelar();
  cp5.addGroup("lienzo")
    .setLabel("Lienzo")
      .setPosition(width - 1024 - 15, 15)
        .setWidth(1024)
          .setSize(1024, 600)
            .setBarHeight(10)
              .disableCollapse()
                .addCanvas(new TestCanvas())
                  ;
}

//////////////////////// EVENTOS FONDO///////////
public void rojo(int val) {
  backgroundRed = val;
  cp5.getController("rojo").setColorBackground(color(backgroundRed, 0, 0));
}

public void verde(int val) {
  backgroundGreen = val;
  cp5.getController("verde").setColorBackground(color(0, backgroundGreen, 0));
}

public void azul(int val) {
  backgroundBlue = val;
  cp5.getController("azul").setColorBackground(color(0, 0, backgroundBlue));
}

public void fijar(int theValue) {
  textoFondo.setText("");
  fondoColor= false;
  removeBC1 = true;
}

public void pesoImperfeccion(float val) {
  imperfectionWeight = val;
}

public void porcentajeImperfeccion(int val) {
  imperfectionPercentage = val;
}

public void probar() {
  cp5.getController("pesoImperfeccion").setLock(true);
  cp5.getController("porcentajeImperfeccion").setLock(true);
  cp5.getController("probar").setLock(true);
  probarImperfeccion = true;
  F.dibujado = false;
}

public void fijar2() {
  textoFondo.setText("");
  removeBC2 = true;
  BD.backgroundRedBD = str(backgroundRed);
  BD.backgroundGreenBD = str(backgroundGreen);
  BD.backgroundBlueBD = str(backgroundBlue);
  BD.imperfectionWeightBD = str(imperfectionWeight);
  BD.imperfectionPercentageBD = str(imperfectionPercentage);
}

//////////////////////// EVENTOS ELEMENTOS 1 Y 2 ///////////

public void rojo3(int val) {
  element1n2Red = val;
  cp5.getController("rojo3").setColorBackground(color(int(element1n2Red), 0, 0));
  probarE1y2 = true;
  E1y2.dibujado1 = false;
  E1y2.dibujado2 = false;
}

public void verde3(int val) {
  element1n2Green = val;
  cp5.getController("verde3").setColorBackground(color(0, int(element1n2Green), 0));
  probarE1y2 = true;
  E1y2.dibujado1 = false;
  E1y2.dibujado2 = false;
}

public void azul3(int val) {
  element1n2Blue = val;
  cp5.getController("azul3").setColorBackground(color(0, 0, int(element1n2Blue)));
  probarE1y2 = true;
  E1y2.dibujado1 = false;
  E1y2.dibujado2 = false;
}


public void fijar3() {
  textoFondo.setText("");
  removeBC3 = true;
}


public void porcentajeHuecos(int val) {
  gapPercentage = val;
  probarE1y2 = true;
  E1y2.dibujado1 = false;
  E1y2.dibujado2 = false;
}


public void recalcular4() {
  probarE1y2 = true;
  E1y2.dibujado1 = false;
  E1y2.dibujado2 = false;
}


public void fijar4() {
  textoFondo.setText("");
  removeBC4 = true;
  E3.red = bckgrndEndRGB[0];
  E3.green = bckgrndEndRGB[1];
  E3.blue = bckgrndEndRGB[2];

  BD.element1n2RedBD = str(element1n2Red);
  BD.element1n2GreenBD = str(element1n2Green);
  BD.element1n2BlueBD = str(element1n2Blue);
  BD.gapPercentageBD = str(gapPercentage);
}

//////////////////////// EVENTOS ELEMENTO 3///////////

public void alfaInicial(int val) {
  startAlpha = val;
  probarE3 = true;
  E3.dibujado = false;
}


public void alfaFinal(int val) {
  endAlpha = val;
  probarE3 = true;
  E3.dibujado = false;
}

public void fijar5() {
  textoFondo.setText("");
  removeBC5 = true;

  BD.startAlphaBD = str(startAlpha);
  BD.endAlphaBD = str(endAlpha);
}

//////////////////////// EVENTOS ELEMENTO 4///////////

public void maxAlpha(int val) {
  maxAlpha = val;
  probarE4 = true;
  E4.dibujado = false;
}

public void fijar6() {
  textoFondo.setText("");
  removeBC6 = true;

  BD.maxAlphaBD = str(maxAlpha);
}

//////////////////////// EVENTOS ELEMENTO 5///////////

public void gris1(int val) {
  gray1 = val;
  cp5.getController("gris1").setColorBackground(color(gray1));
  probarE5 = true;
  E5.dibujado = false;
}

public void gris2(int val) {
  gray2 = val;
  cp5.getController("gris2").setColorBackground(color(gray2));
  probarE5 = true;
  E5.dibujado = false;
}

public void maxAlpha7(float val) {
  maxAlpha2 = val;
  probarE5 = true;
  E5.dibujado = false;
}

public void fijar7() {
  textoFondo.setText("");
  cp5.getController("gris1").hide();
  cp5.getController("gris2").hide();
  cp5.getController("maxAlpha7").hide();
  cp5.getController("fijar7").hide();
  cp5.getController("porcentajeLineas8").show();
  cp5.getController("fijar7a").show();
}

public void porcentajeLineas8(float val) {
  lineChance = val;
  probarE5 = true;
  E5.dibujado = false;
}

public void fijar7a() {
  textoFondo.setText("");
  removeBC7 = true;

  BD.gray1BD = str(gray1);
  BD.gray2BD = str(gray2);
  BD.maxAlpha2BD = str(maxAlpha2);
  BD.lineChanceBD = str(lineChance);
}

//////////////////////// EVENTOS ELEMENTO 6 ///////////

public void minAlpha8(float val) {
  startAlpha1 = val;
  if (startAlpha1 >= endAlpha1) {
    cp5.getController("maxAlpha8").setValue(startAlpha1 + 1);
  }
  probarE6 = true;
  E6.dibujado = false;
}

public void maxAlpha8(float val) {
  endAlpha1 = val;
  if (startAlpha1 >= endAlpha1) {
    cp5.getController("minAlpha8").setValue(endAlpha1 - 1);
  }
  probarE6 = true;
  E6.dibujado = false;
}

public void fijar8() {
  textoFondo.setText("");
  removeBC8 = true;

  BD.startAlpha1BD = str(startAlpha1);
  BD.endAlpha1BD = str(endAlpha1);
}

//////////////////////// EVENTOS FINALIZAR ///////////

public void enviarCorreo(int radio) {
  if (radio == 1) {
    enviaCorreo = 1;
  } else if (radio == 2) {
    enviaCorreo = 0;
  }
}

public void Terminar9() {
  textoFondo.setText("");
  correo = cp5.get(Textfield.class, "email9").getText();

  BD.correoEBD = correo;
  BD.enviarBD = str(enviaCorreo);
  BD.mandarDatos();
  removeBC9 = true;
}


public void aceptar() {
  //  textoFondo.setText("");
  //  correo = cp5.get(Textfield.class, "email9").getText();
  //
  //  BD.correoEBD = correo;
  //  BD.enviarBD = str(enviaCorreo);
  //  BD.mandarDatos();
  removeBC10 = true;
}

public void cancel() {
  if (cp5.getGroup("Mezcla de Colores")!=null) {
    cp5.getGroup("Mezcla de Colores").remove();
  }
  if (cp5.getGroup("Definición de imperfecciones")!=null) {
    cp5.getGroup("Definición de imperfecciones").remove();
  }
  if (cp5.getGroup("Elementos 1 y 2")!=null) {
    cp5.getGroup("Elementos 1 y 2").remove();
  }
  if (cp5.getGroup("Huecos elementos 1 y 2")!=null) {
    cp5.getGroup("Huecos elementos 1 y 2").remove();
  }
  if (cp5.getGroup("Elemento 3")!=null) {
    cp5.getGroup("Elemento 3").remove();
  }
  if (cp5.getGroup("Elemento 4")!=null) {
    cp5.getGroup("Elemento 4").remove();
  }
  if (cp5.getGroup("Elemento 5")!=null) {
    cp5.getGroup("Elemento 5").remove();
  }
  if (cp5.getGroup("Elemento 6")!=null) {
    cp5.getGroup("Elemento 6").remove();
  }
  if (cp5.getGroup("Terminar")!=null) {
    cp5.getGroup("Terminar").remove();
    cp5.getGroup("txt1").remove();
    cp5.getGroup("txt2").remove();
    cp5.getGroup("lienzo").remove();
    background(0);
    fill(0);
    noStroke();
    rect(width - 1024 - 10, 630, 560, 160);
    //    restart();
  }
  textoIntro.setText("");
  cp5.getGroup("txt1").remove();
  cp5.getGroup("txt2").remove();
  cp5.getGroup("lienzo").remove();
  cp5.getController("cancel").hide();
  background(0);
  fill(0);
  noStroke();
  rect(width - 1024 - 10, 630, 560, 160);
  restart();
  P1.inicio();
  removeBC10 = false;
  restart();
}


void restart() {
  fondoColor = false;
  removeBC1 = false;
  removeBC2 = false;
  removeBC3 = false;
  removeBC4 = false;
  removeBC5 = false;
  removeBC6 = false;
  removeBC7 = false;
  removeBC8 = false;
  removeBC9 = false;
  removeBC10 = false;
  drawGroup3 = false;
  drawGroup4 = false;
  drawGroup5 = false;
  drawGroup6 = false;
  drawGroup7 = false;
  drawGroup8 = false;
  drawGroup9 = false;
  contAImperfeccion = false;
  probarImperfeccion = false;
  probarE1y2 = false;
  probarE3 = false;
  probarE4 = false;
  probarE5 = false;
  probarE6 = false;
  backgroundRed = 255; 
  backgroundGreen = 255;
  backgroundBlue = 255;
  imperfectionWeight = 2;
  imperfectionPercentage = 12.5;

  gapPercentage = 0;

  startAlpha1 = 35;
  endAlpha1 = 150;

  lineChance = .5;

  correo = "";
  enviaCorreo  = 1;
}

/////////////////////////CONFIGURACIÓN PARA DIBUJO//////////////////////////////////////////////

//Declare global drawing variables.
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
int gapPercentage;

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

