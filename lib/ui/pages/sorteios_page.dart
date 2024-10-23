import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:promocoes/classes/funcoes_data.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../api/api_promocao.dart';
import '../../classes/classes.dart';
import '../../models/sorteios_model.dart';

class SorteiosPage extends StatefulWidget {
  Function onClique;

  SorteiosPage({super.key, required this.onClique});

  @override
  State<SorteiosPage> createState() => _SorteiosPageState();
}

class _SorteiosPageState extends State<SorteiosPage> {
  double altura = 650;
  double largura = 650;

  List<SorteiosModel> sorteios = [];

  bool carregando = false;

  buscarSorteios() async {
    setState(() => carregando = true);
    var response = await ApiPromocao().getSorteiosPromocao();
    if (response.statusCode == 200) {
      sorteios.clear();
      var decoded = json.decode(response.body);
      for (var item in decoded) {
        sorteios.add(SorteiosModel.fromJson(item));
      }
    }
    setState(() => carregando = false);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    buscarSorteios();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
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
                    'Sorteios',
                    style: TextStyle(
                      color: Cores.preto,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: carregando
                      ? const Center(child: CupertinoActivityIndicator())
                      : sorteios.isEmpty
                          ? const Center(
                              child: Text("Nennhum sorteio disponível !"))
                          : ListView.builder(
                              itemCount: sorteios.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Container(
                                            height: 45,
                                            decoration: BoxDecoration(
                                              color: Cores.branco,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              boxShadow: const [
                                                BoxShadow(
                                                    color: Cores.cinza,
                                                    blurRadius: 5,
                                                    offset: Offset(0, 2)),
                                              ],
                                            ),
                                            child: Center(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: 10,
                                                  vertical: 5,
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(sorteios[index]
                                                        .preNome),
                                                    Text(sorteios[index]
                                                        .parNome),
                                                    Text(FuncoesData
                                                        .dataFormatada(
                                                            sorteios[index]
                                                                .sorData)),
                                                  ],
                                                ),
                                              ),
                                            )),
                                      ),
                                      const SizedBox(width: 10),
                                      AbsorbPointer(
                                        absorbing:
                                            sorteios[index].proVideo.isEmpty
                                                ? true
                                                : false,
                                        child: Opacity(
                                          opacity:
                                              sorteios[index].proVideo.isEmpty
                                                  ? 0.5
                                                  : 1,
                                          child: CupertinoButton(
                                            color: Cores.vermelho,
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 5, horizontal: 30),
                                            onPressed: () => launchUrl(
                                                Uri.parse(
                                                    sorteios[index].proVideo)),
                                            // widget.onClique(),
                                            child: const Icon(
                                              CupertinoIcons
                                                  .play_rectangle_fill,
                                              color: Cores.branco,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                ),

                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: CupertinoButton(
                          color: Cores.vermelho,
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 30),
                          onPressed: () => widget.onClique(),
                          child: const Text('Voltar'),
                        ),
                      ),
                    ],
                  ),
                ),
                // Expanded(
                //   child: ListView.builder(
                //       itemCount: 10,
                //       itemBuilder: (context, index) {
                //         return const ListTile(
                //           title: Text(
                //               'Sorteio: item | Ocorrido: 00/00/2024 | Ganhador: Fulano de Tal'),
                //         );
                //       }),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
