void main() {
  List<double> studentMarks = [
    85.5,
    92.0,
    78.5,
    65.0,
    95.5,
    88.0,
    71.5,
    80.0,
    99.0,
    83.5,
  ];

  double highestMark = studentMarks.reduce((a, b) => a > b ? a : b);

  print('The student mark : $studentMarks');
  print('The highest mark : $highestMark');
}
