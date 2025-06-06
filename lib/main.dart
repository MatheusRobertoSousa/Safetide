// main.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './screens/main_screen.dart';
void main() {
  runApp(AlertaRioApp());
}

// Paleta de Cores AlertaRio
class AlertaRioColors {

  static const Color azulCeu = Color(0xFF87CEEB);
  static const Color azulMedio = Color(0xFF4682B4);
  static const Color azulEscuro = Color(0xFF1E3A5F);
  static const Color azulMarinhoProfundo = Color(0xFF0A192F);
  static const Color vermelhoAlerta = Color(0xFFB22222);
  static const Color amareloAlerta = Color(0xFFFFD700);
  static const Color brancoNeutro = Color(0xFFF5F5F5);
  static const Color cinzaUrbano = Color(0xFF2E2E2E);
  
  // Gradiente para fundos
  static const LinearGradient backgroundGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color.fromARGB(255, 255, 255, 255), Color.fromARGB(255, 255, 255, 255), Color.fromARGB(255, 255, 255, 255)],
  );
  
  static const LinearGradient cardGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color.fromARGB(255, 255, 255, 255), Color.fromARGB(255, 255, 255, 255)],
  );
}

class AlertaRioApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Safetide',
      theme: ThemeData(
        primaryColor: AlertaRioColors.azulEscuro,
        scaffoldBackgroundColor: AlertaRioColors.brancoNeutro,
        fontFamily: 'Roboto',
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: AlertaRioColors.cinzaUrbano),
          bodyMedium: TextStyle(color: AlertaRioColors.cinzaUrbano),
          titleLarge: TextStyle(color: AlertaRioColors.azulMarinhoProfundo, fontWeight: FontWeight.bold),
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: AlertaRioColors.azulEscuro,
          primary: AlertaRioColors.azulEscuro,
          secondary: AlertaRioColors.azulMedio,
          error: AlertaRioColors.vermelhoAlerta,
        ),
      ),
      home: MainScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}










