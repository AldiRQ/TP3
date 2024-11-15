class Bloque extends Transform {
  PImage imagen;
  int resistencia;

  Bloque(float x, float y, PImage imagen, int resistencia) {
    super(x, y);
    this.imagen = imagen;
    this.resistencia = resistencia;
  }

  void mostrar() {
    if (resistencia > 0) {
      image(imagen, x, y);
    }
  }

  void recibirDano(int dano) {
    resistencia -= dano;
    if (resistencia < 0) {
      resistencia = 0;
    }
  }

  boolean estaDestruido() {
    return resistencia <= 0;
  }
}
