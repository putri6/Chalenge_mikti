import 'dart:io';

void main() {
  List<List<int>> scores = [];

  // Meminta input dari pengguna untuk skor setiap tim dan setiap putaran
  for (int i = 0; i < 2; i++) {
    List<int> teamScores = [];
    for (int j = 0; j < 3; j++) {
      stdout.write('Masukkan skor untuk tim ');
      switch (i) {
        case 0:
          stdout.write('Lumba-lumba');
          break;
        case 1:
          stdout.write('Koala');
          break;
      }
      stdout.write(' untuk putaran ${j + 1}: ');
      int score = int.parse(stdin.readLineSync()!);
      teamScores.add(score);
    }
    scores.add(teamScores);
  }

  print("======== Score Count =========");

  // Menampilkan skor dan rata-rata setiap tim
  for (int i = 0; i < scores.length; i++) {
    int totalScore = 0;
    for (int j = 0; j < scores[i].length; j++) {
      totalScore += scores[i][j];
    }
    double averageScore = totalScore / scores[i].length;
    print("\nTeam ${getTeamName(i)}");
    for (int j = 0; j < scores[i].length; j++) {
      print("Score for round ${j + 1}: ${scores[i][j]}");
    }
    print("Total Score: $totalScore");
    print("Average Score: ${averageScore.toStringAsFixed(2)}");
  }

  // Menentukan pemenang berdasarkan persyaratan skor minimum 100
  print("\n======== Result =========");

  int lumbaTotal = scores[0].fold(0, (prev, element) => prev + element);
  int koalaTotal = scores[1].fold(0, (prev, element) => prev + element);

  bool lumbaWin = lumbaTotal >= 100 && scores[0].every((score) => score >= 100) && lumbaTotal > koalaTotal;
  bool koalaWin = koalaTotal >= 100 && scores[1].every((score) => score >= 100) && koalaTotal > lumbaTotal;

  if (lumbaWin) {
    print("Team Lumba-lumba wins with a total score of $lumbaTotal");
  } else if (koalaWin) {
    print("Team Koala wins with a total score of $koalaTotal");
  } else {
    print("No team wins the trophy.");
  }
}

// Fungsi untuk mendapatkan nama tim berdasarkan indeks
String getTeamName(int index) {
  switch (index) {
    case 0:
      return 'Lumba-lumba';
    case 1:
      return 'Koala';
    default:
      return '';
  }
}
