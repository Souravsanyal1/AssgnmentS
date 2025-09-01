main() {
  Map<String, dynamic> student = {
    "name": "Alice",
    "age": 20,
    "grade": "A"
  };
  print("Name: ${student['name']}");
  print("Grade: ${student['grade']}");
  student["age"] = 21;
  student["grade"] = "A+";
  student["school"] = "Greenwood High";
  print("\n--- Student Details ---");
  student.forEach((key, value) {
    print("$key : $value");
  });
}