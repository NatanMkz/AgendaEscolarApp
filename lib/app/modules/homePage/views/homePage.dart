// ignore_for_file: unnecessary_import, prefer_const_constructors_in_immutables, prefer_const_constructors, unnecessary_new, unused_import

import 'package:agenda_escolar/app/data/agendamento.dart';
import 'package:agenda_escolar/app/modules/agendamentosPage/views/agendamentosPage.dart';
import 'package:agenda_escolar/app/modules/materiasPage/controllers/materiasController.dart';
import 'package:agenda_escolar/app/modules/materiasPage/views/materiasPage.dart';
import 'package:agenda_escolar/app/modules/professorPage/views/professorPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:agenda_escolar/globais.dart' as globais;

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                requisitor(context);
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

  requisitor(BuildContext context) {
    var className = MateriasRequisitor().materiasBuscar();
    className.then((className) {
      // ignore: unrelated_type_equality_checks
      if (className != 0) {
        globais.materias = className;
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MateriasPage()));
      }
    });
    CircularProgressIndicator();
  }

  _body(BuildContext context) {
    return Container(
      height: 400,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(25))),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 15.0,
            mainAxisSpacing: 15.0,
            padding: EdgeInsets.all(35),
            children: [
              _materias(context),
              _professores(context),
              _agendamentos(context),
              _antecedentes(context)
            ],
          )
        ],
      ),
    );
  }

  _materias(BuildContext context) {
    return Container(
        height: 50,
        width: 20,
        margin: EdgeInsets.all(5),
        decoration: new BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.blue.shade400),
        child: MaterialButton(
            color: Colors.blue.shade400,
            onPressed: () {},
            child: Text(
              'Matérias',
              style: TextStyle(color: Colors.white, fontSize: 20),
              //fontFamily: 'Ancient_Medium'),
            )));
  }

  _professores(BuildContext context) {
    return Container(
      height: 50,
      width: 20,
      margin: EdgeInsets.all(5),
      decoration: new BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.deepOrange.shade300),
      child: MaterialButton(
        color: Colors.deepOrange.shade300,
        onPressed: () {
          // Navigator.push(
          //     context, MaterialPageRoute(builder: (context) => ClassRPG()));
        },
        child: Text(
          'Professores',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }

  _agendamentos(BuildContext context) {
    return Container(
      height: 50,
      width: 20,
      margin: EdgeInsets.all(5),
      decoration: new BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.green.shade400),
      child: MaterialButton(
        color: Colors.green.shade400,
        onPressed: () {
          // Navigator.push(
          //     context, MaterialPageRoute(builder: (context) => ClassRPG()));
        },
        child: Text('Agendamentos',
            style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontFamily: 'Ancient_Medium')),
      ),
    );
  }

  _antecedentes(BuildContext context) {
    return Container(
      height: 50,
      width: 20,
      margin: EdgeInsets.all(5),
      decoration: new BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.deepPurple),
      child: MaterialButton(
        color: Colors.deepPurple,
        onPressed: () {
          // Navigator.push(
          //     context, MaterialPageRoute(builder: (context) => ClassRPG()));
        },
        child: Text(
          'Background',
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontFamily: 'Ancient_Medium'),
        ),
      ),
    );
  }
}
