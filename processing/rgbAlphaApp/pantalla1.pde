class Pantalla1 {


  void inicio() {
    strokeWeight(2);
    stroke(136, 74, 160);
    fill(255, 255, 102);
    rect(200, 100, 1024, 600);
    
    font = loadFont("SourceCodePro-Regular-48.vlw");
    textoIntro = cp5.addTextarea("txt1")
      .setPosition(250, 150)
      .setSize(924, 500)
      .setFont(createFont("font", 48))
      .setLineHeight(56)
      .setColor(color(50))
      .setColorBackground(color(255, 0))
      .setColorForeground(color(255, 0))
      .hideScrollbar()
      ;
    textoIntro.setText(T.introduccion);

    cp5.addButton("comenzar")
      //.setValue(0)
      .setPosition(662, 625)
      .setSize(100, 30)
      ;
  }
  
  
  void fin() {
    strokeWeight(2);
    stroke(136, 74, 160);
    fill(255, 255, 102);
    rect(200, 100, 1024, 600);
    
    font = loadFont("SourceCodePro-Regular-48.vlw");
    textoIntro = cp5.addTextarea("txt3")
      .setPosition(250, 150)
      .setSize(924, 500)
      .setFont(createFont("font", 48))
      .setLineHeight(56)
      .setColor(color(50))
      .setColorBackground(color(255, 0))
      .setColorForeground(color(255, 0))
      .hideScrollbar()
      ;
    textoIntro.setText(T.aceptar);

    cp5.addButton("aceptar")
      //.setValue(0)
      .setPosition(662, 625)
      .setSize(100, 30)
      ;
  }
}
