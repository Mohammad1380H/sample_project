import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_project/home_screen.dart';
import 'package:sample_project/repository/repository.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Bloc',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: RepositoryProvider(
        create: (context) => Repository(),
        child: const Scaffold(
          body: HomeScreen(),
        ),
      ),
    );
  }
}
