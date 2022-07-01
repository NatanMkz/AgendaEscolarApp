// ignore_for_file: file_names, unnecessary_new, curly_braces_in_flow_control_structures, avoid_print

import 'dart:convert';

import 'package:agenda_escolar/app/data/professor.dart';
import 'package:http/http.dart' as http;

class ProfessorRequisitor {
  //HttpClient _http = HttpClient();

  Future<List<Professor>> retorna() async {
    try {
      var url = "https://agenda-escolar-api.herokuapp.com/Professor/buscar";
      //var urldeteste = "https://localhost:7217/Materia/buscar";
      // ignore: close_sinks
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        //var lista = response.body;
        //Map<String, dynamic> parsed = jsonDecode(lista);
        List<Professor> materias = parseResponse(response.body);

        return materias;
      } else
        throw 'Failed';
    } catch (ex) {
      throw new Exception(ex);
    }
  }

  Future<String> cadastrar(String nome) async {
    try {
      var url = "https://agenda-escolar-api.herokuapp.com/Professor/adicionar";
      //var urldeteste = "https://localhost:7217/Materia/adicionar";
      Uri uri = Uri.parse(url);
      const headers = {"content-type": "application/json"};
      final msg = jsonEncode({
        "nome": nome,
      });
      final response = await http.post(uri, headers: headers, body: msg);
      print('Professor Response: ${response.body}');
      if (200 == response.statusCode) {
        print('Professor cadastrado com sucesso');
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      return "Não foi possivel cadastrar o professor";
    }
  }

  Future<String> editar(int id, String nome) async {
    try {
      var url = "https://agenda-escolar-api.herokuapp.com/Professor/editar";
      //var urldeteste = "https://localhost:7217/Materia/adicionar";
      Uri uri = Uri.parse(url);
      const headers = {"content-type": "application/json"};
      final msg = jsonEncode({
        "id": id,
        "nome": nome,
      });
      final response = await http.put(uri, headers: headers, body: msg);
      print('Retorno Editar: ${response.body}');
      if (200 == response.statusCode) {
        print('Professor alterado com sucesso');
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      return "Não foi possivel alterar o professor";
    }
  }

  Future<bool> remover(int id) async {
    try {
      var url = "https://agenda-escolar-api.herokuapp.com/Professor/delete/$id";
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

  static List<Professor> parseResponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Professor>((json) => Professor.fromJson(json)).toList();
  }

  static bool parseDeleteResponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Professor>((json) => Professor.fromJson(json)).toList();
  }
}
