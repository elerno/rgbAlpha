class DataBD {
  String idUsuarioBD;
  String correoEBD;
  String enviarBD;

  float backgroundRedBD;
  float backgroundGreenBD;
  float backgroundBlueBD;
  float imperfectionWeightBD;
  float imperfectionPercentageBD;

  float element1n2RedBD;
  float element1n2GreenBD;
  float element1n2BlueBD;
  float gapPercentageBD;

  float startAlphaBD;
  float endAlphaBD;

  float maxAlphaBD;

  float gray1BD;
  float gray2BD;
  float maxAlpha2BD;
  float lineChanceBD;

  float startAlpha1BD;
  float endAlpha1BD;


  DataBD() {
//    this.idUsuarioBD = "";
//    this.correoEBD = "";
//    this.enviarBD = "";

    this.backgroundRedBD = 0;
    this.backgroundGreenBD = 0;
    this.backgroundBlueBD = 0;
    this.imperfectionWeightBD = 0;
    this.imperfectionPercentageBD = 0;

    this.element1n2RedBD = 0;
    this.element1n2GreenBD = 0;
    this.element1n2BlueBD = 0;
    this.gapPercentageBD = 0;

    this.startAlphaBD = 0;
    this.endAlphaBD = 0;

    this.maxAlphaBD = 0;

    this.gray1BD = 0;
    this.gray2BD = 0;
    this.maxAlpha2BD = 0;
    this.lineChanceBD = 0;

    this.startAlpha1BD = 0;
    this.endAlpha1BD = 0;
  }


  void obtenerDataUsuarioAleatorio() {
    int idUsuario = 0;
    IntList usuariosId = new IntList();
    
    if (RgbAlphaXt.connect()) {
      String select = "SELECT idUsuario FROM tUsuarios;"
          ;
      RgbAlphaXt.query(select);
      while (RgbAlphaXt.next()) {
        usuariosId.append(RgbAlphaXt.getInt(1));
      }
      idUsuario = usuariosId.remove(int(random(0, usuariosId.size())));
    } else {
      println("mamó Seleccionar Id usuario");
    }
    
    if (RgbAlphaXt.connect()) {
      String selFondo = "SELECT * FROM tFondos WHERE idUsuario='" + idUsuario + "'";
        RgbAlphaXt.query(selFondo);
        RgbAlphaXt.next();
        backgroundRedBD = RgbAlphaXt.getFloat("backgroundRed");
        backgroundGreenBD = RgbAlphaXt.getFloat("backgroundGreen");
        backgroundBlueBD = RgbAlphaXt.getFloat("backgroundBlue");
        imperfectionWeightBD = RgbAlphaXt.getFloat("imperfectionWeight");
        imperfectionPercentageBD = RgbAlphaXt.getFloat("imperfectionPercentage");
    } else {
      // connection failed !
      println("mamó Fondo");
    }
    
    if (RgbAlphaXt.connect()) {
      String selE1y2 = "SELECT * FROM tE1y2 WHERE idUsuario='" + idUsuario + "'";
        RgbAlphaXt.query(selE1y2);
        RgbAlphaXt.next();
        element1n2RedBD = RgbAlphaXt.getFloat("rojo");
        element1n2GreenBD = RgbAlphaXt.getFloat("verde");
        element1n2BlueBD = RgbAlphaXt.getFloat("azul");
        gapPercentageBD = RgbAlphaXt.getFloat("probabilidadHueco");
    } else {
      // connection failed !
      println("mamó E1y2");
    }
    if (RgbAlphaXt.connect()) {
      String selE3 = "SELECT * FROM tE3 WHERE idUsuario='" + idUsuario + "'";
        RgbAlphaXt.query(selE3);
        RgbAlphaXt.next();
        startAlphaBD = RgbAlphaXt.getFloat("startAlpha");
        endAlphaBD = RgbAlphaXt.getFloat("endAlpha");
    } else {
      // connection failed !
      println("mamó E3");
    }
    if (RgbAlphaXt.connect()) {
      String selE4 = "SELECT * FROM tE4 WHERE idUsuario='" + idUsuario + "'";
        RgbAlphaXt.query(selE4);
        RgbAlphaXt.next();
        maxAlphaBD = RgbAlphaXt.getFloat("maxAlpha");
    } else {
      // connection failed !
      println("mamó E4");
    }
    if (RgbAlphaXt.connect()) {
      String selE5 = "SELECT * FROM tE5 WHERE idUsuario='" + idUsuario + "'";
        RgbAlphaXt.query(selE5);
        RgbAlphaXt.next();
        gray1BD = RgbAlphaXt.getFloat("gray1");
        gray2BD = RgbAlphaXt.getFloat("gray2");
        maxAlpha2BD = RgbAlphaXt.getFloat("maxAlpha");
        lineChanceBD = RgbAlphaXt.getFloat("lineChance");
    } else {
      // connection failed !
      println("mamó E5");
    }
    if (RgbAlphaXt.connect()) {
      String selE6 = "SELECT * FROM tE6 WHERE idUsuario='" + idUsuario + "'";
        RgbAlphaXt.query(selE6);
        RgbAlphaXt.next();
        startAlpha1BD = RgbAlphaXt.getFloat("startAlpha");
        endAlpha1BD = RgbAlphaXt.getFloat("endAlpha");
    } else {
      // connection failed !
      println("mamó E6");
    }
  }
  
  
  void obtenerDataPromedio() {
    backgroundRedBD = 0;
    backgroundGreenBD = 0;
    backgroundBlueBD = 0;
    imperfectionWeightBD = 0;
    imperfectionPercentageBD = 0;

    element1n2RedBD = 0;
    element1n2GreenBD = 0;
    element1n2BlueBD = 0;
    gapPercentageBD = 0;

    startAlphaBD = 0;
    endAlphaBD = 0;

    maxAlphaBD = 0;

    gray1BD = 0;
    gray2BD = 0;
    maxAlpha2BD = 0;
    lineChanceBD = 0;

    startAlpha1BD = 0;
    endAlpha1BD = 0;
    
    
      RgbAlphaXt.query( "SELECT COUNT(*) FROM tUsuarios" );
      RgbAlphaXt.next();
      int numRows = RgbAlphaXt.getInt(1);
    
    if (RgbAlphaXt.connect()) {
      String selFondo = "SELECT * FROM tFondos";
        RgbAlphaXt.query(selFondo);
        while(RgbAlphaXt.next()) {
          backgroundRedBD += RgbAlphaXt.getFloat("backgroundRed");
          backgroundGreenBD += RgbAlphaXt.getFloat("backgroundGreen");
          backgroundBlueBD += RgbAlphaXt.getFloat("backgroundBlue");
          imperfectionWeightBD += RgbAlphaXt.getFloat("imperfectionWeight");
          imperfectionPercentageBD += RgbAlphaXt.getFloat("imperfectionPercentage");
        }
        backgroundRedBD /= float(numRows);
        backgroundGreenBD /= float(numRows);
        backgroundBlueBD /= float(numRows);
        imperfectionWeightBD /= float(numRows);
        imperfectionPercentageBD /= float(numRows);
    } else {
      // connection failed !
      println("mamó Fondo");
    }
    
    if (RgbAlphaXt.connect()) {
      String selE1y2 = "SELECT * FROM tE1y2";
        RgbAlphaXt.query(selE1y2);
        while(RgbAlphaXt.next()) {
          element1n2RedBD += RgbAlphaXt.getFloat("rojo");
          element1n2GreenBD += RgbAlphaXt.getFloat("verde");
          element1n2BlueBD += RgbAlphaXt.getFloat("azul");
          gapPercentageBD += RgbAlphaXt.getFloat("probabilidadHueco");
        }
        element1n2RedBD /= float(numRows);
        element1n2GreenBD /= float(numRows);
        element1n2BlueBD /= float(numRows);
        gapPercentageBD /= float(numRows);
    } else {
      // connection failed !
      println("mamó E1y2");
    }
    if (RgbAlphaXt.connect()) {
      String selE3 = "SELECT * FROM tE3";
        RgbAlphaXt.query(selE3);
        while(RgbAlphaXt.next()) {
          startAlphaBD += RgbAlphaXt.getFloat("startAlpha");
          endAlphaBD += RgbAlphaXt.getFloat("endAlpha");
        }
        startAlphaBD /= float(numRows);
        endAlphaBD /= float(numRows);
    } else {
      // connection failed !
      println("mamó E3");
    }
    if (RgbAlphaXt.connect()) {
      String selE4 = "SELECT * FROM tE4";
        RgbAlphaXt.query(selE4);
        while(RgbAlphaXt.next()) {
          maxAlphaBD += RgbAlphaXt.getFloat("maxAlpha");
        }
        maxAlphaBD /= float(numRows);
    } else {
      // connection failed !
      println("mamó E4");
    }
    if (RgbAlphaXt.connect()) {
      String selE5 = "SELECT * FROM tE5";
        RgbAlphaXt.query(selE5);
        while(RgbAlphaXt.next()) {
          gray1BD += RgbAlphaXt.getFloat("gray1");
          gray2BD += RgbAlphaXt.getFloat("gray2");
          maxAlpha2BD += RgbAlphaXt.getFloat("maxAlpha");
          lineChanceBD += RgbAlphaXt.getFloat("lineChance");
        }
        gray1BD /= float(numRows);
        gray2BD /= float(numRows);
        maxAlpha2BD /= float(numRows);
        lineChanceBD /= float(numRows);
    } else {
      // connection failed !
      println("mamó E5");
    }
    if (RgbAlphaXt.connect()) {
      String selE6 = "SELECT * FROM tE6";
        RgbAlphaXt.query(selE6);
        while(RgbAlphaXt.next()) {
          startAlpha1BD += RgbAlphaXt.getFloat("startAlpha");
          endAlpha1BD += RgbAlphaXt.getFloat("endAlpha");
        }
        startAlpha1BD /= float(numRows);
        endAlpha1BD /= float(numRows);
    } else {
      // connection failed !
      println("mamó E6");
    }
  }
  
  
  void obtenerDataMixta() {
    int idUsuario = 0;
    IntList usuariosId = new IntList();
    if (RgbAlphaXt.connect()) {
      String select = "SELECT idUsuario FROM tUsuarios;"
          ;
      RgbAlphaXt.query(select);
      while (RgbAlphaXt.next()) {
        usuariosId.append(RgbAlphaXt.getInt(1));
      }
      idUsuario = usuariosId.remove(int(random(0, usuariosId.size())));
    } else {
      println("mamó Seleccionar Id usuario");
    }
    
    if (RgbAlphaXt.connect()) {
      idUsuario = usuariosId.get(int(random(0, usuariosId.size())));
      String selFondo = "SELECT * FROM tFondos WHERE idUsuario='" + idUsuario + "'";
        RgbAlphaXt.query(selFondo);
        RgbAlphaXt.next();
        backgroundRedBD = RgbAlphaXt.getFloat("backgroundRed");
        backgroundGreenBD = RgbAlphaXt.getFloat("backgroundGreen");
        backgroundBlueBD = RgbAlphaXt.getFloat("backgroundBlue");
        imperfectionWeightBD = RgbAlphaXt.getFloat("imperfectionWeight");
        imperfectionPercentageBD = RgbAlphaXt.getFloat("imperfectionPercentage");
    } else {
      // connection failed !
      println("mamó Fondo");
    }
    
    if (RgbAlphaXt.connect()) {
      idUsuario = usuariosId.get(int(random(0, usuariosId.size())));
      String selE1y2 = "SELECT * FROM tE1y2 WHERE idUsuario='" + idUsuario + "'";
        RgbAlphaXt.query(selE1y2);
        RgbAlphaXt.next();
        element1n2RedBD = RgbAlphaXt.getFloat("rojo");
        element1n2GreenBD = RgbAlphaXt.getFloat("verde");
        element1n2BlueBD = RgbAlphaXt.getFloat("azul");
        gapPercentageBD = RgbAlphaXt.getFloat("probabilidadHueco");
    } else {
      // connection failed !
      println("mamó E1y2");
    }
    if (RgbAlphaXt.connect()) {
      idUsuario = usuariosId.get(int(random(0, usuariosId.size())));
      String selE3 = "SELECT * FROM tE3 WHERE idUsuario='" + idUsuario + "'";
        RgbAlphaXt.query(selE3);
        RgbAlphaXt.next();
        startAlphaBD = RgbAlphaXt.getFloat("startAlpha");
        endAlphaBD = RgbAlphaXt.getFloat("endAlpha");
    } else {
      // connection failed !
      println("mamó E3");
    }
    if (RgbAlphaXt.connect()) {
      idUsuario = usuariosId.get(int(random(0, usuariosId.size())));
      String selE4 = "SELECT * FROM tE4 WHERE idUsuario='" + idUsuario + "'";
        RgbAlphaXt.query(selE4);
        RgbAlphaXt.next();
        maxAlphaBD = RgbAlphaXt.getFloat("maxAlpha");
    } else {
      // connection failed !
      println("mamó E4");
    }
    if (RgbAlphaXt.connect()) {
      idUsuario = usuariosId.get(int(random(0, usuariosId.size())));
      String selE5 = "SELECT * FROM tE5 WHERE idUsuario='" + idUsuario + "'";
        RgbAlphaXt.query(selE5);
        RgbAlphaXt.next();
        gray1BD = RgbAlphaXt.getFloat("gray1");
        gray2BD = RgbAlphaXt.getFloat("gray2");
        maxAlpha2BD = RgbAlphaXt.getFloat("maxAlpha");
        lineChanceBD = RgbAlphaXt.getFloat("lineChance");
    } else {
      // connection failed !
      println("mamó E5");
    }
    if (RgbAlphaXt.connect()) {
      idUsuario = usuariosId.get(int(random(0, usuariosId.size())));
      String selE6 = "SELECT * FROM tE6 WHERE idUsuario='" + idUsuario + "'";
        RgbAlphaXt.query(selE6);
        RgbAlphaXt.next();
        startAlpha1BD = RgbAlphaXt.getFloat("startAlpha");
        endAlpha1BD = RgbAlphaXt.getFloat("endAlpha");
    } else {
      // connection failed !
      println("mamó E6");
    }  
  }
}

