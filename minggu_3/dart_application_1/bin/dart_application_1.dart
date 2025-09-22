import 'package:dart_application_1/dart_application_1.dart';
import 'dart:io';
void main(List<String> arguments) {
  bool jalan = true;

  while (jalan) {
    print("\n=== MENU UTAMA ===");
    print("1. Hitung Faktorial");
    print("2. Cek Bilangan Prima");
    print("3. Main Tebak Angka");
    print("4. Keluar");
    stdout.write("Pilih menu: ");
    String? input = stdin.readLineSync();

    switch (input) {
      case "1":
        stdout.write("Masukkan angka: ");
        int n = int.parse(stdin.readLineSync()!);
        print("Faktorial dari $n = ${faktorial(n)}");
        break;

      case "2":
        stdout.write("Masukkan angka: ");
        int n = int.parse(stdin.readLineSync()!);
        print("$n ${cekPrima(n) ? "adalah" : "bukan"} bilangan prima");
        break;

      case "3":
        tebakAngka();
        break;

      case "4":
        jalan = false;
        print("Terima kasih!");
        break;

      default:
        print("Pilihan tidak valid.");
    }
  }
}
