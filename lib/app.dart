import 'package:flutter/material.dart';
import 'package:olharcidadao_app/home_page.dart';

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
      home: const HomePage(),
    );
  }
}
