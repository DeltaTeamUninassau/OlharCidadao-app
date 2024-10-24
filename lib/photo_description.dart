import 'package:flutter/material.dart';
import 'package:olharcidadao_app/routes/app_routes.dart';

class PhotoDescription extends StatelessWidget {
  const PhotoDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo Description'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, AppRoutes.sendList);
          },
          child: const Text('Avançar'),
        ),
      ),
    );
  }
}
