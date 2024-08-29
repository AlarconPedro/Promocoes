import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:promocoes/models/cupom_model.dart';

import '../../api/api_promocao.dart';
import '../../classes/classes.dart';

class ListarCupons extends StatefulWidget {
  Function onClique;
  int? codigoParticipante;
  ListarCupons({
    super.key,
    required this.onClique,
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

  buscarCupons(int codigoParticipante) async {
    setState(() => carregando = true);
    var response =
        await ApiPromocao().getParticipanteCupons(codigoParticipante);
    if (response.statusCode == 200) {
      var cupons = json.decode(response.body);
      for (var item in cupons) {
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
                          widget.onClique();
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
                child: ListView.builder(
                    itemCount: cupons.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(cupons[index].cupNumero),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
