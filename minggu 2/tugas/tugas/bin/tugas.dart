import 'dart:io';
import 'package:tugas/tugas.dart' as tugas;

void main(List<String> arguments) {
  print("silahkan pilih tugas yang ingin dijalankan:");
  print("1. Tugas 1 (BMI Calculator)");
  print("2. Tugas 3 (Calculator )");
  print("3. Tugas 4 (Unit Converter)");
  stdout.write("Masukkan pilihan (1-3): ");
  String choice = stdin.readLineSync()!;
  switch (choice) {
    case '1':
      tugas.bmi();
      break;
    case '2':
      tugas.calculator();
      break;
    case '3':
      tugas.konversiUnit();
      break;
    default:
      print("Pilihan tidak valid!");
      break;
  }
}
