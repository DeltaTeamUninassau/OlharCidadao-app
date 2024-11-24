import 'package:flutter/material.dart';
import 'package:olharcidadao_app/send_list.dart';

class PhotoViewl extends StatelessWidget {
  const PhotoViewl({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo view Edition'),
      ),
      floatingActionButton: SizedBox(
        width: 328,
        height: 48,
        child: FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 37, 110, 105),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SendList()));
          },
          child: const Text(
            "Continuar",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
