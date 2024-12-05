import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 37, 110, 105),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Divider(
                color: Colors.white, thickness: 2, indent: 20, endIndent: 20),
            Spacer(
              flex: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Enviado com sucesso',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                SizedBox(width: 8),
                Icon(Icons.check, color: Colors.white),
              ],
            ),
            Spacer(
              flex: 2,
            ),
            Divider(
                color: Colors.white, thickness: 2, indent: 20, endIndent: 20),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
