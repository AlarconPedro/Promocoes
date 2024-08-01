import 'package:flutter/material.dart';

import '../../classes/classes.dart';

class CampoFormulario extends StatelessWidget {
  String label;
  CampoFormulario({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextField(
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
