import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:olharcidadao_app/api/email_api.dart';

class SendList extends StatefulWidget {
  const SendList({super.key});

  @override
  State<SendList> createState() => _SendListState();
}

class _SendListState extends State<SendList> {
  int? _selectedIssue;
  double? latitude;
  double? longitude;
  String? description;

  @override
  void initState() {
    super.initState();
    // A lógica de inicialização que não depende do contexto pode continuar aqui
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Recupera os argumentos passados
    final Map<String, dynamic> arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    // Atribui os valores aos campos da classe
    setState(() {
      latitude = arguments['latitude'];
      longitude = arguments['longitude'];
      description = arguments['description'];
    });
  }

  final List<Map<String, dynamic>> _issues = [
    {
      'icon': Icons.electrical_services,
      'text': 'Cabos de energia eletrica e internet',
      'email': 'email1@example.com',
      'subject': 'Problema com cabos de energia',
    },
    {
      'icon': Icons.nature,
      'text': 'Queda de arvore',
      'email': 'email2@example.com',
      'subject': 'Queda de árvore em área pública',
    },
    {
      'icon': Icons.content_cut,
      'text': 'Poda irregular',
      'email': 'email3@example.com',
      'subject': 'Poda irregular de árvores',
    },
    {
      'icon': Icons.water_damage,
      'text': 'Vazamento de água',
      'email': 'email4@example.com',
      'subject': 'Vazamento de água em rua',
    },
  ];

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('dd/MM/yyyy').format(DateTime.now());
    String formattedTime = DateFormat('HH:mm:ss').format(DateTime.now());

    return Scaffold(
      backgroundColor: Color(0xFF256E69),
      appBar: AppBar(
        title: const Text('Selecione o órgão'),
        backgroundColor: Color(0xFF256E69),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      formattedDate,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      formattedTime,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
                    SizedBox(height: 8),
                    Text(
                      'Descrição: ${description ?? "Carregando..."}',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),

              // Issue list
              Expanded(
                child: ListView.builder(
                  itemCount: _issues.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(
                          _issues[index]['icon'],
                          color: Color(0xFF256E69),
                        ),
                      ),
                      title: Text(
                        _issues[index]['text'],
                        style: TextStyle(color: Colors.white),
                      ),
                      trailing: Radio<int>(
                        value: index,
                        groupValue: _selectedIssue,
                        activeColor: Colors.white,
                        onChanged: (int? value) {
                          setState(() {
                            _selectedIssue = value;
                          });
                        },
                      ),
                    );
                  },
                ),
              ),

              // Send Button
              ElevatedButton(
                onPressed: () async {
                  if (_selectedIssue != null) {
                    String selectedEmail = _issues[_selectedIssue!]['email'];
                    String subject = _issues[_selectedIssue!]['subject'];
                    String body =
                        'Um novo relatório foi enviado sobre o problema: ${_issues[_selectedIssue!]['text']}';
                    String fileName = 'imagem.jpg';

                    await sendEmail(
                      to: selectedEmail,
                      subject: subject,
                      body: body,
                      fileName: fileName,
                    );

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('E-mail enviado com sucesso!'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                            'Por favor, selecione um problema para enviar o e-mail.'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  minimumSize: Size(double.infinity, 50),
                ),
                child: Text(
                  'Enviar',
                  style: TextStyle(color: Color(0xFF256E69), fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
