class Student {
  final int? id;
  final String name;
  final double quiz;
  final double activity;
  final double exam;

  Student({
    this.id,
    required this.name,
    required this.quiz,
    required this.activity,
    required this.exam,
  });

  // TO DO #1: Calculate average
  double get average => (quiz + activity + exam) / 3;

  // TO DO #2: Determine status
  String get status => average >= 75 ? 'Passed' : 'Failed';

  // From database
  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
      id: map['id'],
      name: map['name'],
      quiz: double.parse(map['quiz'].toString()),
      activity: double.parse(map['activity'].toString()),
      exam: double.parse(map['exam'].toString()),
    );
  }

  // TO DO #3: To database
  Map<String, dynamic> toMap() {
    return {'name': name, 'quiz': quiz, 'activity': activity, 'exam': exam};
  }
}
