import 'package:dio/dio.dart' as dio;
import 'package:location_apps/app/modules/listLocation_model.dart';

class Services {
  getLocationType() async {
    try {
      var response =
          await dio.Dio().get("https://test-api.seucom.com/api/locations/type");
      var data = response.data["data"] as Map<String, dynamic>;
      return data;
    } catch (e) {
      print(e);
    }
  }

  Future<List<ListLocation>?> getAllLocation() async {
    try {
      var response =
          await dio.Dio().get("https://test-api.seucom.com/api/locations");
      if (response.statusCode == 200) {
        List data = response.data["data"];
        List<ListLocation> dataListLocation =
            data.map((e) => ListLocation.fromJson(e)).toList();
        return dataListLocation;
      }
    } catch (e) {}
  }
}
