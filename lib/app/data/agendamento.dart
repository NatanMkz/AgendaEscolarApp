//import 'package:json_annotation/json_annotation.dart';

//part 'agendamento.g.dart';

class Agendamento {
  int id = 0;
  String nome = "";
  String professorNome = "";
  String materiaNome = "";

  Agendamento(
    this.id,
    this.nome,
    this.professorNome,
    this.materiaNome,
  );

  Agendamento.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    nome = json["nome"].toString();
    professorNome = json["professorNome"].toString();
    materiaNome = json["materiaNome"].toString();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["nome"] = nome;
    data["professorNome"] = professorNome;
    data["materiaNome"] = materiaNome;
    return data;
  }
}
