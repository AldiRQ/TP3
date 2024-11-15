class Insecto extends Animal {
  Insecto(PImage img, PVector posicion) {
    super(img, 1, posicion);
  }

  void dibujar() {
    image(img, posicion.x, posicion.y);
  }
}
