import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:promocoes/classes/funcoes_data.dart';
import 'package:promocoes/models/cupom_model.dart';
import 'package:promocoes/models/participante_model.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:promocoes/ui/widgets/loading.dart';

import '../../api/api_promocao.dart';
import '../../classes/classes.dart';
import '../widgets/campo_formulario.dart';

class CadastroParticipantes extends StatefulWidget {
  Function onClique;
  Function listarCupons;
  ParticipanteModel? participante;
  String cpf;
  CadastroParticipantes({
    super.key,
    required this.onClique,
    required this.participante,
    required this.listarCupons,
    required this.cpf,
  });

  @override
  State<CadastroParticipantes> createState() => _CadastroParticipantesState();
}

class _CadastroParticipantesState extends State<CadastroParticipantes> {
  bool participanteCadastrado = false;
  bool carregando = false;

  MaskTextInputFormatter cpfFormatter = MaskTextInputFormatter(
    mask: '###.###.###-##',
    filter: {'#': RegExp(r'[0-9]')},
  );

  TextEditingController cpfController = TextEditingController();
  TextEditingController nomeController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController telefoneController = TextEditingController();
  TextEditingController cidadeController = TextEditingController();
  TextEditingController ufController = TextEditingController();
  TextEditingController enderecoController = TextEditingController();
  TextEditingController dataNascimentoController = TextEditingController();
  TextEditingController cupomController = TextEditingController();

  ParticipanteModel alimentarDadosParticipantes() {
    return ParticipanteModel(
      parCidade: cidadeController.text,
      parCpf: cpfController.text.replaceAll(".", "").replaceAll("-", ""),
      parEmail: emailController.text,
      parEndereco: enderecoController.text,
      parCodigo: 0,
      parDataNasc: FuncoesData.stringToDateTime(dataNascimentoController.text),
      parFone: telefoneController.text
          .replaceAll("(", "")
          .replaceAll(")", "")
          .replaceAll("-", ""),
      parNome: nomeController.text,
      parUf: ufController.text,
      proCodigo: Globais.codigoPromocao,
    );
  }

  CupomModel alimentarDadosCupons() {
    return CupomModel(
      cupCodigo: 0,
      parCodigo: widget.participante!.parCodigo,
      cupNumero: cupomController.text,
      proCodigo: Globais.codigoPromocao,
      cupSorteado: false,
      cupVendido: false,
    );
  }

  alimentarCampos(ParticipanteModel participante) {
    cpfController.text = participante.parCpf;
    nomeController.text = participante.parNome;
    emailController.text = participante.parEmail;
    telefoneController.text = participante.parFone;
    cidadeController.text = participante.parCidade;
    ufController.text = participante.parUf;
    enderecoController.text = participante.parEndereco;
    dataNascimentoController.text = participante.parDataNasc;
  }

