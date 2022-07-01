class Professor {
  int id = 0;
  String nome = "";

  Professor(
    this.id,
    this.nome,
  );

  Professor.fromJson(Map<String, dynamic> json) {
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
