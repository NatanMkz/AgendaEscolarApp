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
    id = json["Id"]?.toString() as int;
    nome = json["Nome"].toString();
    professorNome = json["ProfessorNome"].toString();
    materiaNome = json["MateriaNome"].toString();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["Id"] = id;
    data["Nome"] = nome;
    data["ProfessorNome"] = professorNome;
    data["MateriaNome"] = materiaNome;
    return data;
  }
}
