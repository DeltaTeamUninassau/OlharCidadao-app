import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:typed_data';

Future<void> sendEmail({
  required String to,
  required String subject,
  required String body,
  required String fileName,
  // required Uint8List fileContent,
}) async {
  final String? apiUrl = dotenv.env['BASE_URL'];
  // String fileBase64 = base64Encode(fileContent);

  final requestBody = {
    'to': to,
    'subject': subject,
    'body': body,
    'cid': 'enviodeimagem',
    // 'file': fileBase64,
    'fileName': fileName,
  };

  try {
    final response = await http.post(
      Uri.parse(apiUrl!),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(requestBody),
    );

    if (response.statusCode == 200) {
      print('E-mail enviado com sucesso!');
    } else {
      print('Erro ao enviar e-mail: ${response.body}');
    }
  } catch (e) {
    print('Erro ao enviar requisição: $e');
  }
}
