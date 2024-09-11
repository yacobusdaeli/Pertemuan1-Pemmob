import 'package:flutter/material.dart';

void main() {
  runApp(BMICalculator());
}

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BMICalculatorHome(),
    );
  }
}

class BMICalculatorHome extends StatefulWidget {
  @override
  _BMICalculatorHomeState createState() => _BMICalculatorHomeState();
}

class _BMICalculatorHomeState extends State<BMICalculatorHome> {
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  String _result = "";

  void _calculateBMI() {
    double weight = double.parse(_weightController.text);
    double height = double.parse(_heightController.text);

    // Rumus IMT: berat / (tinggi * tinggi)
    double bmi = weight / (height * height);

    // Tentukan kategori berdasarkan nilai IMT
    String bmiCategory;
    if (bmi < 18.5) {
      bmiCategory = "Berat badan kurang";
    } else if (bmi >= 18.5 && bmi < 24.9) {
      bmiCategory = "Berat badan normal";
    } else if (bmi >= 25 && bmi < 29.9) {
      bmiCategory = "Berat badan berlebih (Pre-obesitas)";
    } else {
      bmiCategory = "Obesitas";
    }

    setState(() {
      _result = "IMT: ${bmi.toStringAsFixed(2)}\nKategori: $bmiCategory";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Program untuk menghitung Indeks Massa Tubuh (IMT)'),
        centerTitle: true, // Ini akan membuat title berada di tengah
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: _weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Berat Badan (kg)',
              ),
            ),
            TextField(
              controller: _heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Tinggi Badan (m)',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateBMI,
              child: Text('Hitung IMT'),
            ),
            SizedBox(height: 5),
            Text(
              _result,
              style: TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
