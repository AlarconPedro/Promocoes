import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:cpf_cnpj_validator/cpf_validator.dart';
import 'package:promocoes/ui/widgets/loading.dart';

import '../../classes/classes.dart';
import '../widgets/campo_formulario.dart';

class LogarSistema extends StatefulWidget {
  Function(String) onClick;
  bool carregando;
  LogarSistema({super.key, required this.onClick, required this.carregando});

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
                widget.carregando
                    ? SizedBox(height: 60, child: loading())
                    : CampoFormulario(
                        label: 'CPF',
                        controller: cpfController,
                        mask: cpfFormatter,
                      ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: CupertinoButton(
                    onPressed: () {
                      if (cpfController.text.isEmpty ||
                          cpfController.text.length < 14) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Digite seu CPF'),
                            backgroundColor: Cores.vermelho,
                          ),
                        );
                        return;
                      }
                      if (CPFValidator.isValid(cpfController.text)) {
                        widget.onClick(cpfController.text);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('CPF inválido'),
                            backgroundColor: Cores.vermelho,
                          ),
                        );
                      }
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
