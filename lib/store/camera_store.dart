import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:olharcidadao_app/app.dart';
import 'package:olharcidadao_app/photo_preview.dart';

class CameraStore with ChangeNotifier {
  XFile? file;

  void setFile(BuildContext context, XFile f) {
    file = f;
    notifyListeners();

    // Navigator.pushNamed(context, AppRoutes.photoPreview);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const App(),
      ),
    );
  }
}
