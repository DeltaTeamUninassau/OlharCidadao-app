import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:olharcidadao_app/photo_preview.dart';

import 'package:olharcidadao_app/routes/app_routes.dart';
import 'package:olharcidadao_app/store/camera_store.dart';
import 'package:provider/provider.dart';

late List<CameraDescription> cameras;

class CameraScreen extends StatelessWidget {
  const CameraScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: CameraApp());
  }
}

class CameraApp extends StatefulWidget {
  const CameraApp({super.key});

  @override
  State<CameraApp> createState() => _CameraAppState();
}

class _CameraAppState extends State<CameraApp> {
  late CameraController _controller;
  FlashMode _flashMode = FlashMode.auto;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(cameras[0], ResolutionPreset.max);
    _controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            print("Accesso negado");
            break;
          default:
            print(e.description);
            break;
        }
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _takePicture() {
    if (!_controller.value.isInitialized) {
      return;
    }
    if (_controller.value.isTakingPicture) {
      return;
    }

    try {
      _controller.setFlashMode(_flashMode).then((v) {
        _controller.takePicture().then((file) {
          final cameraStore = Provider.of<CameraStore>(context, listen: false);
          cameraStore.setFile(context, file);
          // Navigator.pushNamed(
          //   context,
          //   AppRoutes.photoPreview,
          //   arguments: file,
          // );
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => PhotoPreview(file),
          //   ),
          // );
        });
      });
    } on CameraException catch (e) {
      debugPrint("Error ao tirar a foto: $e");
    }
  }

  void _toggleFlash() {
    setState(() {
      _flashMode =
          _flashMode == FlashMode.off ? FlashMode.always : FlashMode.off;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: _takePicture,
        child: Stack(
          children: [
            Positioned(
              top: MediaQuery.of(context).size.height / 8,
              left: MediaQuery.of(context).size.height / 40,
              child: Center(
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.1,
                  height: MediaQuery.of(context).size.height / 1.3,
                  decoration: BoxDecoration(
                      color: Colors.yellow,
                      border: Border.all(
                          width: 5,
                          color: const Color.fromARGB(255, 37, 110, 105))),
                  child: SizedBox(
                    height: double.infinity,
                    child: CameraPreview(_controller),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 50,
              left: MediaQuery.of(context).size.width / 2 - 40,
              child: RawMaterialButton(
                onPressed: _toggleFlash,
                elevation: 2.0,
                fillColor: const Color.fromARGB(255, 37, 110, 105),
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(12.0),
                child: Icon(
                  color: Colors.white,
                  _flashMode == FlashMode.off
                      ? Icons.flash_on
                      : Icons.flash_off,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        width: 328,
        height: 48,
        child: FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 37, 110, 105),
          onPressed: () {},
          child: const Text(
            "SAIR",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
