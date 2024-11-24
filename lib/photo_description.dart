import 'package:flutter/material.dart';
import 'package:olharcidadao_app/photo_viewl.dart';

class PhotoDescription extends StatelessWidget {
  const PhotoDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo Description'),
      ),
      floatingActionButton: SizedBox(
        width: 328,
        height: 48,
        child: FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 37, 110, 105),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const PhotoViewl()));
          },
          child: const Text(
            "Avançar",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
