import 'package:flutter/material.dart';

import 'package:olharcidadao_app/routes/app_routes.dart';
import 'package:olharcidadao_app/routes/init_routes.dart';
import 'package:olharcidadao_app/store/camera_store.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CameraStore(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.initial,
        routes: initRoutes(context),
      ),
    );
  }
}
