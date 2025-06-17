import 'dart:io';

class Person {
  String id;
  String name;
  int age;
  String gender;

  Person(this.id, this.name, this.age, this.gender);
}

class Student extends Person {
  String grade;
  Map<String, double> subjectScores = {};

  Student(String id, String name, int age, String gender, this.grade)
      : super(id, name, age, gender);

  void updateScore(String subject, double score) {
    subjectScores[subject] = score;
  }

  double get averageScore {
    if (subjectScores.isEmpty) return 0.0;
    return subjectScores.values.reduce((a, b) => a + b) / subjectScores.length;
  }

  void displayInfo() {
    print('\nStudent: $name ($id), Grade: $grade');
    if (subjectScores.isEmpty) {
      print('  No subjects.');
    } else {
      subjectScores.forEach((subject, score) {
        print('  $subject: $score');
      });
      print('  Average Score: ${averageScore.toStringAsFixed(2)}');
    }
  }
}

class Teacher extends Person {
  String subject;
  double salary;

  Teacher(String id, String name, int age, String gender, this.subject, this.salary)
      : super(id, name, age, gender);

  void displayInfo() {
    print('\nTeacher: $name ($id), Subject: $subject, Salary: $salary');
  }
}

class Classroom {
  String id;
  String name;
  Teacher? teacher;
  List<Student> students = [];

  Classroom(this.id, this.name);

  void assignTeacher(Teacher t) => teacher = t;
  void addStudent(Student s) => students.add(s);
  void removeStudentById(String id) => students.removeWhere((s) => s.id == id);

  void displayInfo() {
    print('\nClass: $name (ID: $id)');
    print('Teacher: ${teacher?.name ?? "None"}');
    if (students.isEmpty) {
      print('No students in class.');
    } else {
      for (var s in students) {
        print('- ${s.name} (${s.id}) - Avg: ${s.averageScore.toStringAsFixed(2)}');
      }
    }
  }
}

class StudentManager {
  final List<Student> students = [];

  void addStudent() {
    stdout.write('ID: ');
    String id = stdin.readLineSync()!;
    stdout.write('Name: ');
    String name = stdin.readLineSync()!;
    stdout.write('Age: ');
    int age = int.parse(stdin.readLineSync()!);
    stdout.write('Gender: ');
    String gender = stdin.readLineSync()!;
    stdout.write('Grade: ');
    String grade = stdin.readLineSync()!;
    var s = Student(id, name, age, gender, grade);
    stdout.write('How many subjects? ');
    int n = int.parse(stdin.readLineSync()!);
    for (int i = 0; i < n; i++) {
      stdout.write('Subject name: ');
      String subject = stdin.readLineSync()!;
      stdout.write('Score: ');
      double score = double.parse(stdin.readLineSync()!);
      s.updateScore(subject, score);
    }
    students.add(s);
    print('✅ Student added.');
  }

  void updateStudent() {
    stdout.write('Enter student ID to update: ');
    String id = stdin.readLineSync()!;
    try {
      var s = students.firstWhere((s) => s.id == id);
      stdout.write('New name: ');
      s.name = stdin.readLineSync()!;
      stdout.write('New grade: ');
      s.grade = stdin.readLineSync()!;
      print('✅ Student updated.');
    } catch (e) {
      print('Student not found.');
    }
  }

  void deleteStudent(List<Classroom> classrooms) {
    stdout.write('Enter student ID to delete: ');
    String id = stdin.readLineSync()!;
    students.removeWhere((s) => s.id == id);
    for (var c in classrooms) {
      c.removeStudentById(id);
    }
    print('✅ Student removed.');
  }

  void showAllStudents() {
    for (var s in students) s.displayInfo();
  }
}

class TeacherManager {
  final List<Teacher> teachers = [];

  void addTeacher() {
    stdout.write('ID: ');
    String id = stdin.readLineSync()!;
    stdout.write('Name: ');
    String name = stdin.readLineSync()!;
    stdout.write('Age: ');
    int age = int.parse(stdin.readLineSync()!);
    stdout.write('Gender: ');
    String gender = stdin.readLineSync()!;
    stdout.write('Subject: ');
    String subject = stdin.readLineSync()!;
    stdout.write('Salary: ');
    double salary = double.parse(stdin.readLineSync()!);
    teachers.add(Teacher(id, name, age, gender, subject, salary));
    print('✅ Teacher added.');
  }

  void updateTeacher() {
    stdout.write('Enter teacher ID to update: ');
    String id = stdin.readLineSync()!;
    try {
      var t = teachers.firstWhere((t) => t.id == id);
      stdout.write('New name: ');
      t.name = stdin.readLineSync()!;
      stdout.write('New salary: ');
      t.salary = double.parse(stdin.readLineSync()!);
      print('✅ Teacher updated.');
    } catch (e) {
      print('Teacher not found.');
    }
  }

  void deleteTeacher(List<Classroom> classrooms) {
    stdout.write('Enter teacher ID to delete: ');
    String id = stdin.readLineSync()!;
    teachers.removeWhere((t) => t.id == id);
    for (var c in classrooms) {
      if (c.teacher?.id == id) c.teacher = null;
    }
    print('✅ Teacher removed.');
  }

  void showAllTeachers() {
    for (var t in teachers) t.displayInfo();
  }
}

class ClassroomManager {
  final List<Classroom> classrooms = [];

  void addClassroom() {
    stdout.write('ID: ');
    String id = stdin.readLineSync()!;
    stdout.write('Class name: ');
    String name = stdin.readLineSync()!;
    classrooms.add(Classroom(id, name));
    print('✅ Classroom added.');
  }

