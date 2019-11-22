

class TestCanvas extends Canvas {

  public void setup(PGraphics pg) {
  }

  public void draw(PGraphics pg) {
    if (fondoColor == true) {
      pg.fill(backgroundRed, backgroundGreen, backgroundBlue);

      pg.stroke(255);
      pg.strokeWeight(25);
      pg.rect(25, 25, 974, 550);
      pg.strokeWeight(0);
    }
    if (probarImperfeccion == true) {
      emptyCanvas(pg);

      bckgrndEndRGB = F.calcular(backgroundRed, backgroundGreen, backgroundBlue, imperfectionWeight, imperfectionPercentage);
      probarImperfeccion = false;
    }
    if (F.calculado == true && F.dibujado == false) {
      //int pixelsPerCycle = 10000;
      //F.dibujar(pixelsPerCycle, pg);
      image(F.fondoCanvas, 0, 0);
      cp5.getController("probar").setCaptionLabel("Modificar");
      cp5.getController("fijar2").show();
      F.dibujado = true;
      cp5.getController("fijar2").show();
      cp5.getController("fijar2").setLock(false);
      cp5.getController("pesoImperfeccion").setLock(false);
      cp5.getController("porcentajeImperfeccion").setLock(false);
      cp5.getController("probar").setLock(false);
    }
    //////////////////////// ELEMENTOS 1 Y 2/////////////////////////////////////////////
    if (probarE1y2 == true) {
      //User Modifiable Variables for Background
      //element1n2Red = 255;
      //element1n2Green = 255;
      //element1n2Blue = 0;
      //float gapPercentage = 1;//1.31;
      E1y2.resetDefaults();
      E1y2.calcular1(element1n2Red, element1n2Green, element1n2Blue, gapPercentage);
      e2endX1X2 = E1y2.calcular2();
      probarE1y2 = false;
    }
    if (E1y2.calculado2 == true && E1y2.dibujado2 == false) {
      emptyCanvas(pg);
      image(F.fondoCanvas, 0, 0);
      image(E1y2.elementos1y2, 0, 0);
      E1y2.dibujado2 = true;
    }
    //////////////////////// ELEMENTO 3//////////////////////////////////////////////////
    if (probarE3 == true) {
      E3.resetDefaults();
      E3.calcular(startAlpha, endAlpha);
      probarE3 = false;
    }
    if (E3.calculado == true && E3.dibujado == false) {
      emptyCanvas(pg);
      image(F.fondoCanvas, 0, 0);
      image(E1y2.elementos1y2, 0, 0);
      image(E3.elemento3, 0, 0);
      E3.dibujado = true;
    }
    //////////////////////// ELEMENTO 4//////////////////////////////////////////////////
    if (probarE4 == true) {
      E4.resetDefaults();
      E4.calcular(maxAlpha);
      probarE4 = false;
    }
    if (E4.calculado == true && E4.dibujado == false) {
      emptyCanvas(pg);
      image(F.fondoCanvas, 0, 0);
      image(E1y2.elementos1y2, 0, 0);
      image(E3.elemento3, 0, 0);
      image(E4.elemento4, 0, 0);
      E4.dibujado = true;
    }
    //////////////////////// ELEMENTO 5//////////////////////////////////////////////////
    if (probarE5 == true) {
      E5.calcular(gray1, gray2, maxAlpha2, lineChance);
      probarE5 = false;
    }
    if (E5.calculado == true && E5.dibujado == false) {
      emptyCanvas(pg);
      image(F.fondoCanvas, 0, 0);
      image(E1y2.elementos1y2, 0, 0);
      image(E3.elemento3, 0, 0);
      image(E4.elemento4, 0, 0);
      image(E5.elemento5, 0, 0);
      E5.dibujado = true;
    }
    //////////////////////// ELEMENTO 6//////////////////////////////////////////////////
    if (probarE6 == true) {
      e7EndAlphaMinMax = E6.calcular(startAlpha1, endAlpha1);
      E7.calcular(e7EndAlphaMinMax[0], e7EndAlphaMinMax[1]);
      probarE6 = false;
    }
    if (E6.calculado == true && E6.dibujado == false) {
      emptyCanvas(pg);
      image(F.fondoCanvas, 0, 0);
      image(E1y2.elementos1y2, 0, 0);
      image(E3.elemento3, 0, 0);
      image(E4.elemento4, 0, 0);
      image(E5.elemento5, 0, 0);
      image(E6.elemento6, 0, 0);
      image(E7.elemento7, 0, 0);
      E6.dibujado = true;
    }
  }

