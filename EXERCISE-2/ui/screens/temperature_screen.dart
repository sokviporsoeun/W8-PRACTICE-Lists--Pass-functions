import 'package:flutter/material.dart';

class TemperatureScreen extends StatefulWidget {
  final VoidCallback onBackPressed;

  const TemperatureScreen({super.key, required this.onBackPressed});

  @override
  State<TemperatureScreen> createState() => _TemperatureScreenState();
}

class _TemperatureScreenState extends State<TemperatureScreen> {
  final InputDecoration inputDecoration = InputDecoration(
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white, width: 1.0),
      borderRadius: BorderRadius.circular(12),
    ),
    hintText: 'Enter a temperature',
    hintStyle: const TextStyle(color: Colors.white),
  );

  final TextEditingController inputController = TextEditingController();
  double? fahrenheiValue;

  void covertToFahrenheit(String value){
    if (value.isEmpty){
      setState(() {
        fahrenheiValue = null;
      });
      return;
    }

    final double? celsius = double.tryParse(value);
    if (celsius != null){
      setState(() {
        fahrenheiValue = (celsius * 9 / 5) + 32;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(
              Icons.thermostat_outlined,
              size: 120,
              color: Colors.white,
            ),

            Center(
              child: GestureDetector(
                onTap: widget.onBackPressed,
                child: Text(
                "Converter",
                style: TextStyle(color: Colors.white, fontSize: 45),
              ),
              ),
            ),
            const SizedBox(height: 50),
            
            const Text("Temperature in Degrees:"),
            const SizedBox(height: 10),
            TextField(
              controller: inputController,
              onChanged: covertToFahrenheit,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.white, 
                    width: 1.0),
                  borderRadius: BorderRadius.circular(12),
                ),
                hintText: 'Enter a temperature',
              ),
              
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 30),

            const Text("Temperature in Fahrenheit:"),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                fahrenheiValue == null ? "0" : fahrenheiValue!.toStringAsFixed(2),
                style: const TextStyle(color: Colors.black, fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
