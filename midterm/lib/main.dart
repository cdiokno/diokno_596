import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'view/student_page.dart';

// TO DO #12: Add Supabase URL and Anon Key
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://ljqijcvzhqrgjinkagwe.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImxqcWlqY3Z6aHFyZ2ppbmthZ3dlIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzM5MDIwMjEsImV4cCI6MjA4OTQ3ODAyMX0.nLc3DsDdda9Lw3en2Okf7He8vUBXp9CaFCpu0JpjF58',
  );

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StudentPage(),
    );
  }
}
