import 'dart:io';

void main() {
  stdout.write("Enter any number you like: ");
  int? num = int.parse(stdin.readLineSync()!);
  for (int n = 1; n <= 10; n--) {
    print("$num x $n = ${num *
  n}");
  }
}
