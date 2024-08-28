import 'package:flutter/cupertino.dart';
import 'package:promocoes/models/participante_model.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../classes/classes.dart';
import '../widgets/campo_formulario.dart';

class CadastroParticipantes extends StatefulWidget {
  Function onClique;
  ParticipanteModel? participante;
  CadastroParticipantes({
    super.key,
    required this.onClique,
    required this.participante,
  });

  @override
  State<CadastroParticipantes> createState() => _CadastroParticipantesState();
}

class _CadastroParticipantesState extends State<CadastroParticipantes> {
  bool participanteCadastrado = false;

  MaskTextInputFormatter cpfFormatter = MaskTextInputFormatter(
    mask: '###.###.###-##',
    filter: {'#': RegExp(r'[0-9]')},
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.participante != null) {
      participanteCadastrado = true;
    }
  }

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
            child: participanteCadastrado
                ? Column(
                    children: [
                      const Text(
                        'Participante Cadastrado',
                        style: TextStyle(
                          color: Cores.preto,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Expanded(
                          child: Row(
                            children: [
                              const Text(
                                'Nome: ',
                                style: TextStyle(
                                  color: Cores.preto,
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                widget.participante!.parNome,
                                style: const TextStyle(
                                  color: Cores.preto,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    const Text(
                                      'cpf: ',
                                      style: TextStyle(
                                        color: Cores.preto,
                                        fontSize: 18,
                                      ),
                                    ),
                                    Text(
                                      cpfFormatter.maskText(
                                        widget.participante!.parCpf,
                                      ),
                                      style: const TextStyle(
                                        color: Cores.preto,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                  child: Row(
                                children: [
                                  const Text(
                                    'E-mail: ',
                                    style: TextStyle(
                                      color: Cores.preto,
                                      fontSize: 18,
                                    ),
                                  ),
                                  Text(
                                    widget.participante!.parEmail,
                                    style: const TextStyle(
                                      color: Cores.preto,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              )),
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                : Column(
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
                            CampoFormulario(
                              label: 'CPF',
                              controller: TextEditingController(),
                              mask: cpfFormatter,
                            ),
                            CampoFormulario(
                              label: 'Nome',
                              controller: TextEditingController(),
                              mask: MaskTextInputFormatter(),
                            ),
                            CampoFormulario(
                              label: 'E-mail',
                              controller: TextEditingController(),
                              mask: MaskTextInputFormatter(),
                            ),
                            CampoFormulario(
                              label: 'Telefone',
                              controller: TextEditingController(),
                              mask: MaskTextInputFormatter(
                                mask: '(##) #####-####',
                                filter: {'#': RegExp(r'[0-9]')},
                              ),
                            ),
                            CampoFormulario(
                              label: 'Cidade',
                              controller: TextEditingController(),
                              mask: MaskTextInputFormatter(),
                            ),
                            CampoFormulario(
                              label: 'UF',
                              controller: TextEditingController(),
                              mask: MaskTextInputFormatter(
                                mask: '##',
                                filter: {'#': RegExp(r'[A-Z]')},
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: CupertinoButton(
                          onPressed: () {
                            widget.onClique();
                          },
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 30),
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
