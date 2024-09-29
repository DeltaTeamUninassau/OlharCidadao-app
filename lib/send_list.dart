import 'package:flutter/material.dart';

class SendList extends StatelessWidget {
  const SendList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Send List'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/result');
          },
          child: const Text('Enviar'),
        ),
      ),
    );
  }
}
