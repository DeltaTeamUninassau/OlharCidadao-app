import 'package:flutter/material.dart';
import 'package:olharcidadao_app/camera_screen.dart';
import 'package:olharcidadao_app/photo_description.dart';
import 'package:olharcidadao_app/photo_preview.dart';
import 'package:olharcidadao_app/result.dart';
import 'package:olharcidadao_app/routes/app_routes.dart';
import 'package:olharcidadao_app/send_list.dart';

Map<String, Widget Function(BuildContext)> initRoutes(BuildContext context) {
  return {
    AppRoutes.initial: (context) => const CameraScreen(),
    AppRoutes.photoPreview: (context) => const PhotoPreview(),
    AppRoutes.photoDescription: (context) => const PhotoDescription(),
    AppRoutes.sendList: (context) => const SendList(),
    AppRoutes.result: (context) => const Result(),
  };
}
