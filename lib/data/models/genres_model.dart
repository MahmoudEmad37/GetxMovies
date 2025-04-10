class GenresModel {
  int? id;
  String? name;

  GenresModel({this.id, this.name});

  GenresModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}
