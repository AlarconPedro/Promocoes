import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../classes/classes.dart';
import '../widgets/campo_formulario.dart';

class LogarSistema extends StatefulWidget {
  Function onClick;
  LogarSistema({super.key, required this.onClick});

  @override
  State<LogarSistema> createState() => _LogarSistemaState();
}

class _LogarSistemaState extends State<LogarSistema> {
  double altura = 250;
  double largura = 400;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Center(
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
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: Text(
                  'Cadastro de Participantes',
                  style: TextStyle(
                    color: Cores.preto,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              CampoFormulario(label: 'CPF'),
              // CampoFormulario(label: 'Senha'),
              Padding(
                padding: const EdgeInsets.all(20),
                child: CupertinoButton(
                  onPressed: () {
                    widget.onClick();
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
    );
  }
}