  void emptyCanvas(PGraphics pg) {
    pg.fill(255);
    pg.stroke(0);
    pg.strokeWeight(1);
    pg.rect(0, 0, 1024, 600);
    pg.strokeWeight(0);
  }
}

class Fondo {
  int offset;
  int imageWidth;
  int imageHeight;
  int halfWidth;
  int halfHeight;
  int aurWidth;
  int remWidth;
  int aurHeight;
  int remHeight;
  float rand;
  int counter;
  ArrayList<float[]> data = new ArrayList<float[]>();
  boolean calculado = false;
  boolean dibujado = false;
  PGraphics fondoCanvas;

  Fondo(int of, int iW, int iH, int hW, int hH, int aW, int rW, int aH, int rH) {
    this.offset = of;
    this.imageWidth = iW;
    this.imageHeight = iH;
    this.halfWidth = hW;
    this.halfHeight = hH;
    this.aurWidth = aW;
    this.remWidth = rW;
    this.aurHeight = aH;
    this.remHeight = rH;
    this.counter = 0;
  }


  float[] calcular(float backgroundRed, float backgroundGreen, float backgroundBlue, float imperfectionWeight, float imperfectionPercentage) {
    float redLevel = backgroundRed;
    float greenLevel = backgroundGreen;
    float blueLevel = backgroundBlue;
    float colourLevel = 255;
    float colourStep1 = colourLevel / float(aurWidth);
    float colourStep2 = colourLevel / float(remWidth);
    //Variables for transparency
    float alpha = 255;
    float alpha2 = alpha;
    float alphaStep = alpha / halfHeight;
    float peso;
    float gauss;
    float pesoGauss;


    fondoCanvas = createGraphics(1024, 600);
    fondoCanvas.beginDraw();
    fondoCanvas.clear();
    fondoCanvas.endDraw();
    fondoCanvas.beginDraw();

    for (int x = 0; x <= imageWidth - offset; x++) {
      for (int y = 0; y <= imageHeight - offset; y++) {
        redLevel = map(colourLevel, 0, 255, 0, backgroundRed);
        greenLevel = map(colourLevel, 0, 255, 0, backgroundGreen);
        blueLevel = map(colourLevel, 0, 255, 0, backgroundBlue);
        rand = random(1);
        if (rand < 1 - (imperfectionPercentage / 100)) {
          alpha2 = alpha;
          peso = 1;
          //strokeWeight(peso);
          //stroke(int(redLevel), int(greenLevel), int(blueLevel), alpha2);
        } else {
          if (alpha > 127.5) {
            peso = random(1, imperfectionWeight);
            alpha2 = alpha - random(30);
            //strokeWeight(peso);
            //stroke(int(redLevel), int(greenLevel), int(blueLevel), alpha - random(30));
          } else {
            peso = random(1, imperfectionWeight);
            alpha2 = alpha + random(30);
            //strokeWeight(peso);
            //stroke(int(redLevel), int(greenLevel), int(blueLevel), alpha + random(30));
          }
        }
        gauss = randomGaussian();
        pesoGauss = map(gauss, -1, 1, .5, 1.5);
        float[] datos = { x + offset, y + offset, peso, redLevel, greenLevel, blueLevel, alpha2 };
        data.add(datos);
        //line(x, y, x, y);
        //Increase trasparency towards the centre of the y-axis, and decrease it towards the bottom.
        if (y < halfHeight) {
          alpha -= alphaStep;
        } else if (y == halfHeight) {
          alpha = 0;
        } else if (y > halfHeight) {
          alpha += alphaStep;
        }
        //Decrease red level towards the (right) golden section of the x-axis, and increase it towards the right.
        fondoCanvas.strokeWeight(peso);
        fondoCanvas.stroke(int(redLevel), int(greenLevel), int(blueLevel), alpha2);
        fondoCanvas.fill(int(redLevel), int(greenLevel), int(blueLevel), alpha2);
        fondoCanvas.line(x + offset, y + offset, x + offset, y + offset);
      }
      if (x < aurWidth) {
        colourLevel -= colourStep1;
      } else if (x == aurWidth) {
        colourLevel = 0;
      } else if (x > aurWidth) {
        colourLevel += colourStep2;
      }
    }
    fondoCanvas.endDraw();
    fondoCanvas.save("fondo.png");
    calculado = true;
    float[] carryValues = {backgroundRed, backgroundGreen, backgroundBlue};
    return carryValues;
  }


