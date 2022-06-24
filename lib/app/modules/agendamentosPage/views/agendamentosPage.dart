// ignore_for_file: file_names, unnecessary_import, prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:agenda_escolar/app/modules/homePage/views/homePage.dart';
import 'package:agenda_escolar/app/modules/materiasPage/views/materiasPage.dart';
import 'package:agenda_escolar/app/modules/professorPage/views/professorPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AgendamentosPage extends StatefulWidget {
  AgendamentosPage({Key? key}) : super(key: key);

  @override
  State<AgendamentosPage> createState() => _AgendamentosPageState();
}

class _AgendamentosPageState extends State<AgendamentosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(context),
      floatingActionButton: FloatingActionButton(
        //Floating action button on Scaffold
        onPressed: () {},
        child: Icon(Icons.add), //icon inside button
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      //floating action button position to center

      bottomNavigationBar: BottomAppBar(
        //bottom navigation bar on scaffold
        color: Color.fromARGB(255, 13, 71, 163),
        //shape: CircularNotchedRectangle(), //shape of notch

        child: Row(
          //children inside bottom appbar
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.house_rounded,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
            ),
            IconButton(
              icon: Icon(
                Icons.note_alt,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MateriasPage()));
              },
            ),
            IconButton(
              icon: Icon(
                Icons.campaign_outlined,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AgendamentosPage()));
              },
            ),
            IconButton(
              icon: Icon(
                Icons.school_rounded,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfessorPage()));
              },
            ),
          ],
        ),
      ),
    );
  }

  _body(BuildContext context) {}
}
