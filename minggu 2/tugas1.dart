import 'dart:io';

void main() {
  // Input berat
  stdout.write("Masukkan berat badan (kg): ");
  double berat = double.parse(stdin.readLineSync()!);

  // Input tinggi
  stdout.write("Masukkan tinggi badan (cm): ");
  double tinggiCm = double.parse(stdin.readLineSync()!);

  // Konversi tinggi ke meter
  double tinggiM = tinggiCm / 100;

  // Hitung BMI
  double bmi = berat / (tinggiM * tinggiM);

  // Tampilkan hasil
  print("\nBMI Anda adalah: ${bmi.toStringAsFixed(2)}");

  // Kategori BMI
  if (bmi < 18.5) {
    print("Kategori: Kekurangan berat badan");
  } else if (bmi >= 18.5 && bmi < 24.9) {
    print("Kategori: Normal");
  } else if (bmi >= 25 && bmi < 29.9) {
    print("Kategori: Kelebihan berat badan");
  } else {
    print("Kategori: Obesitas");
  }
}
