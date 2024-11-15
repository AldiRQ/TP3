Tanque tanque;
GestorMurallas gestor;
ArrayList<Bala> balas;
PImage imagenBloque, imagenTanque;
DeltaTime deltaTimeController;

void setup() {
  size(700, 600); 
  imagenBloque = loadImage("bloqueOff.png"); 
  imagenTanque = loadImage("tanqueOfficial.png");

  tanque = new Tanque(width / 2, height - 50, imagenTanque);
  gestor = new GestorMurallas();
  balas = new ArrayList<Bala>();
  deltaTimeController = new DeltaTime();

 
  int filas = (height - 100) / (imagenBloque.height + 10); 
  for (int i = 0; i < filas; i++) {
    for (int j = 0; j < width / (imagenBloque.width + 10); j++) {
      float x = j * (imagenBloque.width + 10);
      float y = i * (imagenBloque.height + 10);
      gestor.agregarBloque(new Bloque(x, y, imagenBloque, int(random(10, 30))));
    }
  }
}

void draw() {
  float deltaTime = deltaTimeController.getDeltaTime();
  background(#0A0A0A);


  tanque.mostrar();
  if (keyPressed) {
    if (key == 'a' || key == 'A') {
      tanque.mover(-1, deltaTime);
    } else if (key == 'd' || key == 'D') {
      tanque.mover(1, deltaTime);
    }
  }

  
  for (int i = balas.size() - 1; i >= 0; i--) {
    Bala bala = balas.get(i);
    bala.mover(deltaTime);
    bala.mostrar();

    
    if (bala.y < 0) {
      balas.remove(i);
    }
  }

  
  gestor.verificarColision(balas);
  gestor.mostrar();
}

void keyPressed() {
  if (key == ' ') {
    balas.add(new Bala(tanque.x + tanque.imagen.width / 2, tanque.y));
  }
}
