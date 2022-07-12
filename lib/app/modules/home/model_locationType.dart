class ModelTypeLocation {
  final String? pR;
  final String? bD;
  final String? fL;
  final String? rO;

  ModelTypeLocation({
    this.pR,
    this.bD,
    this.fL,
    this.rO,
  });

  ModelTypeLocation.fromJson(Map<String, dynamic> json)
    : pR = json['PR'] as String?,
      bD = json['BD'] as String?,
      fL = json['FL'] as String?,
      rO = json['RO'] as String?;

  Map<String, dynamic> toJson() => {
    'PR' : pR,
    'BD' : bD,
    'FL' : fL,
    'RO' : rO
  };

   static List<ModelTypeLocation> fromJsonList(List list) {
    if (list.length == 0) return List<ModelTypeLocation>.empty();
    return list.map((item) => ModelTypeLocation.fromJson(item)).toList();
  }
}