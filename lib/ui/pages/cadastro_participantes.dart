import 'package:flutter/cupertino.dart';

import '../../classes/classes.dart';
import '../widgets/campo_formulario.dart';

class CadastroParticipantes extends StatefulWidget {
  Function onClique;
  CadastroParticipantes({super.key, required this.onClique});

  @override
  State<CadastroParticipantes> createState() => _CadastroParticipantesState();
}

class _CadastroParticipantesState extends State<CadastroParticipantes> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Center(
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Container(
            width: 800,
            // width: largura,
            height: 650,
            // height: altura,
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
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 20,
                  ),
                  child: Text(
                    'Cadastro de Participantes',
                    style: TextStyle(
                      color: Cores.preto,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  child: Column(
                    children: [
                      CampoFormulario(label: 'CPF'),
                      CampoFormulario(label: 'Nome'),
                      CampoFormulario(label: 'E-mail'),
                      CampoFormulario(label: 'Telefone'),
                      CampoFormulario(label: 'Cidade'),
                      CampoFormulario(label: 'UF'),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: CupertinoButton(
                    onPressed: () {
                      widget.onClique();
                    },
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                    color: Cores.verde,
                    child: const Text(
                      'Cadastrar',
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
