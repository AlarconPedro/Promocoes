import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:promocoes/classes/layouts.dart';

import '../../classes/classes.dart';

class BotaoContainer extends StatefulWidget {
  String titulo;
  IconData icone;
  Function onTap;

  BotaoContainer({
    super.key,
    required this.titulo,
    required this.icone,
    required this.onTap,
  });

  @override
  State<BotaoContainer> createState() => _BotaoContainerState();
}

class _BotaoContainerState extends State<BotaoContainer> {
  bool hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: InkWell(
        onTap: () {
          widget.onTap();
          // Navigator.pushNamed(context, '/cadastro');
        },
        onHover: (value) {
          setState(() {
            hover = value;
          });
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          padding: EdgeInsets.only(bottom: hover ? 35 : 0),
          width: Globais.layout == Layout.mobile
              ? 100
              : Globais.layout == Layout.smartphone
                  ? 120
                  : Globais.layout == Layout.tablet
                      ? 180
                      : 210,
          height: Globais.layout == Layout.mobile
              ? 90
              : Globais.layout == Layout.smartphone
                  ? 100
                  : Globais.layout == Layout.tablet
                      ? 120
                      : 150,
          decoration: BoxDecoration(
            color: Cores.marrom,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              // color: Cores.branco,
              color: Cores.marromEscuro,
              width: 2,
            ),
            boxShadow: hover
                ? [
                    // const BoxShadow(
                    //   color: Cores.marrom,
                    //   blurRadius: 15,
                    // ),
                    const BoxShadow(
                      color: Cores.marrom,
                      blurRadius: 15,
                      spreadRadius: 5,
                    ),
                  ]
                : null,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                widget.icone,
                // CupertinoIcons.person_add_solid,
                color: Cores.branco,
                size: Globais.layout == Layout.mobile
                    ? 20
                    : Globais.layout == Layout.smartphone
                        ? 30
                        : Globais.layout == Layout.tablet
                            ? 40
                            : 50,
              ),
              const SizedBox(height: 10),
              Text(
                widget.titulo,
                // 'Cadastrar-se',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Cores.branco,
                  fontSize: Globais.layout == Layout.mobile
                      ? 14
                      : Globais.layout == Layout.smartphone
                          ? 16
                          : Globais.layout == Layout.tablet
                              ? 18
                              : 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
