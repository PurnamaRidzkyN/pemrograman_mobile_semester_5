import 'dart:io';

// bmi
void bmi() {
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

// calculator 
double power(double base, int exp) {
  double result = 1;
  for (int i = 0; i < exp; i++) {
    result *= base;
  }
  return result;
}

double evaluate(String expr) {
  // Hapus spasi
  expr = expr.replaceAll(' ', '');

  // Tokenize dengan dukung angka negatif
  List<String> tokens = [];
  String numBuffer = '';
  for (int i = 0; i < expr.length; i++) {
    String c = expr[i];
    if ('+-*/%^'.contains(c)) {
      if (c == '-' && (i == 0 || '+-*/%^('.contains(expr[i - 1]))) {
        // Minus sebagai tanda negatif
        numBuffer += c;
      } else {
        if (numBuffer != '') tokens.add(numBuffer);
        tokens.add(c);
        numBuffer = '';
      }
    } else {
      numBuffer += c;
    }
  }
  if (numBuffer != '') tokens.add(numBuffer);

  // Proses ^ (pangkat)
  for (int i = 0; i < tokens.length; i++) {
    if (tokens[i] == '^') {
      double left = double.parse(tokens[i - 1]);
      int right = int.parse(tokens[i + 1]);
      double res = power(left, right);

      tokens[i - 1] = res.toString();
      tokens.removeAt(i);
      tokens.removeAt(i);
      i--;
    }
  }

  // Proses * / %
  for (int i = 0; i < tokens.length; i++) {
    if (tokens[i] == '*' || tokens[i] == '/' || tokens[i] == '%') {
      double left = double.parse(tokens[i - 1]);
      double right = double.parse(tokens[i + 1]);
      double res;

      if (tokens[i] == '*')
        res = left * right;
      else if (tokens[i] == '/') {
        if (right == 0) throw Exception("Pembagian 0!");
        res = left / right;
      } else {
        res = left % right;
      }

      tokens[i - 1] = res.toString();
      tokens.removeAt(i);
      tokens.removeAt(i);
      i--;
    }
  }

  // Proses + -
  double result = double.parse(tokens[0]);
  for (int i = 1; i < tokens.length; i += 2) {
    String op = tokens[i];
    double num = double.parse(tokens[i + 1]);
    if (op == '+') result += num;
    if (op == '-') result -= num;
  }

  return result;
}

double evaluateWithParentheses(String expr) {
  while (expr.contains('(')) {
    int closeIndex = expr.indexOf(')');
    int openIndex = expr.lastIndexOf('(', closeIndex);
    String inner = expr.substring(openIndex + 1, closeIndex);
    double innerResult = evaluateWithParentheses(inner);
    expr = expr.replaceRange(openIndex, closeIndex + 1, innerResult.toString());
  }
  return evaluate(expr);
}

void calculator() {
  print("=== Kalkulator Dart dengan Kurung, Pangkat & Negatif ===");
  print("Contoh input: (2 + 3) * (4 ^ 2 - 1)");
  print("Ketik 'exit' untuk keluar");

  while (true) {
    stdout.write("\nMasukkan ekspresi: ");
    String? input = stdin.readLineSync();

    if (input == null || input.toLowerCase() == 'exit') {
      print("Terima kasih!");
      break;
    }

    try {
      double result = evaluateWithParentheses(input);
      print("Hasil: $result");
    } catch (e) {
      print("Error: ${e.toString()}");
    }
  }
}

//koversi units 
double convertTemperature(double value, String from, String to) {
  from = from.toUpperCase();
  to = to.toUpperCase();

  double celsius;

  // Konversi ke Celsius terlebih dahulu
  if (from == 'C') {
    celsius = value;
  } else if (from == 'F') {
    celsius = (value - 32) * 5 / 9;
  } else if (from == 'K') {
    celsius = value - 273.15;
  } else {
    print("Satuan suhu asal tidak dikenali!");
    return value;
  }

  // Konversi dari Celsius ke satuan tujuan
  if (to == 'C') {
    return celsius;
  } else if (to == 'F') {
    return celsius * 9 / 5 + 32;
  } else if (to == 'K') {
    return celsius + 273.15;
  } else {
    print("Satuan suhu tujuan tidak dikenali!");
    return value;
  }
}

void konversiUnit() {
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

    print("\n$value $fromUnit = ${result.toStringAsFixed(4)} $toUnit");
  }
}
