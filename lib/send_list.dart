import 'package:flutter/material.dart';
import 'package:olharcidadao_app/routes/app_routes.dart';

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
            Navigator.pushNamed(context, AppRoutes.result);
          },
          child: const Text('Enviar'),
        ),
      ),
    );
  }
}
