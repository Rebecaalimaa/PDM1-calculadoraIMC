import 'package:applogin/ui/home_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String peso = '';
  String altura = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora de IMC'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Avalie sua saúde',
              style: TextStyle(fontSize: 18, color: Colors.blueGrey),
            ),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Digite seu peso',
              ),
              onChanged: (value) {
                setState(() {
                  peso = value;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Digite sua altura',
              ),
              onChanged: (value) {
                setState(() {
                  altura = value;
                });
              },
            ),
           ElevatedButton(
  onPressed: () {
    double? pesoDouble = double.tryParse(peso);
    double? alturaDouble = double.tryParse(altura);

    if (pesoDouble != null && alturaDouble != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(
            peso: pesoDouble,
            altura: alturaDouble,
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Insira valores válidos!'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  },
  child: Text('Calcular IMC'),
),

          ],
        ),
      ),
    );
  }
}