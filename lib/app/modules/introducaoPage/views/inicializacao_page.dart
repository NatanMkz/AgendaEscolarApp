// ignore_for_file: non_constant_identifier_names, implementation_imports, unnecessary_import, avoid_unnecessary_containers, unnecessary_const

import 'package:agenda_escolar/app/modules/homePage/views/homePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class InicializacaoPage extends StatelessWidget {
  const InicializacaoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: _InicializaBody(context),
    );
  }

  _InicializaBody(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SizedBox(
      width: width,
      height: height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: height / 1.5,
            width: width,
            color: Colors.blue.shade900,
            child: Container(
              margin: const EdgeInsets.all(40),
              child: Image.asset('assets/images/agenda_escolar.png'),
            ),
          ),
          SizedBox(
            width: width,
            height: height * 0.3,
            child: _MensagemInicializador(context),
          )
        ],
      ),
    );
  }

  _MensagemInicializador(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Bem vindo',
          style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 13, 71, 161)),
        ),
        Container(
            margin: const EdgeInsets.only(top: 20),
            height: 50,
            width: width / 2,
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 13, 71, 163),
                borderRadius: const BorderRadius.all(Radius.circular(10))),
            child: MaterialButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
              child: const Text('Vamos Começar!',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white)),
            ))
      ],
    );
  }
}
