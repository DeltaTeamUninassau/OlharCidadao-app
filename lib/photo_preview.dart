import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:olharcidadao_app/photo_description.dart';

// ignore: must_be_immutable
class PhotoPreview extends StatefulWidget {
  PhotoPreview(this.file, {super.key});
  XFile file;

  @override
  State<PhotoPreview> createState() => _PhotoPreviewState();
}

class _PhotoPreviewState extends State<PhotoPreview> {
  @override
  Widget build(BuildContext context) {
    File picture = File(widget.file.path);
    return Scaffold(
      body: Center(
        child: Positioned(
          top: MediaQuery.of(context).size.height / 8,
          left: MediaQuery.of(context).size.height / 40,
          child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width / 1.1,
              height: MediaQuery.of(context).size.height / 1.3,
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 5,
                      color: const Color.fromARGB(255, 37, 110, 105))),
              child: SizedBox(
                height: double.infinity,
                child: Image.file(picture),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        width: 328,
        height: 48,
        child: FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 37, 110, 105),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const PhotoDescription()));
          },
          child: const Text(
            "CONTINUAR",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
