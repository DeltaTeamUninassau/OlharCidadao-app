import 'package:flutter/material.dart';

class PhotoViewl extends StatelessWidget {
  const PhotoViewl({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo Preview Optionso'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/send_list');
          },
          child: const Text('Continuar'),
        ),
      ),
    );
  }
}
