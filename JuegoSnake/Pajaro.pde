class Pajaro extends Animal {
  Pajaro(PImage img, PVector posicion) {
    super(img, 5, posicion);
  }

  void dibujar() {
    image(img, posicion.x, posicion.y);
  }
}
