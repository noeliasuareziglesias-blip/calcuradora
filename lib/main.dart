 import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String numero = '0';
  double primeiroNumero = 0;
  String operacao = '';

  void adicionarNumero(String n) {
    setState(() {
      if (numero == '0') {
        numero = n;
      } else {
        numero = numero + n;
      }
    });
  }

  void escolherOperacao(String op) {
    setState(() {
      primeiroNumero = double.parse(numero);
      operacao = op;
      numero = '0';
    });
  }

  void calcular() {
    double segundoNumero = double.parse(numero);
    double resultado = 0;

    if (operacao == '+') {
      resultado = primeiroNumero + segundoNumero;
    } else if (operacao == '-') {
      resultado = primeiroNumero - segundoNumero;
    } else if (operacao == '×') {
      resultado = primeiroNumero * segundoNumero;
    } else if (operacao == '÷') {
      if (segundoNumero == 0) {
        numero = 'Erro';
        return;
      }

      resultado = primeiroNumero / segundoNumero;
    }

    setState(() {
      if (resultado % 1 == 0) {
        numero = resultado.toInt().toString();
      } else {
        numero = resultado.toString();
      }

      operacao = '';
    });
  }

  void limpar() {
    setState(() {
      numero = '0';
      primeiroNumero = 0;
      operacao = '';
    });
  }

  Widget botaoNumero(String texto) {
    return ElevatedButton(
      onPressed: () {
        adicionarNumero(texto);
      },
      child: Text(texto),
    );
  }

  Widget botaoOperacao(String texto) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
      ),
      onPressed: () {
        escolherOperacao(texto);
      },
      child: Text(texto),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Calculadora'),
          backgroundColor: const Color.fromARGB(255, 247, 162, 5),
        ),

        body: Column(
          children: [
            const SizedBox(height: 30),

            Text(
              numero,
              style: const TextStyle(
                fontSize: 40,
              ),
            ),

            const SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                botaoNumero('1'),

                const SizedBox(width: 10),

                botaoNumero('2'),

                const SizedBox(width: 10),

                botaoNumero('3'),
              ],
            ),

            const SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                botaoNumero('4'),

                const SizedBox(width: 10),

                botaoNumero('5'),

                const SizedBox(width: 10),

                botaoNumero('6'),
              ],
            ),

            const SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                botaoNumero('7'),

                const SizedBox(width: 10),

                botaoNumero('8'),

                const SizedBox(width: 10),

                botaoNumero('9'),
              ],
            ),

            const SizedBox(height: 10),

            botaoNumero('0'),

            const SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                botaoOperacao('+'),

                const SizedBox(width: 10),

                botaoOperacao('-'),

                const SizedBox(width: 10),

                botaoOperacao('×'),

                const SizedBox(width: 10),

                botaoOperacao('÷'),
              ],
            ),

            const SizedBox(height: 15),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: calcular,
                  child: const Text('='),
                ),

                const SizedBox(width: 10),

                ElevatedButton(
                  onPressed: limpar,
                  child: const Text('C'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}