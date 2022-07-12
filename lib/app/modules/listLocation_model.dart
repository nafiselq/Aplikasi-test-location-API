class ListLocation {
  final String? locID;
  final String? locCode;
  final String? locName;
  final String? locType;
  final int? locLatitude;
  final int? locLongitude;
  final int? locDispensation;
  final bool? locActive;
  final String? locCreatedAt;
  final String? locUpdatedUsr;
  final String? locUpdatedAt;
  final String? locActiveLabel;
  final String? locTypeLabel;

  ListLocation({
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

  ListLocation.fromJson(Map<String, dynamic> json)
      : locID = json['locID'] as String?,
        locCode = json['locCode'] as String?,
        locName = json['locName'] as String?,
        locType = json['locType'] as String?,
        locLatitude = json['locLatitude'] as int?,
        locLongitude = json['locLongitude'] as int?,
        locDispensation = json['locDispensation'] as int?,
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
}
