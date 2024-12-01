import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

@immutable
class LocationMap extends StatelessWidget {
  final LatLng currentPosition;
  final bool isLoadingLocation;
  final String currentCity;

  const LocationMap({
    Key? key,
    required this.currentPosition,
    required this.isLoadingLocation,
    required this.currentCity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 200,
          decoration: BoxDecoration(
            color: Colors.teal[300],
            borderRadius: BorderRadius.circular(16),
          ),
          child: isLoadingLocation
              ? const Center(child: CircularProgressIndicator())
              : FlutterMap(
                  options: MapOptions(
                    initialCenter: currentPosition,
                    initialZoom: 15,
                  ),
                  children: [
                    TileLayer(
                      urlTemplate:
                          'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                      subdomains: ['a', 'b', 'c'],
                    ),
                    MarkerLayer(
                      markers: [
                        Marker(
                          point: currentPosition,
                          width: 80,
                          height: 80,
                          child: const Icon(
                            Icons.location_pin,
                            color: Colors.red,
                            size: 40,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
        ),
        const SizedBox(height: 8),
        Text(
          currentCity,
          style: const TextStyle(color: Colors.white),
        ),
        Text(
          'Lat: ${currentPosition.latitude}, Lng: ${currentPosition.longitude}',
          style: const TextStyle(fontSize: 16, color: Colors.white),
        ),
      ],
    );
  }
}
