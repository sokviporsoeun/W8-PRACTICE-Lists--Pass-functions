// Q1 - When is each approach better? 
// For-loop: Best for complex logic, multiple conditions, or large datasets.
// Map: Great for simple element-to-element transformations (same length output).
// Helper Function: Useful when logic is reused or long, improving readability.

import 'package:flutter/material.dart';

final List<String> colorList = ["red", "blue", "green"];

List<Widget> buildColorWidgets() {
  // Using a helper function to generate items
  return colorList.map((color) => Text(color)).toList();
}

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ColorDemoScreen(),
    ),
  );
}

class ColorDemoScreen extends StatelessWidget {
  const ColorDemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: ListView(
          children: [
            const SectionLabel("Method 1: Loop in Array", bold: true),
            // For-loop version
            for (int index = 0; index < colorList.length; index++)
              Text(colorList[index]),

            const SectionLabel("Method 2: Map", bold: true),
            // Using map
            ...colorList.map((c) => Text(c)).toList(),

            const SectionLabel("Method 23: Dedicated Function", bold: true),
            // Helper function results
            ...buildColorWidgets(),
          ],
        ),
      ),
    );
  }
}

class SectionLabel extends StatelessWidget {
  const SectionLabel(this.label, {super.key, this.bold = false});

  final String label;
  final bool bold;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
        fontWeight: bold ? FontWeight.w600 : FontWeight.normal,
      ),
    );
  }
}
