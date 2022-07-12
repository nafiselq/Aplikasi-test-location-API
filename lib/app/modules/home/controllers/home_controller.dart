import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:http/http.dart' as http;
import 'package:location_apps/app/routes/app_pages.dart';
import 'package:location_apps/app/services/service.dart';

class HomeController extends GetxController {
  Services services = Services();
  Map<String, dynamic> tes = {};
  List typeLocation = [];
  String? selectedItem = null;

  //Get iocCode
  var iocCodeProject = "".obs;
  var iocCodeBuilding = "".obs;

  //form data
  TextEditingController idType = TextEditingController();
  TextEditingController idProject = TextEditingController();
  TextEditingController idBuilding = TextEditingController();
  TextEditingController idFloor = TextEditingController();
  TextEditingController nameLocation = TextEditingController();
  TextEditingController latitude = TextEditingController(text: '0');
  TextEditingController longitude = TextEditingController(text: '0');
  TextEditingController distance = TextEditingController(text: '0');

  //fungsi submit
  void submit() async {
    var dataBody = {
      "locName": nameLocation.text,
      "locType": idType.text,
      "locLatitude": 0.toString(),
      "locLongitude": 0.toString(),
      "locDispensation": 0.toString()
    };

    if (idType.text == 'RO') {
      dataBody = {
        "locName": nameLocation.text,
        "locType": idType.text,
        "locLatitude": "0",
        "locLongitude": "0",
        "locDispensation": "0",
        "projectCode": idProject.text,
        "buildingCode": idBuilding.text,
        "floorCode": idFloor.text,
      };
      print('RO');
    } else if (idType.text == 'FL') {
      dataBody = {
        "locName": nameLocation.text,
        "locType": idType.text,
        "locLatitude": "0",
        "locLongitude": "0",
        "locDispensation": "0",
        "projectCode": idProject.text,
        "buildingCode": idBuilding.text,
        "floorCode": idFloor.text,
      };
      print('fl');
    } else if (idType.text == 'BD') {
      dataBody = {
        "locName": nameLocation.text,
        "locType": idType.text,
        "locLatitude": "0",
        "locLongitude": "0",
        "locDispensation": "0",
        "projectCode": idProject.text,
        "buildingCode": idBuilding.text,
      };
      print(idProject.text);
      print(idBuilding.text);
    }
    try {
      print(dataBody);
      // String url = "https://test-api.seucom.com/api/locations";
      Uri uri = Uri.parse('https://test-api.seucom.com/api/locations');
      // dio.Response response = await dio.Dio().post(url, data: data);
      var response = await http.post(uri, body: dataBody);
      if (response.statusCode != 200) {
        Get.snackbar("Terjadi kesalahan", "Error pada response");
        print(response.body);
      } else {
        Get.snackbar("Sukses", "Berhasil buat Location");
        Get.offAllNamed(Routes.LIST_LOCATIONS);
      }
    } catch (e) {
      print(e);
    } finally {
      update();
    }
  }

  void updateLocation(String uid) async {
    var dataBody = {
      "locName": nameLocation.text,
      "locType": idType.text,
      "locLatitude": 0.toString(),
      "locLongitude": 0.toString(),
      "locDispensation": 0.toString()
    };

    if (idType.text == 'RO') {
      dataBody = {
        "locName": nameLocation.text,
        "locType": idType.text,
        "locLatitude": "0",
        "locLongitude": "0",
        "locDispensation": "0",
        "projectCode": idProject.text,
        "buildingCode": idBuilding.text,
        "floorCode": idFloor.text,
      };
      print('RO');
    } else if (idType.text == 'FL') {
      dataBody = {
        "locName": nameLocation.text,
        "locType": idType.text,
        "locLatitude": "0",
        "locLongitude": "0",
        "locDispensation": "0",
        "projectCode": idProject.text,
        "buildingCode": idBuilding.text,
        "floorCode": idFloor.text,
      };
      print('fl');
    } else if (idType.text == 'BD') {
      dataBody = {
        "locName": nameLocation.text,
        "locType": idType.text,
        "locLatitude": "0",
        "locLongitude": "0",
        "locDispensation": "0",
        "projectCode": idProject.text,
        "buildingCode": idBuilding.text,
      };
      print(idProject.text);
      print(idBuilding.text);
    }
    try {
      print(dataBody);
      // String url = "https://test-api.seucom.com/api/locations";
      Uri uri = Uri.parse('https://test-api.seucom.com/api/locations/$uid');
      // dio.Response response = await dio.Dio().post(url, data: data);
      var response = await http.put(uri, body: dataBody);
      if (response.statusCode != 200) {
        var result = jsonDecode(response.body)["data"];
        Get.snackbar("Terjadi kesalahan", "Error pada response");

        print(response.body);
      } else {
        Get.snackbar("Sukses", "Berhasil Edit Location");
        Get.offAllNamed(Routes.LIST_LOCATIONS);
      }
    } catch (e) {
      print(e);
    } finally {
      update();
    }
  }

  getLocation() async {
    try {
      var result = await services.getLocationType();
      if (result != null) {
        tes = result;
        print(tes);
      } else {
        print("null");
      }
      typeLocation.add(result);
      // print(tes);
    } catch (e) {
      print(e);
    }
    update();
  }

  @override
  void onInit() async {
    getLocation();
    super.onInit();
  }
}
