class CatFactModel {
  String fact;

  CatFactModel({required this.fact});

  CatFactModel.fromJson(Map<String, dynamic> json) : fact = json['fact'];
}
