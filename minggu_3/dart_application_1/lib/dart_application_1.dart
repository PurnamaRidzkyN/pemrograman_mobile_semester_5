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
bool cekPrima(int n) {
  if (n < 2) return false;

  for (int i = 2; i <= n ~/ 2; i++) {
    if (n % i == 0) {
      return false;
    }
  }

  return true;
}
