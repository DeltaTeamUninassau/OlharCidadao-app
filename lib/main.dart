import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:olharcidadao_app/app.dart';
import 'package:olharcidadao_app/camera_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(const CameraApp());
}
