import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../classes/classes.dart';

class SorteiosPage extends StatefulWidget {
  Function onClique;

  SorteiosPage({super.key, required this.onClique});

  @override
  State<SorteiosPage> createState() => _SorteiosPageState();
}

class _SorteiosPageState extends State<SorteiosPage> {
  double altura = 650;
  double largura = 650;

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
                const Expanded(
                    child: Center(
                  child: Text("Nennhum sorteio disponível !"),
                )),
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