  void dibujar(int pixelsPerCycle, PGraphics pg) {
    //Collections.shuffle(data);
    for (int i=0; i < pixelsPerCycle; i++) {
      if (data.size() > 0) {
        float[] parametros = data.remove(0);
        pg.strokeWeight(parametros[2]);
        pg.stroke(int(parametros[3]), int(parametros[4]), int(parametros[5]), parametros[6]);
        pg.fill(int(parametros[3]), int(parametros[4]), int(parametros[5]), parametros[6]);
        pg.line(parametros[0], parametros[1], parametros[0], parametros[1]);
        counter += 1;
      } else {
        dibujado = true;
      }
    }
    //cp5.getController("fijar2").show();
    //cp5.getController("fijar2").setLock(false);
    //cp5.getController("pesoImperfeccion").setLock(false);
    //cp5.getController("porcentajeImperfeccion").setLock(false);
    //cp5.getController("probar").setLock(false);
  }
}


////////////////////////////////////////////////////////////////////////////////////////////////

class Elementos1y2 extends Fondo {
  boolean calculado1 = false;
  boolean dibujado1 = false;
  boolean calculado2 = false;
  boolean dibujado2 = false;
  float x1 = offset;
  float x2 = aurWidth;
  float redLevel;
  float greenLevel;
  float blueLevel;
  float colourLevel = 0;
  float colourStep = 255 / (float(aurHeight + halfHeight - offset));
  //Variables for transparency
  float alphaStep = 127.5 / (aurHeight);
  float alpha = 0;
  float element1n2Red;
  float element1n2Green;
  float element1n2Blue;
  float gapPercentage;

  PGraphics elementos1y2;

  Elementos1y2(int of, int iW, int iH, int hW, int hH, int aW, int rW, int aH, int rH) {
    super(of, iW, iH, hW, hH, aW, rW, aH, rH);
  }


  void resetDefaults() {
    calculado1 = false;
    dibujado1 = false;
    calculado2 = false;
    dibujado2 = false;
    x1 = offset;
    x2 = aurWidth;
    colourLevel = 0;
    colourStep = 255 / (float(aurHeight + halfHeight - offset));
    alphaStep = 127.5 / (aurHeight);
    alpha = 0;
  }


  void calcular1(float bRed, float bGreen, float bBlue, float gPercentage) {
    element1n2Red = bRed;
    element1n2Green = bGreen;
    element1n2Blue = bBlue;
    gapPercentage = gPercentage;
    // Draw yellow lines of decreasing length with increasing levels of yellow an transparency.

    elementos1y2 = createGraphics(1024, 600);
    elementos1y2.beginDraw();
    elementos1y2.clear();
    elementos1y2.endDraw();
    elementos1y2.beginDraw();

    for (int y=offset; y<=aurHeight; y++) {
      rand = random(1);
      if (rand < 1 - (gapPercentage / 100)) {
        redLevel = map(colourLevel, 0, 255, 0, element1n2Red);
        greenLevel = map(colourLevel, 0, 255, 0, element1n2Green);
        blueLevel = map(colourLevel, 0, 255, 0, element1n2Blue);
        float[] datos = { x1, x2, y, redLevel, greenLevel, blueLevel, alpha};
        data.add(datos);
        elementos1y2.strokeWeight(1);
        elementos1y2.stroke(int(datos[3]), int(datos[4]), int(datos[5]), datos[6]);
        elementos1y2.line(datos[0], datos[2], datos[1], datos[2]);
      }
      x1 += 1.3;
      x2 -= 2.1;
      colourLevel += colourStep;
      alpha += alphaStep;
    }
    calculado1 = true;
  }


