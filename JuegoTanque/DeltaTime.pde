class DeltaTime {
  float lastTime;

  DeltaTime() {
    lastTime = millis() / 1000.0;
  }

  float getDeltaTime() {
    float currentTime = millis() / 1000.0;
    float deltaTime = currentTime - lastTime;
    lastTime = currentTime;
    return deltaTime;
  }
}
