import 'package:attendance_system/pages/home_pages.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

const supabaseUrl = 'https://jojejofqkcansncqfdbj.supabase.co';
const supabaseKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpvamVqb2Zxa2NhbnNuY3FmZGJqIiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODg2NTA1MTgsImV4cCI6MjAwNDIyNjUxOH0.rIzLBv6v1ab4Sv7IN7IV3IzHhPzssPbe-w0dgFJsZLs';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Supabase.initialize(url: supabaseUrl, anonKey: supabaseKey);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //title: 'Flutter Demo',
      // theme: ThemeData(
        
      //   //colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //   //useMaterial3: true,
      // ),
      home: HomePages(),
    );
  }
}