  float[] calcular2() {
    // From mid-height increase the length of the lines.
    float alphaStep = 136.5 / (halfHeight);
    float halfBase = (x1 - x2) /2;
    x1 = (aurWidth * .618) + halfBase + 35;
    x2 = (aurWidth * .618) - halfBase + 35;
    for (int y = int(halfHeight); y <= imageHeight; y++) {
      rand = random(1);
      if (rand < 1 - (gapPercentage / 100)) {
        redLevel = map(colourLevel, 0, 255, 0, element1n2Red);
        greenLevel = map(colourLevel, 0, 255, 0, element1n2Green);
        blueLevel = map(colourLevel, 0, 255, 0, element1n2Blue);
        float[] datos = { x1, x2, y, redLevel, greenLevel, blueLevel, alpha};
        data.add(datos);
        elementos1y2.strokeWeight(1);
        elementos1y2.stroke(int(datos[3]), int(datos[4]), int(datos[5]), datos[6]);
        elementos1y2.line(datos[0], datos[2], datos[1], datos[2]);
      }
      x1 -= 1.3;
      x2 += 2.1;
      colourLevel += colourStep;
      alpha += alphaStep;
    }
    elementos1y2.endDraw();
    elementos1y2.save("elementos1y2.png");
    calculado2 = true;
    float[] carryValues = {x1, x2};
    return carryValues;
  }


  void dibujar1(PGraphics pg) {
    //Collections.shuffle(data);
    if (data.size() > 0) {
      float[] parametros = data.remove(int(random(0, data.size())));
      pg.strokeWeight(1);
      pg.stroke(int(parametros[3]), int(parametros[4]), int(parametros[5]), parametros[6]);
      pg.line(parametros[0], parametros[2], parametros[1], parametros[2]);
      counter += 1;
    } else {
      dibujado1 = true;
    }
  }


  void dibujar2(PGraphics pg) {
    //Collections.shuffle(data);
    if (data.size() > 0) {
      float[] parametros = data.remove(int(random(0, data.size())));
      pg.strokeWeight(1);
      pg.stroke(int(parametros[3]), int(parametros[4]), int(parametros[5]), parametros[6]);
      pg.line(parametros[0], parametros[2], parametros[1], parametros[2]);
      counter += 1;
    } else {
      dibujado2 = true;
    }
  }
}


////////////////////////////////////////////////////////////////////////////////////////////////

class Elemento3 extends Fondo {
  boolean calculado = false;
  boolean dibujado = false;
  float x1;
  float x2;
  float alpha;
  float red;
  float green;
  float blue;

  PGraphics elemento3;

  Elemento3(int of, int iW, int iH, int hW, int hH, int aW, int rW, int aH, int rH) {
    super(of, iW, iH, hW, hH, aW, rW, aH, rH);
  }


  void calcular(float startAlpha, float endAlpha) {
    x1 += 1.3;
    x2 -= 2.1;
    int a = 1;
    int b = 2;
    int counter = 1;

    elemento3 = createGraphics(1024, 600);
    elemento3.beginDraw();
    elemento3.clear();
    elemento3.endDraw();
    elemento3.beginDraw();

    for (int y = int(imageHeight); y >= 0; y--) {
      alpha = map(counter, 1, 1024, startAlpha, endAlpha);
      stroke(red, green, blue, alpha);
      if (counter == b) {
        if (x2 <= offset) {
          x2 = offset + 3;
        }
        float[] datos = { x1, x2, y, red, green, blue, alpha};
        data.add(datos);

        elemento3.strokeWeight(5);
        elemento3.stroke(int(datos[3]), int(datos[4]), int(datos[5]), datos[6]);
        elemento3.line(datos[0], datos[2], datos[1], datos[2]);
        a = b;
        b +=a;
      }
      x1 += 1.3;
      x2 -= 2.1;
      counter += 1;
    }
    elemento3.endDraw();
    elemento3.save("elemento3.png");
    calculado = true;
  }


  void dibujar(PGraphics pg) {
    //Collections.shuffle(data);
    if (data.size() > 0) {
      float[] parametros = data.remove(int(random(0, data.size())));
      pg.strokeWeight(5);
      pg.stroke(int(parametros[3]), int(parametros[4]), int(parametros[5]), parametros[6]);
      pg.line(parametros[0], parametros[2], parametros[1], parametros[2]);
      counter += 1;
    } else {
      dibujado = true;
    }
  }


  void resetDefaults() {
    x1 = e2endX1X2[0];
    x2 = e2endX1X2[1];
  }
}


class Elemento4 extends Fondo {
  boolean calculado = false;
  boolean dibujado = false;
  float x1;
  float x2;
  float red;
  float green;
  float blue;
  PGraphics elemento4;



