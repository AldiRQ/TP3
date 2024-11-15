Snake snake;
ArrayList<Animal> animales;
PImage imgRaton, imgPajarito, imgInsecto, fondo;
int puntaje = 0;
float tiempoInicial;
boolean juegoIniciado = false;
DeltaTime deltaTime;
ArrayList<String> historialComidas;
float tiempoHistorial = 0;

void setup() {
  size(600, 600);
  imgRaton = loadImage("ratonOfficial.png");
  imgPajarito = loadImage("pajaroOfficial.png");
  imgInsecto = loadImage("InsectoOfficial.png");
  fondo = loadImage("PastoOff.png");

  snake = new Snake();
  deltaTime = new DeltaTime();
  animales = new ArrayList<Animal>();
  historialComidas = new ArrayList<String>();
  spawnAnimal();
}

void draw() {
  if (juegoIniciado) {
    float dt = deltaTime.actualizar();
    image(fondo, 0, 0);

    
    float tiempoRestante = 60 - (millis() / 1000.0 - tiempoInicial);
    fill(255);
    textSize(20);
    textAlign(LEFT, TOP);
    text("Tiempo: " + int(tiempoRestante), 10, 10);
    textAlign(RIGHT, TOP);
    text("Puntaje: " + puntaje, width - 10, 10);

    
    if (tiempoRestante <= 0 || snake.colisionaConBordes()) {
      textAlign(CENTER, CENTER);
      text("Juego terminado", width / 2, height / 2);
      noLoop();
      return;
    }

    snake.mover(dt);
    snake.dibujar();

    for (Animal animal : animales) {
      animal.dibujar();
      if (snake.comeAnimal(animal)) {
        puntaje += animal.puntos;
        snake.crecer();
        historialComidas.add("Comió un " + animal.getClass().getSimpleName() + " en " + int(millis() / 1000.0) + " s");
        tiempoHistorial = millis();
        spawnAnimal();
        break;
      }
    }

    if (millis() - tiempoHistorial < 3000 && historialComidas.size() > 0) {
      fill(255);
      textAlign(CENTER, BOTTOM);
      text(historialComidas.get(historialComidas.size() - 1), width / 2, height - 20);
    }
  } else {
    textAlign(CENTER, CENTER);
    textSize(30);
    text("Presiona 'Enter' para iniciar", width / 2, height / 2);
  }
}

void keyPressed() {
  if (keyCode == ENTER) {
    juegoIniciado = true;
    tiempoInicial = millis() / 1000.0;
    loop();
  } else if (key == 'w' && snake.direccion.y == 0) {
    snake.direccion.set(0, -1);
  } else if (key == 's' && snake.direccion.y == 0) {
    snake.direccion.set(0, 1);
  } else if (key == 'a' && snake.direccion.x == 0) {
    snake.direccion.set(-1, 0);
  } else if (key == 'd' && snake.direccion.x == 0) {
    snake.direccion.set(1, 0);
  }
}

void spawnAnimal() {
  PVector pos = new PVector(int(random(0, width / 20)) * 20, int(random(0, height / 20)) * 20);
  int tipoAnimal = int(random(3));
  switch (tipoAnimal) {
    case 0:
      animales.clear();
      animales.add(new Raton(imgRaton, pos));
      break;
    case 1:
      animales.clear();
      animales.add(new Pajaro(imgPajarito, pos));
      break;
    case 2:
      animales.clear();
      animales.add(new Insecto(imgInsecto, pos));
      break;
  }
}
