// ignore_for_file: file_names, unnecessary_new, curly_braces_in_flow_control_structures, avoid_print

import 'dart:convert';

import 'package:agenda_escolar/app/data/agendamento.dart';
import 'package:http/http.dart' as http;

class AgendamentosRequisitor {
  //HttpClient _http = HttpClient();

  Future<List<Agendamento>> retorna() async {
    try {
      var url = "https://agenda-escolar-api.herokuapp.com/Agendamento/buscar";
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        List<Agendamento> materias = parseResponse(response.body);

        return materias;
      } else
        throw 'Failed';
    } catch (ex) {
      throw new Exception(ex);
    }
  }

  Future<String> cadastrar(
      String nome, String professsorNome, String materiaNome) async {
    try {
      var url =
          "https://agenda-escolar-api.herokuapp.com/Agendamento/adicionar";
      //var urldeteste = "https://localhost:7217/Materia/adicionar";
      Uri uri = Uri.parse(url);
      const headers = {"content-type": "application/json"};
      final msg = jsonEncode({
        "nome": nome,
        "professorNome": professsorNome,
        "materiaNome": materiaNome
      });
      final response = await http.post(uri, headers: headers, body: msg);
      print('Agendamento Response: ${response.body}');
      if (200 == response.statusCode) {
        print('Agendamento cadastrado com sucesso');
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      return "Não foi possivel cadastrar agendamento";
    }
  }

  Future<String> editar(
      int id, String nome, String professsorNome, String materiaNome) async {
    try {
      var url = "https://agenda-escolar-api.herokuapp.com/Agendamento/editar";
      //var urldeteste = "https://localhost:7217/Materia/adicionar";
      Uri uri = Uri.parse(url);
      const headers = {"content-type": "application/json"};
      final msg = jsonEncode({
        "id": id,
        "nome": nome,
        "professorNome": professsorNome,
        "materiaNome": materiaNome
      });
      final response = await http.put(uri, headers: headers, body: msg);
      print('Retorno Editar: ${response.body}');
      if (200 == response.statusCode) {
        print('Agendamento alterado com sucesso');
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      return "Não foi possivel alterar o agendamento";
    }
  }

  Future<bool> remover(int id) async {
    try {
      var url =
          "https://agenda-escolar-api.herokuapp.com/Agendamento/delete/$id";
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

  static List<Agendamento> parseResponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<Agendamento>((json) => Agendamento.fromJson(json))
        .toList();
  }

  static bool parseDeleteResponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<Agendamento>((json) => Agendamento.fromJson(json))
        .toList();
  }
}