  Elemento4(int of, int iW, int iH, int hW, int hH, int aW, int rW, int aH, int rH) {
    super(of, iW, iH, hW, hH, aW, rW, aH, rH);
    this.red = 255;
    this.green = 255;
    this.blue = 255;
  }


  void calcular(float maxAlpha) {
    float yIterations = (imageHeight * .618) + offset;
    float alpha = maxAlpha;
    float alphaStep = maxAlpha / yIterations;
    x1 = aurWidth + (remWidth * .5) + 70;
    x2 = x1;

    elemento4 = createGraphics(1024, 600);
    elemento4.beginDraw();
    elemento4.clear();
    elemento4.endDraw();
    elemento4.beginDraw();

    for (int y = offset; y <= yIterations; y++) {
      float[] datos = { x1, x2, y, red, green, blue, alpha};
      data.add(datos);
      //float[] parametros = data.remove(int(random(0, data.size())));
      elemento4.strokeWeight(1);
      elemento4.fill(int(datos[3]), int(datos[4]), int(datos[5]), datos[6]);
      elemento4.stroke(int(datos[3]), int(datos[4]), int(datos[5]), datos[6]);
      elemento4.line(datos[0], datos[2], datos[1], datos[2]);
      x1 -= .55;
      x2 += .34;
      maxAlpha -= alphaStep;
      alpha = random(maxAlpha);
    }
    elemento4.endDraw();
    elemento4.save("elemento4.png");
    calculado = true;
  }


  void dibujar(PGraphics pg) {
    //Collections.shuffle(data);
    if (data.size() > 0) {
      float[] parametros = data.remove(int(random(0, data.size())));
      pg.strokeWeight(1);
      pg.fill(int(parametros[3]), int(parametros[4]), int(parametros[5]), parametros[6]);
      pg.stroke(int(parametros[3]), int(parametros[4]), int(parametros[5]), parametros[6]);
      pg.line(parametros[0], parametros[2], parametros[1], parametros[2]);
      counter += 1;
    } else {
      dibujado = true;
    }
  }


  void resetDefaults() {
    red = element1n2Red;
    green = element1n2Green;
    blue = element1n2Blue;
  }
}


class Elemento5 extends Fondo {
  boolean calculado = false;
  boolean dibujado = false;
  float alpha;
  PGraphics elemento5;




  Elemento5(int of, int iW, int iH, int hW, int hH, int aW, int rW, int aH, int rH) {
    super(of, iW, iH, hW, hH, aW, rW, aH, rH);
  }


  void calcular(float grayMin, float grayMax, float alphaMax, float lineChance) {
    float y1 = (imageHeight * .675) + offset;
    float y2 = y1;
    int xStart = int(imageWidth * .382) + offset;
    float xEnd = offset;
    float xExtra = 0;
    float grayLevel = grayMin;
    float colourStep1 = (grayMax-grayMin) / (xStart - xEnd);
    float weight = 1;

    elemento5 = createGraphics(1024, 600);
    elemento5.beginDraw();
    elemento5.clear();
    elemento5.endDraw();
    elemento5.beginDraw();

    for (int x = xStart; x > xEnd; x--) {
      rand = random(1);
      if (rand < lineChance) {
        alpha = (rand * alphaMax);
        weight = map(rand, 0, 1, 1, 5);
        float[] datos = { weight, grayLevel, alpha, x, y1, x+xExtra, y2};
        data.add(datos);
        elemento5.strokeWeight(datos[0]);
        elemento5.stroke(datos[1], datos[2]);
        elemento5.line(datos[3], datos[4], datos[5], datos[6]);
      }
      xExtra += .34;
      y2 -= .55;
      grayLevel += colourStep1;
    }
    elemento5.endDraw();
    elemento5.save("elemento5.png");
    calculado = true;
  }


  void dibujar(PGraphics pg) {
    //Collections.shuffle(data);
    if (data.size() > 0) {
      float[] parametros = data.remove(int(random(0, data.size())));
      pg.strokeWeight(parametros[0]);
      pg.stroke(parametros[1], parametros[2]);
      pg.line(parametros[3], parametros[4], parametros[5], parametros[6]);
      counter += 1;
    } else {
      dibujado = true;
    }
  }
}


