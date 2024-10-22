import 'package:flutter/material.dart';
import 'package:pet_adopted/view/cadastro_pet.dart';
import 'package:pet_adopted/view/home_pet.dart';
import 'package:pet_adopted/view/login_user.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pet Store',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LoginForm(),
    );
  }
}