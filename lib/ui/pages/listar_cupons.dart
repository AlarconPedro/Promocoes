import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:promocoes/models/cupom_model.dart';

import '../../api/api_promocao.dart';
import '../../classes/classes.dart';
import '../../classes/formatar_texto.dart';
import '../widgets/loading.dart';

class ListarCupons extends StatefulWidget {
  Function onClique;
  Function voltar;
  int? codigoParticipante;
  ListarCupons({
    super.key,
    required this.onClique,
    required this.voltar,
    this.codigoParticipante,
  });

  @override
  State<ListarCupons> createState() => _ListarCuponsState();
}

class _ListarCuponsState extends State<ListarCupons> {
  double altura = 650;
  double largura = 650;

  bool carregando = false;

  List<CupomModel> cupons = [];

  TextEditingController cupomController = TextEditingController();

  buscarCupons(int codigoParticipante) async {
    setState(() => carregando = true);
    var response =
        await ApiPromocao().getParticipanteCupons(codigoParticipante);
    if (response.statusCode == 200) {
      cupons.clear();
      var decoded = json.decode(response.body);
      for (var item in decoded) {
        cupons.add(CupomModel.fromJson(item));
      }
    }
    setState(() => carregando = false);
    // var response = await ApiPromocao().getParticipanteCupons(codigoParticipante);
    // if (response.statusCode == 200) {
    //   var lista = json.decode(response.body);
    //   print(lista);
    // }
  }

  CupomModel alimentarDadosCupons() {
    return CupomModel(
      cupCodigo: 0,
      parCodigo: widget.codigoParticipante!,
      cupNumero: cupomController.text,
      proCodigo: Globais.codigoPromocao,
      cupSorteado: false,
      cupVendido: false,
    );
  }

  cadastrarCupon() async {
    setState(() => carregando = true);
    try {
      var response = await ApiPromocao().addCupons(alimentarDadosCupons());
      if (response.statusCode == 200) {
        setState(() {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(response.body),
              backgroundColor: Cores.verde,
            ),
          );
          // widget.onClique();
        });
        buscarCupons(widget.codigoParticipante!);
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
    if (widget.codigoParticipante != null) {
      buscarCupons(widget.codigoParticipante!);
    }
  }

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
                          inputFormatters: [FormatarTexto()],
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
                          if (cupomController.text.isNotEmpty) {
                            cadastrarCupon();
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Informe o número do cupom'),
                                backgroundColor: Cores.vermelho,
                              ),
                            );
                          }
                          // widget.onClique();
                          // Navigator.pop(context);
                          // _pageController.animateToPage(
                          //   1,
                          //   duration: const Duration(milliseconds: 500),
                          //   curve: Curves.easeInOut,
                          // );
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
              // CampoFormulario(label: 'Cupom'),
              Expanded(
                child: carregando
                    ? loading()
                    : ListView.builder(
                        itemCount: cupons.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            child: Container(
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Cores.branco,
                                boxShadow: [
                                  BoxShadow(
                                    color: Cores.cinza,
                                    blurRadius: 3,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Icon(CupertinoIcons.tickets),
                                    Text(cupons[index].cupNumero.toString()),
                                    Container(),
                                    // const Icon(CupertinoIcons.chevron_forward),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CupertinoButton(
                      onPressed: () {
                        widget.voltar();
                      },
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 30),
                      color: Cores.vermelho,
                      child: const Text(
                        'Voltar',
                        style: TextStyle(
                          color: Cores.branco,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    CupertinoButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 30),
                      color: Cores.verde,
                      child: const Text(
                        'Ok',
                        style: TextStyle(
                          color: Cores.branco,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
