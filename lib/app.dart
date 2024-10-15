import 'package:flutter/material.dart';
import 'package:olharcidadao_app/home_page.dart';
import 'package:olharcidadao_app/photo.dart';
import 'package:olharcidadao_app/screens/photo_description.dart';
import 'package:olharcidadao_app/result.dart';
import 'package:olharcidadao_app/screens/send_list.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Olhar Cidadão',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        appBarTheme: const AppBarTheme(
          color: Colors.indigo,
          foregroundColor: Colors.white,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/photo_description': (context) => const PhotoDescription(),
        '/photo': (context) => const Photo(),
        '/send_list': (context) => const SendList(),
        '/result': (context) => const Result(),
      },
    );
  }
}
