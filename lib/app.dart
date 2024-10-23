import 'package:flutter/material.dart';
import 'package:olharcidadao_app/camera_screen.dart';
import 'package:olharcidadao_app/photo_description.dart';
import 'package:olharcidadao_app/photo_viewl.dart';
import 'package:olharcidadao_app/send_list.dart';
import 'package:olharcidadao_app/result.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const CameraScreen(),
        '/photo_description': (context) => const PhotoDescription(),
        '/photo_preview': (context) => const PhotoViewl(),
        '/send_list': (context) => const SendList(),
        '/result': (context) => const Result(),
      },
    );
  }
}
