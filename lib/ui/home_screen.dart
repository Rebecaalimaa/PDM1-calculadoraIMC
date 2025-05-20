import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final double peso;
  final double altura;

  const HomeScreen({super.key, required this.peso, required this.altura});

  double calcularIMC() {
    return peso / (altura * altura);
  }

  String classificarIMC(double imc) {
    if (imc < 18.5) return 'Abaixo do peso';
    if (imc < 24.9) return 'Peso normal';
    if (imc < 29.9) return 'Sobrepeso';
    if (imc < 34.9) return 'Obesidade grau 1';
    if (imc < 39.9) return 'Obesidade grau 2';
    return 'Obesidade grau 3';
  }

  @override
  Widget build(BuildContext context) {
    double imc = calcularIMC();
    String classificacao = classificarIMC(imc);

    return Scaffold(
      appBar: AppBar(
        title: Text('Resultado IMC'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Seu IMC é: ${imc.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 22, color: Colors.blueGrey),
            ),
            Text(
              'Classificação: $classificacao',
              style: TextStyle(fontSize: 18),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Voltar'),
            )
          ],
        ),
      ),
    );
  }
}
