import 'package:flutter/material.dart';

class SendInfo extends StatelessWidget {
  final String formattedDate;
  final String formattedTime;
  final String latitude;
  final String longitude;

  const SendInfo({
    Key? key,
    required this.formattedDate,
    required this.formattedTime,
    required this.latitude,
    required this.longitude,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(
            formattedDate,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            formattedTime,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.location_on),
              SizedBox(width: 8),
              Text(
                '$latitude, $longitude',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
