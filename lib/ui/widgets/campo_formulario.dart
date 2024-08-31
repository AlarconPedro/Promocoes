import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../classes/classes.dart';

class CampoFormulario extends StatelessWidget {
  String label;
  TextEditingController controller;
  TextInputFormatter mask;
  Function? onChanged;
  CampoFormulario({
    super.key,
    required this.label,
    required this.controller,
    required this.mask,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: TextField(
        controller: controller,
        inputFormatters: [mask],
        onChanged: (value) {
          if (onChanged != null) {
            onChanged!(value);
          } else {
            null;
          }
        },
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
