import 'dart:io';

void tebakAngka() {
  int target = 42; // angka rahasia tetap
  bool ketemu = false;

  print("=== Game Tebak Angka ===");
  print("Saya sudah memilih angka antara 1 - 100.");

  while (!ketemu) {
    stdout.write("Masukkan tebakanmu: ");
    String? input = stdin.readLineSync();

    if (input == null || input.isEmpty) {
      print("Masukkan angka yang valid!");
      continue;
    }

    int tebakan = int.parse(input);

    if (tebakan == target) {
      print("Selamat! Tebakanmu benar: $target");
      ketemu = true;
    } else if (tebakan < target) {
      print("Terlalu kecil, coba lagi.");
    } else {
      print("Terlalu besar, coba lagi.");
    }
  }
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
