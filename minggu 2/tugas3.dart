import 'dart:io';

void main() {
  print("=== Aplikasi Demonstrasi Operator Dart ===");

  // Input dua angka
  stdout.write("Masukkan angka pertama: ");
  int a = int.parse(stdin.readLineSync()!);

  stdout.write("Masukkan angka kedua: ");
  int b = int.parse(stdin.readLineSync()!);

  print("\n--- Operator Aritmatika ---");
  print("a + b = ${a + b}");
  print("a - b = ${a - b}");
  print("a * b = ${a * b}");
  print("a / b = ${a / b}");
  print("a ~/ b = ${a ~/ b}  (pembagian integer)");
  print("a % b = ${a % b}");
  print("Unary minus -a = ${-a}");
  print("Unary plus +b = ${+b}");

  print("\n--- Operator Penugasan ---");
  int c = a;
  print("c = $c");
  c += b;
  print("c += b => $c");
  c -= b;
  print("c -= b => $c");
  c *= b;
  print("c *= b => $c");
  c ~/= b;
  print("c ~/= b => $c");
  c %= b;
  print("c %= b => $c");

  print("\n--- Operator Perbandingan ---");
  print("a == b : ${a == b}");
  print("a != b : ${a != b}");
  print("a > b  : ${a > b}");
  print("a < b  : ${a < b}");
  print("a >= b : ${a >= b}");
  print("a <= b : ${a <= b}");

  print("\n--- Operator Logika ---");
  bool x = a > 0;
  bool y = b > 0;
  print("x && y : ${x && y}");
  print("x || y : ${x || y}");
  print("!x     : ${!x}");

  print("\n--- Operator Bitwise ---");
  print("a & b  : ${a & b}");
  print("a | b  : ${a | b}");
  print("a ^ b  : ${a ^ b}");
  print("~a     : ${~a}");
  print("a << 1 : ${a << 1}");
  print("a >> 1 : ${a >> 1}");
}
