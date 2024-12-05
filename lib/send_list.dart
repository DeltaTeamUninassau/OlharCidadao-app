import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart';
import 'package:olharcidadao_app/result.dart';

class SendList extends StatefulWidget {
  const SendList({super.key});

  @override
  State<SendList> createState() => _SendListState();
}

class _SendListState extends State<SendList> {
  final LatLng location = LatLng(-7.224688, -39.315518);
  String formattedDate;
  String formattedTime;

  _SendListState()
      : formattedDate = DateFormat('dd/MM/yyyy').format(DateTime.now()),
        formattedTime = DateFormat('HH:mm:ss').format(DateTime.now());

  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes da Localização'),
        backgroundColor: const Color.fromARGB(255, 37, 110, 105),
      ),
      body: Container(
        color: const Color.fromARGB(255, 37, 110, 105),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 350,
                  height: 135,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.black,
                      width: 0.5,
                    ),
                    color: Colors.white,
                  ),
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        size: 54,
                        color: Colors.red,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              formattedDate,
                              style: const TextStyle(fontSize: 26),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              formattedTime,
                              style: const TextStyle(fontSize: 26),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              '${location.latitude}, ${location.longitude}',
                              style: const TextStyle(
                                  fontSize: 16, color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView(
                  children: [
                    _buildListTile('assets/images/icon1.png',
                        'Cabos de energia elétrica e internet', 0),
                    _buildListTile(
                        'assets/images/icon2.png', 'Queda de árvore', 1),
                    _buildListTile(
                        'assets/images/icon3.png', 'Poda irregular', 2),
                    _buildListTile(
                        'assets/images/icon4.png', 'Vazamento de água', 3),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        width: 328,
        height: 48,
        child: FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Result()));
          },
          child: const Text(
            "Enviar",
            style: TextStyle(color: Color.fromARGB(255, 37, 110, 105)),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _buildListTile(String imagePath, String title, int index) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.white,
        child: Image.asset(
          imagePath,
          height: 24,
          width: 24,
        ),
      ),
      title: Text(title),
      textColor: selectedIndex == index ? Colors.white : Colors.black,
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
    );
  }
}

void main() {
  runApp(const SendList());
}
