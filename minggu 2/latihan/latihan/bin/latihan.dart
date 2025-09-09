import 'dart:io';
import 'package:latihan/latihan.dart' as latihan;

void main() {
  bool lanjut = true;

  while (lanjut) {
    print("\nSilahkan pilih latihan yang ingin dijalankan (1-5):");
    String? choose = stdin.readLineSync();

    if (choose == '1') {
      latihan.latihan1();
    } else if (choose == '2') {
      latihan.latihan2();
    } else if (choose == '3') {
      latihan.latihan3();
    } else if (choose == '4') {
      latihan.latihan4();
    } else if (choose == '5') {
      latihan.latihan5();
    } else {
      print("Pilihan tidak valid, silahkan pilih antara 1-5");
      continue; // kembali ke awal loop
    }

    // Tanya user apakah mau lanjut
    print("\nApakah ingin memilih latihan lain? (y/n):");
    String? jawab = stdin.readLineSync();
    if (jawab == null || jawab.toLowerCase() != 'y') {
      lanjut = false;
      print("Terima kasih! Program selesai.");
    }
  }
}
