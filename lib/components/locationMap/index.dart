import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

@immutable
class LocationMap extends StatelessWidget {
  final LatLng currentPosition;
  final bool isLoadingLocation;
  final String currentCity;
  final Function(GoogleMapController) onMapCreated;

  const LocationMap({
    Key? key,
    required this.currentPosition,
    required this.isLoadingLocation,
    required this.onMapCreated,
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
              ? Center(child: CircularProgressIndicator())
              : GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: currentPosition,
                    zoom: 15,
                  ),
                  onMapCreated: (controller) {
                    onMapCreated(controller);
                  },
                  zoomControlsEnabled: false,
                  myLocationEnabled: true,
                  myLocationButtonEnabled: true,
                ),
        ),
        SizedBox(height: 8),
        Text(
          currentCity,
          style: TextStyle(color: Colors.white),
        ),
        Text(
          'Lat: ${currentPosition.latitude}, Lng: ${currentPosition.longitude}',
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
      ],
    );
  }
}
