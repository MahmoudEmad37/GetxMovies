class ProductionCompaniesModel {
  int? id;
  String? logoPath;
  String? name;
  String? originCountry;

  ProductionCompaniesModel({
    this.id,
    this.logoPath,
    this.name,
    this.originCountry,
  });

  ProductionCompaniesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    logoPath = json['logo_path'];
    name = json['name'];
    originCountry = json['origin_country'];
  }
}
