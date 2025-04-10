class SpokenLanguagesModel {
  String? englishName;
  String? iso6391;
  String? name;

  SpokenLanguagesModel({this.englishName, this.iso6391, this.name});

  SpokenLanguagesModel.fromJson(Map<String, dynamic> json) {
    englishName = json['english_name'];
    iso6391 = json['iso_639_1'];
    name = json['name'];
  }
}