class Elemento6 extends Fondo {
  boolean calculado = false;
  boolean dibujado = false;
  float x1;
  float x2;
  PGraphics elemento6;
  float alpha;


  Elemento6(int of, int iW, int iH, int hW, int hH, int aW, int rW, int aH, int rH) {
    super(of, iW, iH, hW, hH, aW, rW, aH, rH);
  }


  float[] calcular(float alphaMin, float alphaMax) {
    //translate(aurWidth, (imageHeight * .25)+ 10);
    //rotate(radians(22.5));
    x1 = 0;
    x2 = 0;
    float yExtra = 0;
    alpha = alphaMin;
    float alphaStep = (alphaMax - alphaMin) /170;
    float strokeAlpha;
    
    elemento6 = createGraphics(1024, 600);
    elemento6.beginDraw();
    elemento6.clear();
    elemento6.endDraw();
    elemento6.beginDraw();
    
    elemento6.translate(aurWidth, (imageHeight * .25)+ 10);
    elemento6.rotate(radians(22.5));

    for (int y = 0; y< 170; y++) {
      if (y % 23 == 0 || y % 29 == 0 || y % 37 == 0) {
        strokeAlpha = alpha;
      } else {
        strokeAlpha = alphaMin;
        //stroke(0, alphaMin);
      }
      //line(x1, y + yExtra, x2, y);
      float[] datos = {strokeAlpha, x1, y+yExtra, x2, y};
      data.add(datos);
      elemento6.strokeWeight(.25);
      elemento6.stroke(0, datos[0]);
      elemento6.line(datos[1], datos[2], datos[3], datos[4]);
      x1 -= 2.1;
      x2 += 1.3;
      alpha += alphaStep;
      yExtra -= .2;
    }
    
    elemento6.endDraw();
    elemento6.save("elemento6.png");
    calculado = true;
    float[] e7EndAlphaMinMax = {alphaMin, alphaMax};
    return e7EndAlphaMinMax;
  }


  void dibujar(PGraphics pg) {
    //Collections.shuffle(data);
    if (data.size() > 0) {
      float[] parametros = data.remove(int(random(0, data.size())));
      pg.strokeWeight(.25);
      pg.stroke(0, parametros[0]);
      pg.line(parametros[1], parametros[2], parametros[3], parametros[4]);
      counter += 1;
    } else {
      dibujado = true;
    }
  }
}


class Elemento7 extends Fondo {
  boolean calculado = false;
  boolean dibujado = false;
  float x1;
  float x2;
  float alpha;
  PGraphics elemento7;
  
  
  Elemento7(int of, int iW, int iH, int hW, int hH, int aW, int rW, int aH, int rH) {
    super(of, iW, iH, hW, hH, aW, rW, aH, rH);
  }


  void calcular(float alphaMin, float alphaMax) {
    x1 = 0;
    x2 = 0;
    alpha = 27.5;
    float strokeAlpha;
    float alphaStep = (alphaMax - alphaMin)/95;
    
    elemento7 = createGraphics(1024, 600);
    elemento7.beginDraw();
    elemento7.clear();
    elemento7.endDraw();
    elemento7.beginDraw();
    
    elemento7.translate(aurWidth, (imageHeight * .25)+ 10);
    elemento7.rotate(radians(191.25));

    for (int y = 0; y< 110; y++) {
      if (y % 13 ==0 || y % 19 ==0) {
        //stroke(255, alpha);
        strokeAlpha = alpha;
      } else {
        strokeAlpha = alphaMin;
      }
      //line(x1, y, x2, y);
      float[] datos = {strokeAlpha, x1, y, x2, y};
      data.add(datos);
      elemento7.strokeWeight(.25);
      elemento7.stroke(255, datos[0]);
      elemento7.line(datos[1], datos[2], datos[3], datos[4]);
      x1 -= 2.1;
      x2 += .5;
      alpha += alphaStep;
    }
    
    elemento7.endDraw();
    elemento7.save("elemento5.png");
    calculado = true;
  }


  void dibujar(PGraphics pg) {
    //Collections.shuffle(data);
    if (data.size() > 0) {
      float[] parametros = data.remove(int(random(0, data.size())));
      pg.strokeWeight(.25);
      pg.stroke(255, parametros[0]);
      pg.line(parametros[1], parametros[2], parametros[3], parametros[4]);
      counter += 1;
    } else {
      dibujado = true;
    }
  }
}
