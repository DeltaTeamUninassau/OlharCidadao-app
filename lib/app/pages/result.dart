import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: SucessoWidget(),
        ),
      ),
    );
  }
}

class SucessoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF2E736E),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 80),
            child: Container(
              height: 2,
              color: Colors.white,
            ),
          ),
          const Spacer(),
          const Column(
            children: [
              Text(
                'Enviado com\nsucesso',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Icon(
                Icons.check_circle,
                color: Colors.white,
                size: 30,
              ),
            ],
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 80),
            child: Container(
              height: 2,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
