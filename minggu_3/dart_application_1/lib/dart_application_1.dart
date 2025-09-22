int faktorial(int n) {
  if (n < 0) {
    throw ArgumentError("Faktorial tidak didefinisikan untuk bilangan negatif");
  }

  int hasil = 1;
  for (int i = 1; i <= n; i++) {
    hasil *= i;
  }

  return hasil;
}
