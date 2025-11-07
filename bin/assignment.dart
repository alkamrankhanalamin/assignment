import 'dart:io';

void main() {
  List<Map<String, dynamic>> students = [];

  while (true) {
    print('\nEnter Student ID:');
    String id = stdin.readLineSync()!;

    // Check for unique ID
    bool idExists = students.any((student) => student['id'] == id);
    if (idExists) {
      print('This ID already exists. Please enter a different ID.');
      continue;
    }

    print('Enter Student Name:');
    String name = stdin.readLineSync()!;

    print('Enter Student Score (0–100):');
    int score = int.parse(stdin.readLineSync()!);

    // Grading system
    String grade;
    if (score >= 80) {
      grade = 'A+';
    } else if (score >= 70) {
      grade = 'A';
    } else if (score >= 60) {
      grade = 'B';
    } else if (score >= 50) {
      grade = 'C';
    } else if (score >= 40) {
      grade = 'D';
    } else {
      grade = 'F';
    }

    // Add student record
    students.add({
      'id': id,
      'name': name,
      'score': score,
      'grade': grade,
    });

    print('\nDo you want to add another student? (yes/no)');
    String choice = stdin.readLineSync()!.toLowerCase();
    if (choice != 'yes') break;
  }

  // Sort by score (descending)
  students.sort((a, b) => b['score'].compareTo(a['score']));

  // Display all records
  print('\n===== Student Records =====');
  for (var student in students) {
    print(
        'ID: ${student['id']}, Name: ${student['name']}, Score: ${student['score']}, Grade: ${student['grade']}');
  }

  // Total number of students
  print('\nTotal number of students: ${students.length}');

  // Highest and lowest scores
  if (students.isNotEmpty) {
    int highest = students.first['score'];
    int lowest = students.last['score'];
    print('Highest Score: $highest');
    print('Lowest Score: $lowest');
  }

  print('\n===== End of Program =====');
}