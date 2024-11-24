import 'package:flutter/material.dart';
import 'package:olharcidadao_app/result.dart';

class SendList extends StatelessWidget {
  const SendList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Send List'),
      ),
      floatingActionButton: SizedBox(
        width: 328,
        height: 48,
        child: FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 37, 110, 105),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Result()));
          },
          child: const Text(
            "Enviar",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
