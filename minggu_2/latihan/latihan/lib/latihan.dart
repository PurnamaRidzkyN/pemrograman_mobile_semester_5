void latihan1() {
  double celsius = 30;
  double fahrenheit, kelvin;
  fahrenheit = (celsius * 9 / 5) + 32;
  kelvin = celsius + 273.15;
  print('$celsius°C = $fahrenheit°F');
  print('$celsius°C = $kelvin K');
}

void latihan2() {
  // Deklarasi variabel
  int angka1 = 10;
  int angka2 = 5;

  // Operasi aritmatika
  int penjumlahan = angka1 + angka2; // 10 + 5 = 15
  int pengurangan = angka1 - angka2; // 10 - 5 = 5
  int perkalian = angka1 * angka2; // 10 * 5 = 50
  double pembagian = angka1 / angka2; // 10 / 5 = 2.0
  int modulo = angka1 % angka2; // 10 % 5 = 0

  // Menampilkan hasil
  print('$angka1 + $angka2 = $penjumlahan');
  print('$angka1 - $angka2 = $pengurangan');
  print('$angka1 * $angka2 = $perkalian');
  print('$angka1 / $angka2 = $pembagian');
  print('$angka1 % $angka2 = $modulo');
}

latihan3() {
  String username = 'asep123';
  String password = 'pass123';
  int umur = 17;
  bool isUsernameValid = username.length >= 6;
  bool isPasswordValid = password.length >= 6;
  bool isAdult = umur >= 18;
  bool canRegister = isUsernameValid && isPasswordValid;
  bool canAccessAdultContent = canRegister && isAdult;
  print('Dapat mendaftar: $canRegister');
  print('Dapat mengakses konten dewasa: $canAccessAdultContent');
}

void latihan4() {
  double hargaBarang = 120000;
  int jumlahBeli = 3;
  String kodeMember = 'GOLD';
  double total = hargaBarang * jumlahBeli;
  double diskonPersen = 0;
  if (kodeMember == 'GOLD')
    diskonPersen = 0.1;
  else if (kodeMember == 'SILVER')
    diskonPersen = 0.05;
  double diskonTambahan = total > 300000 ? 0.05 : 0;
  double totalDiskon = total * (diskonPersen + diskonTambahan);
  double hargaAkhir = total - totalDiskon;
  print('Total: Rp$total');
  print('Diskon: Rp$totalDiskon');
  print('Akhir: Rp$hargaAkhir');
}

void latihan5() {
  // Data nilai mahasiswa
  Map<String, int> nilaiMahasiswa = {
    'Matematika': 99,
    'Fisika': 99,
    'Pemrograman': 99,
    'Bahasa Inggris': 99,
  };

  // Hitung total dan rata-rata
  double total = 0;
  nilaiMahasiswa.forEach((matkul, nilai) {
    total += nilai;
  });
  double rataRata = total / nilaiMahasiswa.length;

  String status = rataRata >= 60 ? 'LULUS' : 'TIDAK LULUS';

  String predikat;
  if (rataRata >= 90) {
    predikat = 'A';
  } else if (rataRata >= 80) {
    predikat = 'B';
  } else if (rataRata >= 70) {
    predikat = 'C';
  } else {
    predikat = 'D/E';
  }

  // Tampilkan hasil
  print('Nilai Mahasiswa:');
  nilaiMahasiswa.forEach((matkul, nilai) {
    print('$matkul: $nilai');
  });
  print('Rata-rata: $rataRata');
  print('Status: $status');
  print('Predikat: $predikat');
}
