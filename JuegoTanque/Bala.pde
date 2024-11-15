class Bala {
  float x, y;
  float velocidad = 300; 

  Bala(float x, float y) {
    this.x = x;
    this.y = y;
  }

  void mover(float deltaTime) {
    y -= velocidad * deltaTime;
  }

  void mostrar() {
    ellipse(x, y, 5, 5);
  }

  boolean colisionaCon(Bloque bloque) {
    return !bloque.estaDestruido() && x > bloque.x && x < bloque.x + bloque.imagen.width && y > bloque.y && y < bloque.y + bloque.imagen.height;
  }
}
