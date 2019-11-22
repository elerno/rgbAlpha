class Pantalla2 {


  void fondo() {
    // Draw a balck frame.
    //strokeWeight(50);
    //stroke(0);
    //fill(255, 255, 255);
    //rect(width - 1024, 0, 1024, 600);
    //strokeWeight(1); // reset stroke weight.
    //fondoColor = true;

    strokeWeight(2);
    stroke(136, 74, 160);
    fill(255, 255, 102);
    int frameWidth = width - 1024 - 50;
    int frameHeight = 600;
    rect(5, 5, frameWidth, frameHeight);

    font = loadFont("SourceCodePro-Regular-48.vlw");

    textoFondo = cp5.addTextarea("txt2")
      .setPosition(15, 15)
        .setSize(frameWidth - 30, frameHeight - 15)
          .setFont(createFont("font", 20))
            .setLineHeight(24)
              .setColor(color(50))
                .setColorBackground(color(255, 0))
                  .setColorForeground(color(255, 0))
                    .hideScrollbar()
                      ;
    textoFondo.setText(T.fondo);

    Group g1 = cp5.addGroup("Mezcla de Colores")
      .setPosition(width - 1024 - 10, 630)
        .setSize(550, 150)
          .setBackgroundColor(color(50))
            .setBarHeight(0)
              .disableCollapse()
                ;
    cp5.addSlider("rojo")
      .setRange(0, 255)
        .setValue(0)
          .setPosition(5, 20)
            .setSize(510, 20)
              .setGroup(g1)
                .setColorActive(color(255, 0, 0))
                  .setColorForeground(color(255, 0, 0))
                    .setColorBackground(color(0))
                      ;
    cp5.addSlider("verde")
      .setRange(0, 255)
        .setValue(0)
          .setPosition(5, 50)
            .setSize(510, 20)
              .setGroup(g1)
                .setColorActive(color(0, 255, 0))
                  .setColorForeground(color(0, 255, 0))
                    .setColorBackground(color(0))
                      ;
    cp5.addSlider("azul")
      .setRange(0, 255)
        .setValue(0)
          .setPosition(5, 80)
            .setSize(510, 20)
              .setGroup(g1)
                .setColorActive(color(0, 0, 255))
                  .setColorForeground(color(0, 0, 255))
                    .setColorBackground(color(0))
                      ;
    cp5.addButton("fijar")
      .setPosition(5, 110)
        .setSize(100, 30)
          .setGroup(g1)
            ;
  }


  void imperfeccion() {
    strokeWeight(2);
    stroke(136, 74, 160);
    fill(255, 255, 102);
    int frameWidth = width - 1024 - 50;
    int frameHeight = 600;
    rect(5, 5, frameWidth, frameHeight);

    font = loadFont("SourceCodePro-Regular-48.vlw");
    textoFondo.setText(T.imperfeccion);

    Group g2 = cp5.addGroup("Definición de imperfecciones")
      .setPosition(width - 1024 - 10, 630)
        .setSize(550, 150)
          .setBackgroundColor(color(50))
            .setBarHeight(0)
              .disableCollapse()
                ;
    cp5.addSlider("pesoImperfeccion")
      .setCaptionLabel("Tamaño maximo de imperfeccion")
        .setRange(0.0, 25.00)
          .setDecimalPrecision(2)
            .setValue(2.00)
              .setPosition(5, 20)
                .setSize(410, 20)
                  .setGroup(g2)
                    ;
    cp5.addSlider("porcentajeImperfeccion")
      .setCaptionLabel("Porcentaje de imperfecciones")
        .setRange(0, 50)
          .setValue(1)
            .setPosition(5, 50)
              .setSize(410, 20)
                .setGroup(g2)
                  ;
    cp5.addButton("probar")
      //.setValue(0)
      .setPosition(5, 110)
        .setSize(100, 20)
          .setGroup(g2)
            ;
    cp5.addButton("fijar2")
      .setCaptionLabel("Fijar")
        .hide()
          .setLock(true)
            .setPosition(110, 110)
              .setSize(100, 20)
                .setGroup(g2)
                  ;
  }

  void e1y2() {
    strokeWeight(2);
    stroke(136, 74, 160);
    fill(255, 255, 102);
    int frameWidth = width - 1024 - 50;
    int frameHeight = 600;
    rect(5, 5, frameWidth, frameHeight);

    font = loadFont("SourceCodePro-Regular-48.vlw");
    textoFondo.setText(T.e1y2);

    Group g3 = cp5.addGroup("Elementos 1 y 2")
      .setPosition(width - 1024 - 10, 630)
        .setSize(550, 150)
          .setBackgroundColor(color(50))
            .setBarHeight(0)
              .disableCollapse()
                ;
    cp5.addSlider("rojo3")
      .setCaptionLabel("rojo")
        .setRange(0, 255)
          .setValue(255)
            .setPosition(5, 20)
              .setSize(510, 20)
                .setGroup(g3)
                  .setColorActive(color(255, 0, 0))
                    .setColorForeground(color(255, 0, 0))
                      .setColorBackground(color(0))
                        ;
    cp5.addSlider("verde3")
      .setCaptionLabel("verde")
        .setRange(0, 255)
          .setValue(255)
            .setPosition(5, 50)
              .setSize(510, 20)
                .setGroup(g3)
                  .setColorActive(color(0, 255, 0))
                    .setColorForeground(color(0, 255, 0))
                      .setColorBackground(color(0))
                        ;
    cp5.addSlider("azul3")
      .setCaptionLabel("azul")
        .setRange(0, 255)
          .setValue(255)
            .setPosition(5, 80)
              .setSize(510, 20)
                .setGroup(g3)
                  .setColorActive(color(0, 0, 255))
                    .setColorForeground(color(0, 0, 255))
                      .setColorBackground(color(0))
                        ;
    cp5.addButton("fijar3")
      .setCaptionLabel("Fijar")
        .setPosition(5, 110)
          .setSize(100, 20)
            .setGroup(g3)
              ;
  }


  void e1y2Huecos() {
    font = loadFont("SourceCodePro-Regular-48.vlw");
    textoFondo.setText(T.e1y2Huecos);

    Group g4 = cp5.addGroup("Huecos elementos 1 y 2")
      .setPosition(width - 1024 - 10, 630)
        .setSize(550, 150)
          .setBackgroundColor(color(50))
            .setBarHeight(0)
              .disableCollapse()
                ;
    cp5.addSlider("porcentajeHuecos")
      .setCaptionLabel("Probabilidad de huecos")
        .setRange(0, 100)
          .setValue(1)
            .setPosition(5, 20)
              .setSize(440, 20)
                .setGroup(g4)
                  ;
    cp5.addButton("recalcular4")
      .setCaptionLabel("Redistribuir Huecos")
        .setPosition(5, 110)
          .setSize(100, 20)
            .setGroup(g4)
              ;
    cp5.addButton("fijar4")
      .setCaptionLabel("Fijar")
        .setPosition(110, 110)
          .setSize(100, 20)
            .setGroup(g4)
              ;
  }


  void e3() {
    strokeWeight(2);
    stroke(136, 74, 160);
    fill(255, 255, 102);
    int frameWidth = width - 1024 - 50;
    int frameHeight = 600;
    rect(5, 5, frameWidth, frameHeight);

    font = loadFont("SourceCodePro-Regular-48.vlw");
    textoFondo.setText(T.e3);

    Group g5 = cp5.addGroup("Elemento 3")
      .setPosition(width - 1024 - 10, 630)
        .setSize(550, 150)
          .setBackgroundColor(color(50))
            .setBarHeight(0)
              .disableCollapse()
                ;
    cp5.addSlider("alfaInicial")
      .setCaptionLabel("Alfa inicial")
        .setRange(0, 255)
          .setDecimalPrecision(2)
            .setValue(20.00)
              .setPosition(5, 20)
                .setSize(410, 20)
                  .setGroup(g5)
                    ;
    cp5.addSlider("alfaFinal")
      .setCaptionLabel("Alfa Final")
        .setRange(0, 255)
          .setDecimalPrecision(2)
            .setValue(80.00)
              .setPosition(5, 50)
                .setSize(410, 20)
                  .setGroup(g5)
                    ;
    cp5.addButton("fijar5")
      .setCaptionLabel("Fijar")
        .setPosition(5, 110)
          .setSize(100, 20)
            .setGroup(g5)
              ;
  }


  void e4() {
    strokeWeight(2);
    stroke(136, 74, 160);
    fill(255, 255, 102);
    int frameWidth = width - 1024 - 50;
    int frameHeight = 600;
    rect(5, 5, frameWidth, frameHeight);

    font = loadFont("SourceCodePro-Regular-48.vlw");
    textoFondo.setText(T.e4);

    Group g6 = cp5.addGroup("Elemento 4")
      .setPosition(width - 1024 - 10, 630)
        .setSize(550, 150)
          .setBackgroundColor(color(50))
            .setBarHeight(0)
              .disableCollapse()
                ;
    cp5.addSlider("maxAlpha")
      .setCaptionLabel("Alfa maximo")
        .setRange(0, 255)
          .setDecimalPrecision(2)
            .setValue(150.00)
              .setPosition(5, 20)
                .setSize(485, 20)
                  .setGroup(g6)
                    ;
    cp5.addButton("fijar6")
      .setCaptionLabel("Fijar")
        .setPosition(5, 110)
          .setSize(100, 20)
            .setGroup(g6)
              ;
  }


  void e5() {
    strokeWeight(2);
    stroke(136, 74, 160);
    fill(255, 255, 102);
    int frameWidth = width - 1024 - 50;
    int frameHeight = 600;
    rect(5, 5, frameWidth, frameHeight);

    font = loadFont("SourceCodePro-Regular-48.vlw");
    textoFondo.setText(T.e5);

    Group g7 = cp5.addGroup("Elemento 5")
      .setPosition(width - 1024 - 10, 630)
        .setSize(550, 150)
          .setBackgroundColor(color(50))
            .setBarHeight(0)
              .disableCollapse()
                ;
    cp5.addSlider("gris1")
      .setCaptionLabel("Gris 1")
        .setRange(0, 255)
          .setValue(0)
            .setPosition(5, 20)
              .setSize(485, 20)
                .setGroup(g7)
                  .setColorActive(color(105))
                    .setColorForeground(color(155))
                      .setColorBackground(color(55))
                        ;
    cp5.addSlider("gris2")
      .setCaptionLabel("Gris 2")
        .setRange(0, 255)
          .setValue(200)
            .setPosition(5, 50)
              .setSize(485, 20)
                .setGroup(g7)
                  .setColorActive(color(105))
                    .setColorForeground(color(155))
                      .setColorBackground(color(55))
                        ;
    cp5.addSlider("maxAlpha7")
      .setCaptionLabel("Alfa maximo")
        .setRange(0, 255)
          .setDecimalPrecision(2)
            .setValue(255.00)
              .setPosition(5, 80)
                .setSize(485, 20)
                  .setGroup(g7)
                    ;
    cp5.addButton("fijar7")
      .setCaptionLabel("Fijar")
        .setPosition(5, 110)
          .setSize(100, 20)
            .setGroup(g7)
              ;

    cp5.addSlider("porcentajeLineas8")
      .setCaptionLabel("Probabilidad de lineas")
        .setRange(0.00, 1.00)
          .setValue(0.5)
            .setPosition(5, 20)
              .setSize(450, 20)
                .setGroup(g7)
                  .hide()
                    ;
    cp5.addButton("fijar7a")
      .setCaptionLabel("Fijar")
        .setPosition(5, 110)
          .setSize(100, 20)
            .setGroup(g7)
              .hide()
                ;
  }


  void e6() {
    strokeWeight(2);
    stroke(136, 74, 160);
    fill(255, 255, 102);
    int frameWidth = width - 1024 - 50;
    int frameHeight = 600;
    rect(5, 5, frameWidth, frameHeight);

    font = loadFont("SourceCodePro-Regular-48.vlw");
    textoFondo.setText(T.e6);

    Group g8 = cp5.addGroup("Elemento 6")
      .setPosition(width - 1024 - 10, 630)
        .setSize(550, 150)
          .setBackgroundColor(color(50))
            .setBarHeight(0)
              .disableCollapse()
                ;
    cp5.addSlider("minAlpha8")
      .setCaptionLabel("Alfa minimo")
        .setRange(0, 254)
          .setDecimalPrecision(2)
            .setValue(35.00)
              .setPosition(5, 20)
                .setSize(485, 20)
                  .setGroup(g8)
                    ;
    cp5.addSlider("maxAlpha8")
      .setCaptionLabel("Alfa maximo")
        .setRange(1, 255)
          .setDecimalPrecision(2)
            .setValue(150.00)
              .setPosition(5, 50)
                .setSize(485, 20)
                  .setGroup(g8)
                    ;
    cp5.addButton("fijar8")
      .setCaptionLabel("Fijar")
        .setPosition(5, 110)
          .setSize(100, 20)
            .setGroup(g8)
              ;
  }


  void e7() {
    strokeWeight(2);
    stroke(136, 74, 160);
    fill(255, 255, 102);
    int frameWidth = width - 1024 - 50;
    int frameHeight = 600;
    rect(5, 5, frameWidth, frameHeight);

    font = loadFont("SourceCodePro-Regular-48.vlw");
    textoFondo.setText(T.correo);

    PFont inputFont = createFont("SourceCodePro-Regular", 16);

    Group g9 = cp5.addGroup("Terminar")
      .setPosition(width - 1024 - 10, 630)
        .setSize(550, 150)
          .setBackgroundColor(color(50))
            .setBarHeight(0)
              .disableCollapse()
                ;
    cp5.addTextfield("email9")
      .setPosition(5, 20)
        .setSize(300, 20)
          .setGroup(g9)
            .setFont(inputFont)
              .setFocus(true)
                .setCaptionLabel("correo electronico")
                  .setColorActive(color(255, 0, 0))
                    .setColor(color(255, 255, 102))
                      ;
    cp5.addRadioButton("enviarCorreo")
      .setPosition(5, 70)
        .setSize(30, 20)
          .setGroup(g9)
            .setColorForeground(color(120))
              .setColorActive(color(255))
                .setColorLabel(color(255))
                  .setItemsPerRow(2)
                    .setSpacingColumn(90)
                      .setNoneSelectedAllowed(false)
                        .addItem("Enviar por correo", 1)
                          .addItem("No enviar por correo", 2)
                            .setArrayValue(1, 1)
                              .setArrayValue(2, 0)
                                .activate(0)
                                  ;

    cp5.addButton("Terminar9")
      .setCaptionLabel("Terminar")
        .setPosition(5, 120)
          .setSize(100, 20)
            .setGroup(g9)
              ;
  }
  
  void cancelar() {
    if (cp5.getController("cancel")!=null) {
      cp5.getController("cancel").show();
    } else {
    cp5.addButton("cancel")
      .setCaptionLabel("Cancelar y volver al inicio")
      .setPosition(width - 150, height - 70)
      .setSize(120, 40)
      ;
    }
  }
}

