//Q1: How are you going to manage this? 
// To manage this i use a boolean variable name "showWelcomeScreen",setState() to update UI screen and two callbacks function (onConvertPressed, onBackPressed)
// Explain your solution using a component diagram(WelcomeScreen + TemperatureScreen) :
// Explanation:
// - TemperatureApp controls which screen is shown.
// - WelcomeScreen calls onConvertPressed → switch to TemperatureScreen.
// - TemperatureScreen calls onBackPressed → switch back to WelcomeScreen.
// - setState() updates the boolean and refreshes the UI.
// - Both screens use callbacks to communicate with the parent instead of
//   directly switching screens themselves.


import 'package:flutter/material.dart';
import 'ui/screens/temperature_screen.dart';
import 'ui/screens/welcome_screen.dart';
//Q2
class TemperatureApp extends StatefulWidget {
  const TemperatureApp({super.key});

  @override
  State<TemperatureApp> createState() {
    return _TemperatureAppState();
  }
}

class _TemperatureAppState extends State<TemperatureApp> {
    bool showWelcomeScreen = true;

    void handleConvertScreen() {
      setState(() {
        showWelcomeScreen = false;
      });
    }

    void handleBackScreen() {
      setState(() {
        showWelcomeScreen = true;
      });
  }
  @override
  Widget build(context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xff16C062),
                Color(0xff00BCDC),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: showWelcomeScreen
              ? WelcomeScreen(onConvertPressed: handleConvertScreen)
              : TemperatureScreen(onBackPressed: handleBackScreen),
        ),
      ),
    );
  }
}

void main() {
  runApp(const TemperatureApp());
}