  cadastrarParticipante() async {
    setState(() => carregando = true);
    try {
      var response =
          await ApiPromocao().addParticipante(alimentarDadosParticipantes());
      if (response.statusCode == 200) {
        setState(() {
          participanteCadastrado = true;
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Participante cadastrado com sucesso'),
              backgroundColor: Cores.verde,
            ),
          );
          // widget.onClique();
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Erro ao cadastrar participante'),
            backgroundColor: Cores.vermelho,
          ),
        );
      }
    } catch (e) {
      print(e);
    }
    setState(() => carregando = false);
  }

  cadastrarCupon() async {
    setState(() => carregando = true);
    try {
      var response = await ApiPromocao().addCupons(alimentarDadosCupons());
      if (response.statusCode == 200) {
        setState(() {
          participanteCadastrado = true;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(response.body),
              backgroundColor: Cores.verde,
            ),
          );
          // widget.onClique();
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(response.body),
            backgroundColor: Cores.vermelho,
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Erro ao cadastrar cupom'),
          backgroundColor: Cores.vermelho,
        ),
      );
    }
    setState(() => carregando = false);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.participante != null) {
      participanteCadastrado = true;
      alimentarCampos(widget.participante!);
    } else {
      cpfController.text = widget.cpf;
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                participanteCadastrado
                    ? carregando
                        ? Expanded(child: loading())
                        : Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Column(
                              children: [
                                const Text(
                                  'Participante Cadastrado',
                                  style: TextStyle(
                                    color: Cores.preto,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 5,
                                    horizontal: 10,
                                  ),
                                  child: Expanded(
                                    child: Row(
                                      children: [
                                        const Text(
                                          'CPF: ',
                                          style: TextStyle(
                                            color: Cores.preto,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          cpfFormatter
                                              .maskText(cpfController.text),
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
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 5,
                                    horizontal: 10,
                                  ),
                                  child: Expanded(
                                    child: Row(
                                      children: [
                                        const Text(
                                          'Nome: ',
                                          style: TextStyle(
                                            color: Cores.preto,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          nomeController.text,
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
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 5,
                                    horizontal: 10,
                                  ),
                                  child: Expanded(
                                    child: Row(
                                      children: [
                                        const Text(
                                          'Data Nascimento: ',
                                          style: TextStyle(
                                            color: Cores.preto,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          FuncoesData.dataFormatada(
                                              dataNascimentoController.text),
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
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 10),
                                  child: Expanded(
                                    child: Row(
                                      children: [
                                        const Text(
                                          'Endereço: ',
                                          style: TextStyle(
                                            color: Cores.preto,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          enderecoController.text,
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
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 10),
                                  child: Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'E-mail: ',
                                          style: TextStyle(
                                            color: Cores.preto,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          emailController.text,
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
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  child: Expanded(
                                    child: Row(
                                      children: [
                                        const Text(
                                          'Telefone: ',
                                          style: TextStyle(
                                            color: Cores.preto,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          cpfFormatter.maskText(
                                              telefoneController.text),
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
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  child: Expanded(
                                    child: Row(
                                      children: [
                                        const Text(
                                          'Cidade: ',
                                          style: TextStyle(
                                            color: Cores.preto,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          cidadeController.text,
                                          style: const TextStyle(
                                            color: Cores.preto,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  child: Expanded(
                                    child: Row(
                                      children: [
                                        const Text(
                                          'UF: ',
                                          style: TextStyle(
                                            color: Cores.preto,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          ufController.text,
                                          style: const TextStyle(
                                            color: Cores.preto,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                    : Expanded(
                        child: carregando
                            ? loading()
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
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Opacity(
                                                opacity: 0.5,
                                                child: AbsorbPointer(
                                                  absorbing: true,
                                                  child: CampoFormulario(
                                                    label: 'CPF',
                                                    controller: cpfController,
                                                    mask: cpfFormatter,
                                                    onChanged: (value) {
                                                      if (value.length == 14) {
                                                        setState(() {
                                                          carregando = true;
                                                        });
                                                        ApiPromocao()
                                                            .getDadosParticipante(
                                                                value)
                                                            .then(
                                                                (participante) {
                                                          if (participante !=
                                                              null) {
                                                            setState(() {
                                                              participanteCadastrado =
                                                                  true;
                                                              alimentarCampos(
                                                                ParticipanteModel
                                                                    .fromJson(
                                                                  json.decode(
                                                                      participante
                                                                          .body),
                                                                ),
                                                              );
                                                            });
                                                          }
                                                        });
                                                        setState(() {
                                                          carregando = false;
                                                        });
                                                      }
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: CampoFormulario(
                                                label: 'Nome',
                                                controller: nomeController,
                                                mask: MaskTextInputFormatter(),
                                              ),
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: CampoFormulario(
                                                label: 'Data Nascimento',
                                                controller:
                                                    dataNascimentoController,
                                                mask: MaskTextInputFormatter(
                                                  mask: '##/##/####',
                                                  filter: {
                                                    '#': RegExp(r'[0-9]')
                                                  },
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: CampoFormulario(
                                                label: 'Endereço',
                                                controller: enderecoController,
                                                mask: MaskTextInputFormatter(),
                                              ),
                                            ),
                                          ],
                                        ),
                                        CampoFormulario(
                                          label: 'E-mail',
                                          controller: emailController,
                                          mask: MaskTextInputFormatter(),
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: CampoFormulario(
                                                label: 'Telefone',
                                                controller: telefoneController,
                                                mask: MaskTextInputFormatter(
                                                  mask: '(##) #####-####',
                                                  filter: {
                                                    '#': RegExp(r'[0-9]')
                                                  },
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: CampoFormulario(
                                                label: 'Cidade',
                                                controller: cidadeController,
                                                mask: MaskTextInputFormatter(),
                                              ),
                                            ),
                                            Expanded(
                                              child: CampoFormulario(
                                                label: 'UF',
                                                controller: ufController,
                                                mask: MaskTextInputFormatter(
                                                  mask: '##',
                                                  filter: {
                                                    '#': RegExp(r'[A-Z]')
                                                  },
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: CupertinoButton(
                                      onPressed: () {
                                        // widget.onClique();
                                        if (nomeController.text.isEmpty ||
                                            cpfController.text.isEmpty ||
                                            dataNascimentoController
                                                .text.isEmpty ||
                                            enderecoController.text.isEmpty ||
                                            emailController.text.isEmpty ||
                                            telefoneController.text.isEmpty ||
                                            cidadeController.text.isEmpty ||
                                            ufController.text.isEmpty) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                              content: Text(
                                                  'Preencha todos os campos'),
                                              backgroundColor: Cores.vermelho,
                                            ),
                                          );
                                          return;
                                        } else {
                                          cadastrarParticipante();
                                        }
                                      },
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5, horizontal: 30),
                                      color: Cores.verde,
                                      child: carregando
                                          ? loading(cor: Cores.branco)
                                          : const Text(
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
                AbsorbPointer(
                  absorbing: !participanteCadastrado,
                  child: Opacity(
                    opacity: !participanteCadastrado ? 0.5 : 1,
                    child: Column(
                      children: [
                        const Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          child: Text(
                            'Cadastro de Cupons',
                            style: TextStyle(
                              color: Cores.preto,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: SizedBox(
                                  height: 50,
                                  child: TextField(
                                    controller: cupomController,
                                    decoration: InputDecoration(
                                      labelText: "Cupom",
                                      labelStyle: const TextStyle(
                                        color: Cores.preto,
                                        fontSize: 18,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CupertinoButton(
                                  onPressed: () {
                                    cadastrarCupon();
                                  },
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 30),
                                  color: Cores.verde,
                                  child: const Text(
                                    'Adicionar',
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
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 10,
                              ),
                              child: TextButton(
                                onPressed: () {
                                  widget.listarCupons();
                                },
                                child: const Text(
                                  "Meus Cupons >",
                                  style: TextStyle(color: Cores.preto),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 10,
                              ),
                              child: CupertinoButton(
                                color: Cores.vermelho,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 5,
                                  horizontal: 30,
                                ),
                                onPressed: () {
                                  widget.onClique();
                                },
                                child: const Text(
                                  "Voltar",
                                  style: TextStyle(color: Cores.branco),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
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
