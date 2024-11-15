abstract class Animal {
  PImage img;
  int puntos;
  PVector posicion;

  Animal(PImage img, int puntos, PVector posicion) {
    this.img = img;
    this.puntos = puntos;
    this.posicion = posicion;
  }

  abstract void dibujar();
}
