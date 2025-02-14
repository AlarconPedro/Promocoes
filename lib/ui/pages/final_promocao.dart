import 'package:flutter/material.dart';
import 'package:promocoes/classes/classes.dart';

class FinalPromocao extends StatelessWidget {
  const FinalPromocao({super.key});

  verificaTamanhoTela(BuildContext context) {
    if (MediaQuery.of(context).size.width < 600) {
      return 20;
    } else {
      return 34;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Cores.branco,
      body: Stack(
        children: <Widget>[
          Opacity(
            opacity: 0.05,
            child: Center(
              child: Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/caminho.jpg'),
                        fit: BoxFit.cover)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text('Muito obrigado !',
                      style: TextStyle(
                          fontSize: verificaTamanhoTela(context),
                          fontWeight: FontWeight.bold)),
                  const Text(
                      'O Centro catequético agradece a sua participação.'),
                ],
              ),
            ),
          ),
        ],
      ),
      // appBar: AppBar(title: const Text('Promoção')),
      // body: Opacity(
      //   opacity: 0.2,
      //   child: Container(
      //     decoration: BoxDecoration(
      //       image: DecorationImage(
      //           image: AssetImage('images/caminho.jpg'), fit: BoxFit.cover),
      //     ),
      //     child: Center(
      //       child: Column(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: <Widget>[
      //           Text('Obrigado por participar desta ação !',
      //               style:
      //                   TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      //           Text('O Centro catequético agradece a sua participação.'),
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}
