class Tanque extends Transform {
  PImage imagen;
  float velocidad = 200; 
  
  Tanque(float x, float y, PImage imagen) {
    super(x, y);
    this.imagen = imagen;
  }

  void mostrar() {
    image(imagen, x, y);
  }

  void mover(float dx, float deltaTime) {
    x += dx * velocidad * deltaTime;
    x = constrain(x, 0, width - imagen.width); 
  }
}
