class Raton extends Animal {
  Raton(PImage img, PVector posicion) {
    super(img, 3, posicion);
  }

  void dibujar() {
    image(img, posicion.x, posicion.y);
  }
}
