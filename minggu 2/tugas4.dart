import 'dart:io';

void main() {
  print("=== Aplikasi Konversi Unit ===");

  // Map faktor konversi terhadap satuan dasar
  Map<String, double> length = {
    'm': 1.0,
    'cm': 0.01,
    'km': 1000.0,
    'inch': 0.0254,
    'ft': 0.3048,
  };

  Map<String, double> mass = {
    'kg': 1.0,
    'g': 0.001,
    'lb': 0.453592,
    'oz': 0.0283495,
  };

  Map<String, double> volume = {
    'l': 1.0,
    'ml': 0.001,
    'cup': 0.24,
    'gal': 3.78541,
  };

  while (true) {
    print("\nPilih kategori konversi:");
    print("1. Panjang");
    print("2. Massa");
    print("3. Volume");
    print("4. Suhu");
    print("5. Keluar");

    stdout.write("Masukkan pilihan (1-5): ");
    String choice = stdin.readLineSync()!;

    if (choice == '5') {
      print("Terima kasih telah menggunakan aplikasi konversi unit!");
      break;
    }

    Map<String, double>? unitMap;
    bool isTemperature = false;

    switch (choice) {
      case '1':
        unitMap = length;
        break;
      case '2':
        unitMap = mass;
        break;
      case '3':
        unitMap = volume;
        break;
      case '4':
        isTemperature = true;
        break;
      default:
        print("Pilihan tidak valid!");
        continue;
    }

    stdout.write("Masukkan satuan asal: ");
    String fromUnit = stdin.readLineSync()!.toLowerCase();

    stdout.write("Masukkan satuan tujuan: ");
    String toUnit = stdin.readLineSync()!.toLowerCase();

    double value;
    while (true) {
      stdout.write("Masukkan nilai yang ingin dikonversi: ");
      value = double.parse(stdin.readLineSync()!);

      if (!isTemperature && value < 0) {
        print("Nilai tidak boleh negatif!");
      } else {
        break;
      }
    }

    double result;

    if (isTemperature) {
      result = convertTemperature(value, fromUnit, toUnit);
    } else {
      if (!unitMap!.containsKey(fromUnit) || !unitMap.containsKey(toUnit)) {
        print("Satuan tidak tersedia!");
        continue;
      }
      // Konversi melalui satuan dasar
      result = value * unitMap[fromUnit]! / unitMap[toUnit]!;
    }

    print(
        "\n$value $fromUnit = ${result.toStringAsFixed(4)} $toUnit");
  }
}

double convertTemperature(double value, String from, String to) {
  double celsius;

  // Konversi ke Celsius
  switch (from) {
    case 'c':
      celsius = value;
      break;
    case 'f':
      celsius = (value - 32) * 5 / 9;
      break;
    case 'k':
      celsius = value - 273.15;
      break;
    default:
      print("Satuan suhu tidak valid! Gunakan C, F, atau K.");
      return value;
  }

  // Konversi dari Celsius ke tujuan
  switch (to) {
    case 'c':
      return celsius;
    case 'f':
      return celsius * 9 / 5 + 32;
    case 'k':
      return celsius + 273.15;
    default:
      print("Satuan suhu tidak valid! Gunakan C, F, atau K.");
      return value;
  }
}
