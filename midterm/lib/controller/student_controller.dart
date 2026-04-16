import 'package:supabase_flutter/supabase_flutter.dart';
import '../model/student.dart';

class StudentController {
  final supabase = Supabase.instance.client;

  // TO DO #4: Fetch all students from Supabase
  Future<List<Student>> getStudents() async {
    final data = await supabase.from('students').select();
    return data.map((item) => Student.fromMap(item)).toList();
  }

  // TO DO #4: Insert student to Supabase
  Future<void> addStudent(Student student) async {
    await supabase.from('students').insert(student.toMap());
  }

  // TO DO #5: Delete student by ID
  Future<void> deleteStudent(int id) async {
    await supabase.from('students').delete().eq('id', id);
  }

  // TO DO #6: Filter students by name (case-insensitive search)
  // If query is empty, return all students
  List<Student> searchStudents(List<Student> students, String query) {
    if (query.isEmpty) return students;
    return students
        .where(
            (s) => s.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  // TO DO #7: Calculate the class average
  // Sum all student averages and divide by total students
  // Return 0 if list is empty
  double getClassAverage(List<Student> students) {
    if (students.isEmpty) return 0;
    double sum = 0;
    for (var student in students) {
      sum += student.average;
    }
    return sum / students.length;
  }

  // Count students who passed
  int countPassed(List<Student> students) {
    int count = 0;
    for (var student in students) {
      if (student.status == 'Passed') count++;
    }
    return count;
  }

  // TO DO #8: Count students who failed
  int countFailed(List<Student> students) {
    int count = 0;
    for (var student in students) {
      if (student.status == 'Failed') count++;
    }
    return count;
  }
}
