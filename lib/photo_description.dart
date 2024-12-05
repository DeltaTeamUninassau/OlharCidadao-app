import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:intl/intl.dart';
import 'package:geocoding/geocoding.dart';
import 'package:olharcidadao_app/send_list.dart';
import 'package:path_provider/path_provider.dart';

class PhotoDescription extends StatefulWidget {
  final String photoPath;

  const PhotoDescription({super.key, required this.photoPath});

  @override
  State<PhotoDescription> createState() => _PhotoDescriptionState();
}

class _PhotoDescriptionState extends State<PhotoDescription> {
  final LatLng location = LatLng(-7.224688, -39.315518);
  String cityName = 'Carregando...';
  File? _image;

  @override
  void initState() {
    super.initState();
    _getCityName();
    _loadLastCapturedImage();
  }

  Future<void> _getCityName() async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(location.latitude, location.longitude);
      debugPrint('Placemarks: $placemarks');
      if (placemarks.isNotEmpty) {
        setState(() {
          cityName = placemarks.first.locality ?? 'Cidade não encontrada';
        });
      } else {
        setState(() {
          cityName = 'Cidade não encontrada';
        });
      }
    } catch (e) {
      debugPrint('Erro ao carregar cidade: $e');
      setState(() {
        cityName = 'Erro ao carregar cidade';
      });
    }
  }

  Future<void> _loadLastCapturedImage() async {
    final directory = await getExternalStorageDirectory();
    final Directory dir = Directory('${directory?.path}/Pictures');

    if (await dir.exists()) {
      final List<FileSystemEntity> files = dir.listSync();
      files.sort(
          (a, b) => b.statSync().modified.compareTo(a.statSync().modified));

      if (files.isNotEmpty) {
        setState(() {
          _image = File(files.first.path);
        });
      }
    } else {
      debugPrint('Diretório não encontrado: ${dir.path}');
    }
  }

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('dd/MM/yyyy').format(DateTime.now());
    String formattedTime = DateFormat('HH:mm').format(DateTime.now());

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 37, 110, 105),
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  formattedDate,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(width: 8),
                Text(
                  '- $formattedTime',
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Text('Local'),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 37, 110, 105),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.black,
                width: 0.5,
              ),
            ),
            child: SizedBox(
              width: 375,
              height: 170,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: FlutterMap(
                  options: MapOptions(
                    center: location,
                    zoom: 13.2,
                  ),
                  children: [
                    TileLayer(
                      urlTemplate:
                          "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                      subdomains: const ['a', 'b', 'c'],
                    ),
                    MarkerLayer(
                      markers: [
                        Marker(
                          width: 60.0,
                          height: 60.0,
                          point: location,
                          builder: (ctx) => CircleAvatar(
                            backgroundImage:
                                _image != null ? FileImage(_image!) : null,
                            child: _image == null
                                ? const Icon(Icons.add_a_photo)
                                : null,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            padding:
                const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 18.0),
            color: const Color.fromARGB(255, 37, 110, 105),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cityName,
                      style: const TextStyle(color: Colors.black, fontSize: 18),
                    ),
                    Text(
                      '${location.latitude}, ${location.longitude}',
                      style: const TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.black,
                    width: 0.5,
                  ),
                ),
                child: const TextField(
                  maxLines: null, // Permite múltiplas linhas
                  expands: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    labelText: 'Digite uma pequena descrição do serviço',
                    labelStyle:
                        TextStyle(color: Color.fromARGB(255, 141, 141, 141)),
                  ),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(40.0),
          ),
        ],
      ),
      floatingActionButton: SizedBox(
        width: 328,
        height: 48,
        child: FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SendList()));
          },
          child: const Text(
            "Avancar",
            style: TextStyle(color: Color.fromARGB(255, 37, 110, 105)),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
