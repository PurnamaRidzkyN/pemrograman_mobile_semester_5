import 'dart:io';

void main() {

  Map<String, double> rates = {
    'USD': 1.0,       
    'EUR': 0.92,     
    'IDR': 15500.0,   
  };

  print("=== Kalkulator Konversi Mata Uang ===");
  print("Mata uang tersedia: ${rates.keys.join(', ')}\n");

  // Input mata uang asal
  stdout.write("Masukkan mata uang asal: ");
  String fromCurrency = stdin.readLineSync()!.toUpperCase();

  if (!rates.containsKey(fromCurrency)) {
    print("Mata uang tidak tersedia!");
    return;
  }

  // Input mata uang tujuan
  stdout.write("Masukkan mata uang tujuan: ");
  String toCurrency = stdin.readLineSync()!.toUpperCase();

  if (!rates.containsKey(toCurrency)) {
    print("Mata uang tidak tersedia!");
    return;
  }

  // Input jumlah
  stdout.write("Masukkan jumlah yang ingin dikonversi: ");
  double amount = double.parse(stdin.readLineSync()!);

  // Konversi
  double amountInUSD = amount / rates[fromCurrency]!;
  double convertedAmount = amountInUSD * rates[toCurrency]!;

  print(
      "\n$amount $fromCurrency = ${convertedAmount.toStringAsFixed(2)} $toCurrency");
}
