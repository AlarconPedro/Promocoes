import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:promocoes/api/api_promocao.dart';
import 'package:promocoes/models/participante_model.dart';

import '../../classes/classes.dart';
import '../widgets/campo_formulario.dart';

class LogarSistema extends StatefulWidget {
  Function(String) onClick;
  LogarSistema({super.key, required this.onClick});

  @override
  State<LogarSistema> createState() => _LogarSistemaState();
}

class _LogarSistemaState extends State<LogarSistema> {
  double altura = 250;
  double largura = 400;

  TextEditingController cpfController = TextEditingController();

  MaskTextInputFormatter cpfFormatter = MaskTextInputFormatter(
    mask: '###.###.###-##',
    filter: {'#': RegExp(r'[0-9]')},
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Center(
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            width: largura,
            height: altura,
            decoration: BoxDecoration(
              color: Cores.branco,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Cores.cinza,
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  child: Text(
                    'Digite seu CPF',
                    style: TextStyle(
                      color: Cores.preto,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                CampoFormulario(
                  label: 'CPF',
                  controller: cpfController,
                  mask: cpfFormatter,
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: CupertinoButton(
                    onPressed: () {
                      widget.onClick(cpfController.text);
                    },
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                    color: Cores.verde,
                    child: const Text(
                      'Entrar',
                      style: TextStyle(
                        color: Cores.branco,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
