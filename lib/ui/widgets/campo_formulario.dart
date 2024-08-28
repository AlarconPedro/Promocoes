import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../classes/classes.dart';

class CampoFormulario extends StatelessWidget {
  String label;
  TextEditingController controller;
  TextInputFormatter mask;
  CampoFormulario(
      {super.key,
      required this.label,
      required this.controller,
      required this.mask});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: controller,
        inputFormatters: [mask],
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(
            color: Cores.preto,
            fontSize: 18,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
