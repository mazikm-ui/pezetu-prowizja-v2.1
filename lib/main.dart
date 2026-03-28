import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PeZetU Prowizja',
      theme: ThemeData.dark(),
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  double skladka = 0;
  double prowizja = 0;

  void licz() {
    setState(() {
      prowizja = skladka * 2.5;
    });
  }

  void zeruj() {
    setState(() {
      skladka = 0;
      prowizja = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("PeZetU PROWIZJA")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Składka"),
              onChanged: (value) {
                skladka = double.tryParse(value) ?? 0;
                licz();
              },
            ),
            SizedBox(height: 20),
            Text("Prowizja: ${prowizja.toStringAsFixed(2)} zł",
                style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: zeruj,
              child: Text("Zeruj"),
            )
          ],
        ),
      ),
    );
  }
}
