// ignore_for_file: file_names, unnecessary_import, prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_new, unused_field, use_key_in_widget_constructors, deprecated_member_use, unused_element, unused_import, sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:agenda_escolar/app/data/materia.dart';
import 'package:agenda_escolar/app/modules/agendamentosPage/views/agendamentosPage.dart';
import 'package:agenda_escolar/app/modules/homePage/views/homePage.dart';
import 'package:agenda_escolar/app/modules/materiasPage/controllers/materiasController.dart';
import 'package:agenda_escolar/app/modules/professorPage/views/professorPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:agenda_escolar/globais.dart' as globais;

class MateriasPage extends StatefulWidget {
  //MateriasPage({Key? key}) : super(key: key);
  MateriasPage() : super();
  final String title = 'Materias';

  @override
  State<MateriasPage> createState() => _MateriasPageState();
}

class _MateriasPageState extends State<MateriasPage> {
  List<Materia> materias = globais.materias;
  bool request = false;
  late GlobalKey<ScaffoldState> _scaffoldKey;
  // controller for the First Name TextField we are going to create.
  late TextEditingController _firstNameController;
  // controller for the Last Name TextField we are going to create.
  late TextEditingController _lastNameController;
  late Materia _selectedEmployee;
  late bool _isUpdating;
  late String _titleProgress;

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    //materias.add(new Materia('', 'Natan'));
    _isUpdating = false;
    _titleProgress = widget.title;
    _scaffoldKey = GlobalKey(); // key to get the context to show a SnackBar
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    //_getEmployees();
    super.initState();
  }

  // Method to update title in the AppBar Title
  _showProgress(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: CircularProgressIndicator(
        backgroundColor: Colors.white12,
        color: Color.fromARGB(255, 13, 71, 163),
      ),
    );
  }

  _showSnackBar(context, message) {
    _scaffoldKey.currentState!.showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Materias'),
        backgroundColor: Color.fromARGB(255, 13, 71, 163),
      ),
      body: request == false ? _body(context) : _showProgress(context),
      floatingActionButton: FloatingActionButton(
        //Floating action button on Scaffold
        onPressed: () {
          popUpCriarMateria();
        },
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

  void popUpCriarMateria() {
    showDialog(
      context: context,
      builder: (_) {
        var messageController = TextEditingController();
        return AlertDialog(
          title: Text('Cadastrar Materia'),
          content: Container(
            height: 100,
            width: 200,
            child: ListView(
              shrinkWrap: true,
              children: [
                TextFormField(
                  controller: messageController,
                  decoration: InputDecoration(hintText: 'Materia'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                // Send them to your email maybe?
                var materia = messageController.text;
                _criarMateria(materia);
                Navigator.pop(context);
              },
              child: Text('Cadastrar'),
            ),
          ],
        );
      },
    );
  }

  void popUpEditarMateria(int id) {
    showDialog(
      context: context,
      builder: (_) {
        var messageController = TextEditingController();
        return AlertDialog(
          title: Text('Editar Materia'),
          content: Container(
            height: 100,
            width: 200,
            child: ListView(
              shrinkWrap: true,
              children: [
                TextFormField(
                  controller: messageController,
                  decoration: InputDecoration(hintText: 'Materia'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                var materia = messageController.text;
                _editarMateria(id, materia);
                Navigator.pop(context);
              },
              child: Text('Editar'),
            ),
          ],
        );
      },
    );
  }

  _criarMateria(String materia) {
    setState(() {
      request = true;
    });
    //int ide = int.tryParse(id)!.toInt();
    var create = MateriasRequisitor().criarMateria(materia);
    //var createService = Services().addEmployee('0', 'nome');
    create.then((value) {
      atualizaTabela();
      setState(() {
        request = false;
      });
    });
  }

  _editarMateria(int id, String materia) {
    setState(() {
      request = true;
    });
    //int ide = int.tryParse(id)!.toInt();
    var create = MateriasRequisitor().editarMateria(id, materia);
    //var createService = Services().addEmployee('0', 'nome');
    create.then((value) {
      atualizaTabela();
      setState(() {
        request = false;
      });
    });
  }

  _deletarMateria(int id) {
    setState(() {
      request = true;
    });
    //int ide = int.tryParse(id)!.toInt();
    var create = MateriasRequisitor().materiasRemover(id);
    //var createService = Services().addEmployee('0', 'nome');
    create.then((value) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Materia removida com Sucesso')));
      atualizaTabela();
      setState(() {
        request = false;
      });
    });
  }

  atualizaTabela() {
    var className = MateriasRequisitor().materiasBuscar();
    className.then((className) {
      // ignore: unrelated_type_equality_checks
      if (className != 0) {
        setState(() {
          materias = className;
        });
        //materias = globais.materias;
      }
    });
  }

  _body(BuildContext context) {
    //atualizaTabela();
    return Container(
        margin: EdgeInsets.only(top: 20, bottom: 35),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: DataTable(
            columns: [
              //DataColumn(label: Text('ID')),
              DataColumn(label: Text('Nome')),
              DataColumn(label: Icon(Icons.edit_rounded)),
              DataColumn(label: Icon(Icons.delete))
            ],
            rows: materias
                .map((e) => DataRow(
                      cells: [
                        DataCell(
                          Text(e.nome),
                          onTap: () {},
                        ),
                        DataCell(IconButton(
                          icon: Icon(Icons.edit_rounded),
                          onPressed: () {
                            popUpEditarMateria(e.id);
                          },
                        )),
                        DataCell(IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            _deletarMateria(e.id);
                          },
                        ))
                      ],
                    ))
                .toList(),
          ),
        ));
  }
}
