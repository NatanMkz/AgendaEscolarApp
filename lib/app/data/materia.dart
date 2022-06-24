class Materia {
  dynamic id = "";
  String nome = "";

  Materia(
    this.id,
    this.nome,
  );

  Materia.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    nome = json["nome"].toString();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["nome"] = nome;
    return data;
  }
}
