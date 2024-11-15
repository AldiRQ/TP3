class DeltaTime {
  float tiempoAnterior;

  DeltaTime() {
    tiempoAnterior = millis() / 1000.0;
  }

  float actualizar() {
    float tiempoActual = millis() / 1000.0;
    float delta = tiempoActual - tiempoAnterior;
    tiempoAnterior = tiempoActual;
    return delta;
  }
}
