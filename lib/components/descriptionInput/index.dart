import 'package:flutter/material.dart';

@immutable
class DescriptionInput extends StatelessWidget {
  final TextEditingController controller;
  final int maxLength;

  const DescriptionInput({
    Key? key,
    required this.controller,
    required this.maxLength,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLength: maxLength,
      maxLines: 6,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: 'Digite uma pequena descrição do serviço',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
