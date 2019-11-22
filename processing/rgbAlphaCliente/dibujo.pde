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
  ArrayList<float[]> data;
  boolean calculado = false;
  boolean dibujado = false;

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
    this. data = new ArrayList<float[]>();
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
        float[] datos = { 
          x + offset, y + offset, peso, redLevel, greenLevel, blueLevel, alpha2
        };
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
      }
      if (x < aurWidth) {
        colourLevel -= colourStep1;
      } else if (x == aurWidth) {
        colourLevel = 0;
      } else if (x > aurWidth) {
        colourLevel += colourStep2;
      }
    }
    calculado = true;
    float[] carryValues = {
      backgroundRed, backgroundGreen, backgroundBlue
    };
    return carryValues;
  }


  void dibujar(int pixelsPerCycle) {

    for (int i=0; i < pixelsPerCycle; i++) {
      if (data.size() > 0) {

        float[] parametros = data.remove(data.size()-1);
        strokeWeight(parametros[2]);

        stroke(int(parametros[3]), int(parametros[4]), int(parametros[5]), parametros[6]);
        fill(int(parametros[3]), int(parametros[4]), int(parametros[5]), parametros[6]);
        line(parametros[0], parametros[1], parametros[0], parametros[1]);
        counter += 1;
      } else {
        println("Done drawing background!");
        dibujado = true;
      }
    }
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
  
  ArrayList<float[]> data2;



  Elementos1y2(int of, int iW, int iH, int hW, int hH, int aW, int rW, int aH, int rH) {
    super(of, iW, iH, hW, hH, aW, rW, aH, rH);
    this. data2 = new ArrayList<float[]>();
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
    for (int y=offset; y<=aurHeight; y++) {
      rand = random(1);
      if (rand < 1 - (gapPercentage / 100)) {
        redLevel = map(colourLevel, 0, 255, 0, element1n2Red);
        greenLevel = map(colourLevel, 0, 255, 0, element1n2Green);
        blueLevel = map(colourLevel, 0, 255, 0, element1n2Blue);
        float[] datos = { 
          x1, x2, y, redLevel, greenLevel, blueLevel, alpha
        };
        data.add(datos);
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
    for (int y = int (halfHeight); y <= imageHeight; y++) {
      rand = random(1);
      if (rand < 1 - (gapPercentage / 100)) {
        redLevel = map(colourLevel, 0, 255, 0, element1n2Red);
        greenLevel = map(colourLevel, 0, 255, 0, element1n2Green);
        blueLevel = map(colourLevel, 0, 255, 0, element1n2Blue);
        float[] datos = { 
          x1, x2, y, redLevel, greenLevel, blueLevel, alpha
        };
        data2.add(datos);
      }
      x1 -= 1.3;
      x2 += 2.1;
      colourLevel += colourStep;
      alpha += alphaStep;
    }
    calculado2 = true;
    float[] carryValues = {
      x1, x2
    };
    return carryValues;
  }


  void dibujar1() {
    if (data.size() > 0) {
      float[] parametros = data.remove(data.size()-1);
      strokeWeight(1);
      stroke(int(parametros[3]), int(parametros[4]), int(parametros[5]), parametros[6]);
      line(parametros[0], parametros[2], parametros[1], parametros[2]);
      counter += 1;
    } else {
      println("Done drawing element 1!");
      dibujado1 = true;
    }
  }


  void dibujar2() {
    if (data2.size() > 0) {
      float[] parametros = data2.remove(data2.size()-1);
      strokeWeight(1);
      stroke(int(parametros[3]), int(parametros[4]), int(parametros[5]), parametros[6]);
      line(parametros[0], parametros[2], parametros[1], parametros[2]);
      counter += 1;
    } else {
      println("Done drawing element 2!");
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
  //float redLevel;
  //float greenLevel;
  //float blueLevel;
  //float colourLevel = 0;
  //float colourStep = 255 / (float(aurHeight + halfHeight - offset));
  ////Variables for transparency
  //float alphaStep = 127.5 / (aurHeight);
  float alpha;
  float red;
  float green;
  float blue;
  //float gapPercentage;



  Elemento3(int of, int iW, int iH, int hW, int hH, int aW, int rW, int aH, int rH) {
    super(of, iW, iH, hW, hH, aW, rW, aH, rH);
  }


  void resetDefaults() {
    x1 = e2endX1X2[0];
    x2 = e2endX1X2[1];
  }


  void calcular(float startAlpha, float endAlpha) {
    x1 += 1.3;
    x2 -= 2.1;
    int a = 1;
    int b = 2;
    int counter = 1;
    for (int y = int (imageHeight); y >= 0; y--) {
      alpha = map(counter, 1, 1024, startAlpha, endAlpha);
      stroke(red, green, blue, alpha);
      if (counter == b) {
        if (x2 <= offset) {
          x2 = offset + 3;
        }
        float[] datos = { 
          x1, x2, y, red, green, blue, alpha
        };
        data.add(datos);
        //line(x1, y, x2, y);
        a = b;
        b +=a;
      }
      x1 += 1.3;
      x2 -= 2.1;
      //alpha += alphaStep;
      counter += 1;
    }
    calculado = true;
  }


  void dibujar() {
    //Collections.shuffle(data);
    if (data.size() > 0) {
      float[] parametros = data.remove(data.size()-1);
      strokeWeight(5);
      stroke(int(parametros[3]), int(parametros[4]), int(parametros[5]), parametros[6]);
      line(parametros[0], parametros[2], parametros[1], parametros[2]);
      counter += 1;
    } else {
      println("Done drawing element 3!");
      dibujado = true;
    }
  }
}


class Elemento4 extends Fondo {
  boolean calculado = false;
  boolean dibujado = false;
  float x1;
  float x2;
  //float redLevel;
  //float greenLevel;
  //float blueLevel;
  //float colourLevel = 0;
  //float colourStep = 255 / (float(aurHeight + halfHeight - offset));
  ////Variables for transparency
  //float alphaStep = 127.5 / (aurHeight);
  //float alpha;
  float red;
  float green;
  float blue;
  //float gapPercentage;



  Elemento4(int of, int iW, int iH, int hW, int hH, int aW, int rW, int aH, int rH) {
    super(of, iW, iH, hW, hH, aW, rW, aH, rH);
    this.red = 255;
    this.green = 255;
    this.blue = 255;
  }


  void resetDefaults() {
    red = element1n2Red;
    green = element1n2Green;
    blue = element1n2Blue;
  }


  void calcular(float maxAlpha) {
    float yIterations = (imageHeight * .618) + offset;
    float alpha = maxAlpha;
    float alphaStep = maxAlpha / yIterations;
    x1 = aurWidth + (remWidth * .5) + 70;
    x2 = x1;
    for (int y = offset; y <= yIterations; y++) {
      float[] datos = { 
        x1, x2, y, red, green, blue, alpha
      };
      data.add(datos);
      //stroke(red, green, blue, alpha);
      //line(x1, y, x2, y);
      x1 -= .55;
      x2 += .34;
      maxAlpha -= alphaStep;
      alpha = random(maxAlpha);
    }
    calculado = true;
  }


  void dibujar() {
    //Collections.shuffle(data);
    if (data.size() > 0) {
      float[] parametros = data.remove(data.size()-1);
      strokeWeight(1);
      fill(int(parametros[3]), int(parametros[4]), int(parametros[5]), parametros[6]);
      stroke(int(parametros[3]), int(parametros[4]), int(parametros[5]), parametros[6]);
      line(parametros[0], parametros[2], parametros[1], parametros[2]);
      counter += 1;
    } else {
      println("Done drawing element 4!");
      dibujado = true;
    }
  }
}


class Elemento5 extends Fondo {
  boolean calculado = false;
  boolean dibujado = false;
  //float x1;
  //float x2;
  //float redLevel;
  //float greenLevel;
  //float blueLevel;
  //float colourLevel = 0;
  //float colourStep = 255 / (float(aurHeight + halfHeight - offset));
  ////Variables for transparency
  //float alphaStep = 127.5 / (aurHeight);
  float alpha;
  //float red;
  //float green;
  //float blue;
  //float gapPercentage;



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
    for (int x = xStart; x > xEnd; x--) {
      rand = random(1);
      if (rand < lineChance) {
        alpha = (rand * alphaMax);
        weight = map(rand, 0, 1, 1, 5);
        float[] datos = { 
          weight, grayLevel, alpha, x, y1, x+xExtra, y2
        };
        data.add(datos);
      }
      xExtra += .34;
      y2 -= .55;
      grayLevel += colourStep1;
    }
    calculado = true;
  }


  void dibujar() {
    //Collections.shuffle(data);
    if (data.size() > 0) {
      float[] parametros = data.remove(data.size()-1);
      strokeWeight(parametros[0]);
      stroke(parametros[1], parametros[2]);
      line(parametros[3], parametros[4], parametros[5], parametros[6]);
      counter += 1;
    } else {
      println("Done drawing element 5!");
      dibujado = true;
    }
  }
}


class Elemento6 extends Fondo {
  boolean calculado = false;
  boolean dibujado = false;
  float x1;
  float x2;
  //float redLevel;
  //float greenLevel;
  //float blueLevel;
  //float colourLevel = 0;
  //float colourStep = 255 / (float(aurHeight + halfHeight - offset));
  ////Variables for transparency
  //float alphaStep = 127.5 / (aurHeight);
  float alpha;
  //float red;
  //float green;
  //float blue;
  //float gapPercentage;



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

    for (int y = 0; y< 170; y++) {
      if (y % 23 == 0 || y % 29 == 0 || y % 37 == 0) {
        strokeAlpha = alpha;
      } else {
        strokeAlpha = alphaMin;
        //stroke(0, alphaMin);
      }
      //line(x1, y + yExtra, x2, y);
      float[] datos = {
        strokeAlpha, x1, y+yExtra, x2, y
      };
      data.add(datos);
      x1 -= 2.1;
      x2 += 1.3;
      alpha += alphaStep;
      yExtra -= .2;
    }
    calculado = true;
    float[] e7EndAlphaMinMax = {
      alphaMin, alphaMax
    };
    return e7EndAlphaMinMax;
  }


  void dibujar() {
    //Collections.shuffle(data);
    if (data.size() > 0) {
      float[] parametros = data.remove(data.size()-1);
      strokeWeight(.25);
      stroke(0, parametros[0]);
      line(parametros[1], parametros[2], parametros[3], parametros[4]);
      counter += 1;
    } else {
      println("Done drawing element 6!");
      dibujado = true;
    }
  }
}


class Elemento7 extends Fondo {
  boolean calculado = false;
  boolean dibujado = false;
  float x1;
  float x2;
  //float redLevel;
  //float greenLevel;
  //float blueLevel;
  //float colourLevel = 0;
  //float colourStep = 255 / (float(aurHeight + halfHeight - offset));
  ////Variables for transparency
  //float alphaStep = 127.5 / (aurHeight);
  float alpha;
  //float red;
  //float green;
  //float blue;
  //float gapPercentage;



  Elemento7(int of, int iW, int iH, int hW, int hH, int aW, int rW, int aH, int rH) {
    super(of, iW, iH, hW, hH, aW, rW, aH, rH);
  }


  void calcular(float alphaMin, float alphaMax) {
    x1 = 0;
    x2 = 0;
    alpha = 27.5;
    float strokeAlpha;
    float alphaStep = (alphaMax - alphaMin)/95;

    for (int y = 0; y< 110; y++) {
      if (y % 13 ==0 || y % 19 ==0) {
        //stroke(255, alpha);
        strokeAlpha = alpha;
      } else {
        strokeAlpha = alphaMin;
      }
      //line(x1, y, x2, y);
      float[] datos = {
        strokeAlpha, x1, y, x2, y
      };
      data.add(datos);
      x1 -= 2.1;
      x2 += .5;
      alpha += alphaStep;
    }
    calculado = true;
  }


  void dibujar() {
    //Collections.shuffle(data);
    if (data.size() > 0) {
      float[] parametros = data.remove(data.size()-1);
      strokeWeight(.25);
      stroke(255, parametros[0]);
      line(parametros[1], parametros[2], parametros[3], parametros[4]);
      counter += 1;
    } else {
      println("Done drawing element 7!");
      dibujado = true;
    }
  }
}

