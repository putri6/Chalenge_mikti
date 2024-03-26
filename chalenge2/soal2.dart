import 'dart:io';

void main() {
  // Meminta dan mengambil input massa dan tinggi Mark
  double massaMark = getInput('Masukkan massa Mark (kg): ');
  double tinggiMark = getInput('Masukkan tinggi Mark (m): ');

  // Meminta dan mengambil input massa dan tinggi John
  double massaJohn = getInput('Masukkan massa John (kg): ');
  double tinggiJohn = getInput('Masukkan tinggi John (m): ');

  // Menghitung BMI Mark
  double bmiMark = hitungBMI(massaMark, tinggiMark);

  // Menghitung BMI John
  double bmiJohn = hitungBMI(massaJohn, tinggiJohn);

  // Membuat variabel Boolean untuk menentukan apakah Mark memiliki BMI yang lebih tinggi dari John
  bool markHigherBMI = bmiMark > bmiJohn;

  // Menampilkan hasil
  print('BMI Mark: $bmiMark');
  print('BMI John: $bmiJohn');
  print('Mark memiliki BMI lebih tinggi dari John: $markHigherBMI');
}

// Fungsi untuk mengambil input dari pengguna dan menampilkan prompt di samping
double getInput(String prompt) {
  stdout.write(prompt);
  return double.parse(stdin.readLineSync()!);
}

// Fungsi untuk menghitung BMI
double hitungBMI(double massa, double tinggi) {
  return massa / (tinggi * tinggi);
}
