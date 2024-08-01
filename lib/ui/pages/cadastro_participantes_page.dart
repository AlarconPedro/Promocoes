import 'package:flutter/material.dart';

class CadastroParticipantes extends StatefulWidget {
  const CadastroParticipantes({super.key});

  @override
  State<CadastroParticipantes> createState() => _CadastroParticipantesState();
}

class _CadastroParticipantesState extends State<CadastroParticipantes> {
  @override
  Widget build(BuildContext context) {
    return const Card(
      child: Center(child: Text("Cadastro de Participantes")),
    );
  }
}
