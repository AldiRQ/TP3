class GestorMurallas {
  ArrayList<Bloque> bloques;

  GestorMurallas() {
    bloques = new ArrayList<Bloque>();
  }

  void agregarBloque(Bloque bloque) {
    bloques.add(bloque);
  }

  void mostrar() {
    for (Bloque bloque : bloques) {
      bloque.mostrar();
    }
  }

  void verificarColision(ArrayList<Bala> balas) {
    for (int i = balas.size() - 1; i >= 0; i--) {
      Bala bala = balas.get(i);
      for (Bloque bloque : bloques) {
        if (bala.colisionaCon(bloque)) {
          bloque.recibirDaño(10);
          balas.remove(i);
          break;
        }
      }
    }
  }
}
