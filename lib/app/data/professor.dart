class Professor {
  int id = 0;
  String nome = "";

  Professor(
    this.id,
    this.nome,
  );

  Professor.fromJson(Map<String, dynamic> json) {
    id = json["Id"].toString() as int;
    nome = json["Nome"].toString();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["Id"] = id;
    data["Nome"] = nome;
    return data;
  }
}
