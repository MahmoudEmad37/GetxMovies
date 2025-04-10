class ProductionCountriesModel {
  String? iso31661;
  String? name;

  ProductionCountriesModel({this.iso31661, this.name});

  ProductionCountriesModel.fromJson(Map<String, dynamic> json) {
    iso31661 = json['iso_3166_1'];
    name = json['name'];
  }
}
