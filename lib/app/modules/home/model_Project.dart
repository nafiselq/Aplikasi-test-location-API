class ModelProject {
  final String? locID;
  final String? locCode;
  final String? locName;
  final String? locType;
  final dynamic locLatitude;
  final dynamic locLongitude;
  final dynamic locDispensation;
  final bool? locActive;
  final String? locCreatedAt;
  final String? locUpdatedUsr;
  final String? locUpdatedAt;
  final String? locActiveLabel;
  final String? locTypeLabel;

  ModelProject({
    this.locID,
    this.locCode,
    this.locName,
    this.locType,
    this.locLatitude,
    this.locLongitude,
    this.locDispensation,
    this.locActive,
    this.locCreatedAt,
    this.locUpdatedUsr,
    this.locUpdatedAt,
    this.locActiveLabel,
    this.locTypeLabel,
  });

  ModelProject.fromJson(Map<String, dynamic> json)
      : locID = json['locID'] as String?,
        locCode = json['locCode'] as String?,
        locName = json['locName'] as String?,
        locType = json['locType'] as String?,
        locLatitude = json['locLatitude'],
        locLongitude = json['locLongitude'],
        locDispensation = json['locDispensation'],
        locActive = json['locActive'] as bool?,
        locCreatedAt = json['locCreatedAt'] as String?,
        locUpdatedUsr = json['locUpdatedUsr'] as String?,
        locUpdatedAt = json['locUpdatedAt'] as String?,
        locActiveLabel = json['locActiveLabel'] as String?,
        locTypeLabel = json['locTypeLabel'] as String?;

  Map<String, dynamic> toJson() => {
        'locID': locID,
        'locCode': locCode,
        'locName': locName,
        'locType': locType,
        'locLatitude': locLatitude,
        'locLongitude': locLongitude,
        'locDispensation': locDispensation,
        'locActive': locActive,
        'locCreatedAt': locCreatedAt,
        'locUpdatedUsr': locUpdatedUsr,
        'locUpdatedAt': locUpdatedAt,
        'locActiveLabel': locActiveLabel,
        'locTypeLabel': locTypeLabel
      };
  static List<ModelProject> fromJsonList(List list) {
    if (list.length == 0) return List<ModelProject>.empty();
    return list.map((item) => ModelProject.fromJson(item)).toList();
  }
}
