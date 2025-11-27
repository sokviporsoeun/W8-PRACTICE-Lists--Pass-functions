// Q1 - In what scenarios might one approach be more advantageous than another? 
//  (in terms of readability, maintainability, performance, etc.)?
// For-loop: Best for complex logic, multiple conditions, or large datasets.
// Map: Great for simple element-to-element transformations (same length output).
// dedicated: Useful when logic is reused or large.

import 'package:flutter/material.dart';

//Q2
List<String> colors = ["red", "blue", "green"];

List<Widget> buildColorWidgets() {
  // Using a helper function to generate items
  return colors.map((color) => Text(color)).toList();
}

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              Label("Method 1: Loop in Array", bold: true),
              // TODO
              // For-loop version
              for (int index = 0; index < colors.length; index++)
              Text(colors[index]),

              Label("Method 2: Map", bold: true),
              // TODO
              // Using map
              ...colors.map((c) => Text(c)).toList(),

              Label("Method 23: Dedicated Function", bold: true),
              // TODO
              // Helper function results
              ...buildColorWidgets(),
            ],
          ),
        ),
      ),
    ),
  );
}

class Label extends StatelessWidget {
  const Label(this.text, {super.key, this.bold = false});

  final bool bold;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: (bold ? FontWeight.bold : FontWeight.normal),
      ),
    );
  }
}
