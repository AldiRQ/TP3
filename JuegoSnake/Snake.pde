class Snake {
  ArrayList<PVector> cuerpo;
  PVector direccion;
  float velocidad = 200; 
  float tiempoAcumulado = 0;
  int tamañoCuadro = 40;

  Snake() {
    cuerpo = new ArrayList<PVector>();
    cuerpo.add(new PVector(width / 2, height / 2)); // Cabeza inicial
    direccion = new PVector(1, 0);
  }

  void mover(float deltaTime) {
    tiempoAcumulado += deltaTime * velocidad;
    if (tiempoAcumulado >= tamañoCuadro) { 
      PVector nuevaPos = cuerpo.get(0).copy().add(direccion.copy().mult(tamañoCuadro));
      cuerpo.add(0, nuevaPos);
      cuerpo.remove(cuerpo.size() - 1);
      tiempoAcumulado = 0;
    }
  }

  void crecer() {
    cuerpo.add(cuerpo.get(cuerpo.size() - 1).copy());
  }

  void dibujar() {
    fill(#EA2F2F); 
    rect(cuerpo.get(0).x, cuerpo.get(0).y, tamañoCuadro, tamañoCuadro);
    fill(#CB7B7B); 
    for (int i = 1; i < cuerpo.size(); i++) {
      rect(cuerpo.get(i).x, cuerpo.get(i).y, tamañoCuadro, tamañoCuadro);
    }
  }

  boolean colisionaConBordes() {
    PVector cabeza = cuerpo.get(0);
    return (cabeza.x < 0 || cabeza.x >= width || cabeza.y < 0 || cabeza.y >= height);
  }

  boolean comeAnimal(Animal animal) {
    PVector cabeza = cuerpo.get(0);
    return cabeza.dist(animal.posicion) < tamañoCuadro;
  }
}
