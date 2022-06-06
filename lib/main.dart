import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'package:valorant_tips/screens/agents_screen.dart';
import 'package:valorant_tips/screens/main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreenView(
        navigateRoute: AgentsScreen(),
        duration: 6000,
        imageSize: 330,
        imageSrc: "assets/logo-colores.gif",
        backgroundColor: Color.fromARGB(255, 4, 6, 4),
      ),
    );
  }
}
