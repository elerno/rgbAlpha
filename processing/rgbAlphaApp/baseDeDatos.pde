class DataBD {
  String idUsuarioBD;
  String correoEBD;
  String enviarBD;

  String backgroundRedBD;
  String backgroundGreenBD;
  String backgroundBlueBD;
  String imperfectionWeightBD;
  String imperfectionPercentageBD;

  String element1n2RedBD;
  String element1n2GreenBD;
  String element1n2BlueBD;
  String gapPercentageBD;

  String startAlphaBD;
  String endAlphaBD;

  String maxAlphaBD;

  String gray1BD;
  String gray2BD;
  String maxAlpha2BD;
  String lineChanceBD;

  String startAlpha1BD;
  String endAlpha1BD;


  DataBD() {
    this.idUsuarioBD = "";
    this.correoEBD = "";
    this.enviarBD = "";

    this.backgroundRedBD = "";
    this.backgroundGreenBD = "";
    this.backgroundBlueBD = "";
    this.imperfectionWeightBD = "";
    this.imperfectionPercentageBD = "";

    this.element1n2RedBD = "";
    this.element1n2GreenBD = "";
    this.element1n2BlueBD = "";
    this.gapPercentageBD = "";

    this.startAlphaBD = "";
    this.endAlphaBD = "";

    this.maxAlphaBD = "";

    this.gray1BD = "";
    this.gray2BD = "";
    this.maxAlpha2BD = "";
    this.lineChanceBD = "";

    this.startAlpha1BD = "";
    this.endAlpha1BD = "";
  }


  void mandarDatos() {
    int idUsuario = 0;
    
    if (RgbAlphaXt.connect()) {
      String insert = "INSERT INTO tUsuarios(correoE, enviar)" +
        "VALUES ('" + 
          correoEBD + "', " +
          enviarBD + ")"
          ;
      RgbAlphaXt.query(insert);
      //RgbAlphaXt.next();
      println( "Parámetros de usuario insertados!");
    } else {
      // connection failed !
      println("mamó Fondo");
    }
    
    if (RgbAlphaXt.connect()) {
      String select = "SELECT idUsuario FROM tUsuarios ORDER BY idUsuario DESC LIMIT 1"
          ;
      RgbAlphaXt.query(select);
      RgbAlphaXt.next();
      idUsuario = RgbAlphaXt.getInt("idUsuario");
      
      println( "Id Usuario = " + idUsuario);
    } else {
      // connection failed !
      println("mamó Fondo");
    }
    
    
    if (RgbAlphaXt.connect()) {
      String insert = "INSERT INTO tFondos(idUsuario, backgroundRed, backgroundGreen, backgroundBlue, imperfectionWeight, imperfectionPercentage)" +
        "VALUES (" +
        idUsuario + ", " +
        backgroundRedBD + ", " +
        backgroundGreenBD + ", " +
        backgroundBlueBD + ", " +
        imperfectionWeightBD + ", " +
        imperfectionPercentageBD + ")"
        ;
      RgbAlphaXt.query(insert);
      //RgbAlphaXt.next();
      println( "Parámetros de fondo insertados!");
    } else {
      // connection failed !
      println("mamó Fondo");
    }

    if (RgbAlphaXt.connect()) {
      String insert = "INSERT INTO tE1y2(idUsuario, rojo, verde, azul, probabilidadHueco)" +
        "VALUES (" +
        idUsuario + ", " +
        element1n2RedBD + ", " +
        element1n2GreenBD + ", " +
        element1n2BlueBD + ", " +
        gapPercentageBD + ")"
        ;
      RgbAlphaXt.query(insert);
      //RgbAlphaXt.next();
      println( "Parámetros de E1y2 insertados!");
    } else {
      // connection failed !
      println("mamó E1y2");
    }

    if (RgbAlphaXt.connect()) {
      String insert = "INSERT INTO tE3(idUsuario, startAlpha, endAlpha)" +
        "VALUES (" +
        idUsuario + ", " +
        startAlphaBD + ", " +
        endAlphaBD + ")"
        ;
      RgbAlphaXt.query(insert);
      //RgbAlphaXt.next();
      println( "Parámetros de E3 insertados!");
    } else {
      // connection failed !
      println("mamó E3");
    }

    if (RgbAlphaXt.connect()) {
      String insert = "INSERT INTO tE4(idUsuario, maxAlpha)" +
        "VALUES (" +
        idUsuario + ", " +
        maxAlphaBD + ")"
        ;
      RgbAlphaXt.query(insert);
      //RgbAlphaXt.next();
      println( "Parámetros de E4 insertados!");
    } else {
      // connection failed !
      println("mamó E4");
    }

    if (RgbAlphaXt.connect()) {
      String insert = "INSERT INTO tE5(idUsuario, gray1, gray2, maxAlpha, lineChance)" +
       "VALUES (" +
        idUsuario + ", " +
        gray1BD + ", " +
        gray2BD + ", " +
        maxAlpha2BD + ", " +
        lineChanceBD + ")"
        ;
      RgbAlphaXt.query(insert);
      //RgbAlphaXt.next();
      println( "Parámetros de E5 insertados!");
    } else {
      // connection failed !
      println("mamó E5");
    }
    
    if (RgbAlphaXt.connect()) {
      String insert = "INSERT INTO tE6(idUsuario, startAlpha, endAlpha)" +
        "VALUES (" +
        idUsuario + ", " +
        startAlpha1BD + ", " +
        endAlpha1BD + ")"
        ;
      RgbAlphaXt.query(insert);
      //RgbAlphaXt.next();
      println( "Parámetros de E6 insertados!");
    } else {
      // connection failed !
      println("mamó E6");
    }
  }
}

