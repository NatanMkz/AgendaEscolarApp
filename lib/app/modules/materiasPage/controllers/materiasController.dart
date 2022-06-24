// ignore_for_file: curly_braces_in_flow_control_structures, unnecessary_new, unused_import, prefer_collection_literals, avoid_print, avoid_web_libraries_in_flutter

import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:agenda_escolar/app/data/materia.dart';
//import 'package:masterdice/models/classes.dart';
import 'dart:convert';
import 'package:agenda_escolar/globais.dart' as globais;

class MateriasRequisitor {
  //HttpClient _http = HttpClient();

  Future<List<Materia>> materiasBuscar() async {
    try {
      var url = "https://agenda-escolar-api.herokuapp.com/Materia/buscar";
      var urldeteste = "https://localhost:7217/Materia/buscar";
      // ignore: close_sinks
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        //var lista = response.body;
        //Map<String, dynamic> parsed = jsonDecode(lista);
        List<Materia> materias = parseResponse(response.body);

        return materias;
      } else
        throw 'Failed';
    } catch (ex) {
      throw new Exception(ex);
    }
  }

  Future<String> criarMateria(String nome) async {
    try {
      var url = "https://agenda-escolar-api.herokuapp.com/Materia/adicionar";
      var urldeteste = "https://localhost:7217/Materia/adicionar";
      Uri uri = Uri.parse(url);
      const headers = {"content-type": "application/json"};
      final msg = jsonEncode({
        "nome": nome,
      });
      final response = await http.post(uri, headers: headers, body: msg);
      print('addEmployee Response: ${response.body}');
      if (200 == response.statusCode) {
        print('materia criada com sucesso');
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      return "Não foi possivel criar a materia";
    }
  }

  Future<String> editarMateria(int id, String nome) async {
    try {
      var url = "https://agenda-escolar-api.herokuapp.com/Materia/editar";
      var urldeteste = "https://localhost:7217/Materia/adicionar";
      Uri uri = Uri.parse(url);
      const headers = {"content-type": "application/json"};
      final msg = jsonEncode({
        "id": id,
        "nome": nome,
      });
      final response = await http.put(uri, headers: headers, body: msg);
      print('Retorno Editar: ${response.body}');
      if (200 == response.statusCode) {
        print('materia editada com sucesso');
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      return "Não foi possivel editar a materia";
    }
  }

  Future<bool> materiasRemover(int id) async {
    try {
      var url = "https://agenda-escolar-api.herokuapp.com/Materia/delete/$id";
      const headers = {"content-type": "application/json"};
      final response = await http.delete(Uri.parse(url), headers: headers);
      if (response.statusCode == 200) {
        //var lista = response.body;
        //Map<String, dynamic> parsed = jsonDecode(lista);
        bool excluido = jsonDecode(response.body);

        return excluido;
      } else
        throw 'Failed';
    } catch (ex) {
      throw new Exception(ex);
    }
  }

  static List<Materia> parseResponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Materia>((json) => Materia.fromJson(json)).toList();
  }

  static bool parseDeleteResponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Materia>((json) => Materia.fromJson(json)).toList();
  }
}
