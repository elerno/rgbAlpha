class Texto {
  String introduccion;
  String fondo;
  String imperfeccion;
  String e1y2;
  String e1y2Huecos;
  String e3;
  String e4;
  String e5;
  String e5_2;
  String e6;
  String correo;
  String aceptar;

  Texto() {
    this.introduccion = "Crea tu propia versión de rgbAlpha aquí. La imagen resultante se convertirá en parte de la pieza y, si así lo deseas, "
      + "te será enviada por correo una vez concluida la exposición."
      + "";
    this.fondo = "Mezcla grados de rojo, verde y azul para obtener el color de fondo máximo de tu imagen.\n"
      + "El color máximo se encontrará a las orillas. Éste perderá intensidad en dirección horizontal hacia el centro,"
      + " y ganará transparencia en dirección vertical.";
    this.imperfeccion = "Genera textura en tu fondo seleccionando el tamaño máximo de los pixeles \'imperfectos', y el porcentaje de estos.\n"
      + "Los pixeles imperfectos se encimarán modificando transparencia e intensidad de color a su alrededor."
      ;
    this.e1y2 = "Elije el color de los triángulos."
      + "Estos se dibujan con transparencia máxima en la parte superior de la imagen, y pierden transparencia hacia la parte inferior.\n"
      + "Los triángulos pueden ser sólidos, o tener líneas sin dibujar. Después de fijar el color, elige la probabilidad de que una línea no se dibuje.\n"
      + "Los huecos aparecen en distintos lugares porque se calculan en base a probabilidad. Puedes pedir que se vuelvan a calcular."
      ;
    this.e1y2Huecos = ""
      ;
    this.e3 = "Elige la transparencia (alfa) inicial y final de las líneas horizontales."
      ;
    this.e4 = "Elige la transparencia mínima del nuevo triángulo.\n"
      + "El triángulo irá ganando transparencia hasta desaparecer."
      ;
    this.e5 = "El siguiente elemento va de un grado de gris a otro, con un grado de transparencia fijo. Escoge los parámetros de tu agrado.\n"
      + "Después escoge la probabilidad de que se dibujen líneas del triángulo. Estas líneas tienen grosor variable, y pueden traslaparse."
      ;
    this.e5_2 = ""
      ;
    this.e6 = "Los siguientes dos triángulos están hechos a partir de líneas con distinta transparencia. Elige la transparencia máxima y mínima."
      ;
    this.correo = "Ingresa tu correo (opcional), selecciona si quieres recibir tu imagen o no, y pulsa terminar para agregar tu imagen a la exposición."
      ;
    this.aceptar = "¡Gracias por participar! Pulsa comenzar para hacer una nueva versión."
      ;
  }
}