  void updateClassroom() {
    stdout.write('Enter classroom ID to update: ');
    String id = stdin.readLineSync()!;
    try {
      var c = classrooms.firstWhere((c) => c.id == id);
      stdout.write('New name: ');
      c.name = stdin.readLineSync()!;
      print('✅ Classroom updated.');
    } catch (e) {
      print('Classroom not found.');
    }
  }

  void deleteClassroom() {
    stdout.write('Enter classroom ID to delete: ');
    String id = stdin.readLineSync()!;
    classrooms.removeWhere((c) => c.id == id);
    print('✅ Classroom removed.');
  }

  void assignStudentToClass(List<Student> students) {
    stdout.write('Student ID: ');
    String sid = stdin.readLineSync()!;
    stdout.write('Classroom ID: ');
    String cid = stdin.readLineSync()!;
    try {
      var s = students.firstWhere((s) => s.id == sid);
      var c = classrooms.firstWhere((c) => c.id == cid);
      c.addStudent(s);
      print('✅ Student assigned to class.');
    } catch (e) {
      print('❌ Student or classroom not found.');
    }
  }

  void assignTeacherToClass(List<Teacher> teachers) {
    stdout.write('Teacher ID: ');
    String tid = stdin.readLineSync()!;
    stdout.write('Classroom ID: ');
    String cid = stdin.readLineSync()!;
    try {
      var t = teachers.firstWhere((t) => t.id == tid);
      var c = classrooms.firstWhere((c) => c.id == cid);
      c.assignTeacher(t);
      print('✅ Teacher assigned to class.');
    } catch (e) {
      print('❌ Teacher or classroom not found.');
    }
  }

  void showAllClassrooms() {
    for (var c in classrooms) c.displayInfo();
  }

  void showClassReport() {
    var grouped = <String, List<Student>>{};
    for (var c in classrooms) {
      for (var s in c.students) {
        grouped.putIfAbsent(s.grade, () => []).add(s);
      }
    }
    grouped.forEach((grade, group) {
      print('\nClass $grade Report:');
      double total = 0;
      for (var s in group) {
        double avg = s.averageScore;
        total += avg;
        print('- ${s.name}: Avg = ${avg.toStringAsFixed(2)}');
      }
      print('>> Class $grade average: ${(total / group.length).toStringAsFixed(2)}');
    });
  }
}

class SchoolManager {
  final studentManager = StudentManager();
  final teacherManager = TeacherManager();
  final classroomManager = ClassroomManager();
}

class SchoolManagerApp {
  final SchoolManager manager = SchoolManager();

  void run() {
    while (true) {
      print('\n=== SCHOOL MANAGEMENT MENU ===');
      print('1. Manage Students');
      print('2. Manage Teachers');
      print('3. Manage Classrooms');
      print('0. Exit');
      stdout.write('Select: ');
      final choice = stdin.readLineSync();

      switch (choice) {
        case '1': studentMenu(); break;
        case '2': teacherMenu(); break;
        case '3': classroomMenu(); break;
        case '0': print('👋 Goodbye!'); return;
        default: print('Invalid option.');
      }
    }
  }

  void studentMenu() {
    while (true) {
      print('\n--- STUDENT MANAGEMENT ---');
      print('1. Add Student');
      print('2. Update Student');
      print('3. Delete Student');
      print('4. Show All Students');
      print('0. Back');
      stdout.write('Select: ');
      final choice = stdin.readLineSync();

      switch (choice) {
        case '1': manager.studentManager.addStudent(); break;
        case '2': manager.studentManager.updateStudent(); break;
        case '3': manager.studentManager.deleteStudent(manager.classroomManager.classrooms); break;
        case '4': manager.studentManager.showAllStudents(); break;
        case '0': return;
        default: print('Invalid option.');
      }
    }
  }

  void teacherMenu() {
    while (true) {
      print('\n--- TEACHER MANAGEMENT ---');
      print('1. Add Teacher');
      print('2. Update Teacher');
      print('3. Delete Teacher');
      print('4. Show All Teachers');
      print('0. Back');
      stdout.write('Select: ');
      final choice = stdin.readLineSync();

      switch (choice) {
        case '1': manager.teacherManager.addTeacher(); break;
        case '2': manager.teacherManager.updateTeacher(); break;
        case '3': manager.teacherManager.deleteTeacher(manager.classroomManager.classrooms); break;
        case '4': manager.teacherManager.showAllTeachers(); break;
        case '0': return;
        default: print('Invalid option.');
      }
    }
  }

  void classroomMenu() {
    while (true) {
      print('\n--- CLASSROOM MANAGEMENT ---');
      print('1. Add Classroom');
      print('2. Update Classroom');
      print('3. Delete Classroom');
      print('4. Assign Student to Class');
      print('5. Assign Teacher to Class');
      print('6. Show All Classrooms');
      print('7. Show Class Report');
      print('0. Back');
      stdout.write('Select: ');
      final choice = stdin.readLineSync();

      switch (choice) {
        case '1': manager.classroomManager.addClassroom(); break;
        case '2': manager.classroomManager.updateClassroom(); break;
        case '3': manager.classroomManager.deleteClassroom(); break;
        case '4': manager.classroomManager.assignStudentToClass(manager.studentManager.students); break;
        case '5': manager.classroomManager.assignTeacherToClass(manager.teacherManager.teachers); break;
        case '6': manager.classroomManager.showAllClassrooms(); break;
        case '7': manager.classroomManager.showClassReport(); break;
        case '0': return;
        default: print('Invalid option.');
      }
    }
  }
}

void main() {
  SchoolManagerApp().run();
}