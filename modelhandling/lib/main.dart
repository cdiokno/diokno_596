import 'package:flutter/material.dart';
import 'package:modelhandling/model/productmodel.dart';
import 'package:modelhandling/screen/homapage.dart';
import 'package:modelhandling/screen/login_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'screen/product_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(anonKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFoeG9xcGtnZHV5c3J3dHpvbnZvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzA4ODM4NDAsImV4cCI6MjA4NjQ1OTg0MH0.1F9-eRQfgilEtoFj1dXVocvKquMz-auHjzbciQiOWCo", url: "https://ahxoqpkgduysrwtzonvo.supabase.co");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      debugShowCheckedModeBanner: false,
      home: const LoginPage()
    );
  }
}
