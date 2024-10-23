import 'package:flutter/material.dart';

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
            Navigator.pushNamed(context, '/phophoto_preview');
          },
          child: const Text('Avançar'),
        ),
      ),
    );
  }
}
