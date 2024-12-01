import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'package:olharcidadao_app/components/descriptionInput/index.dart';
import 'package:olharcidadao_app/components/locationMap/index.dart';
import 'package:olharcidadao_app/components/submitButton/index.dart';

class PhotoDescription extends StatefulWidget {
  const PhotoDescription({super.key});

  @override
  State<PhotoDescription> createState() => _PhotoDescriptionState();
}

class _PhotoDescriptionState extends State<PhotoDescription> {
  final _descriptionController = TextEditingController();
  final int maxDescriptionLength = 256;
  LatLng _currentPosition = LatLng(-7.224688, -39.315518);
  String _currentCity = "Carregando cidade...";
  bool _isLoadingLocation = true;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      _showLocationError('Por favor, ative o serviço de localização.');
      return;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        _showLocationError('Permissão de localização negada.');
        return;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      _showLocationError(
          'Permissão de localização negada permanentemente. Por favor, habilite manualmente nas configurações.');
      return;
    }
    LocationSettings locationSettings = LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 10,
    );
    Position position = await Geolocator.getCurrentPosition(
      locationSettings: locationSettings,
    );
    setState(() {
      _currentPosition = LatLng(position.latitude, position.longitude);
      _isLoadingLocation = false;
    });
    _getCityFromCoordinates(position.latitude, position.longitude);
  }

  Future<void> _getCityFromCoordinates(
      double latitude, double longitude) async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude, longitude);
      if (placemarks.isNotEmpty) {
        setState(() {
          _currentCity = placemarks.first.locality ?? 'Cidade não encontrada';
        });
      }
    } catch (e) {
      setState(() {
        _currentCity = 'Erro ao obter cidade';
      });
    }
  }

  void _showLocationError(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Erro de Localização'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String formattedDate =
        DateFormat('EEE, d MMM y - HH:mm').format(DateTime.now());

    return Scaffold(
      backgroundColor: const Color(0xFF256E69),
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  formattedDate,
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                ),
                const SizedBox(height: 16),
                const Text('Local',
                    style: TextStyle(fontSize: 16, color: Colors.white)),
                const SizedBox(height: 8),
                LocationMap(
                  currentPosition: _currentPosition,
                  isLoadingLocation: _isLoadingLocation,
                  currentCity: _currentCity,
                ),
                const SizedBox(height: 16),
                DescriptionInput(
                  controller: _descriptionController,
                  maxLength: maxDescriptionLength,
                ),
                const SizedBox(height: 16),
                SubmitButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/send_list',
                      arguments: {
                        'latitude': _currentPosition.latitude,
                        'longitude': _currentPosition.longitude,
                        'description': _descriptionController.text,
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
