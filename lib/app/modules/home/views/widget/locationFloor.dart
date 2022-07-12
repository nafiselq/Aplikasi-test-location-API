// import 'dart:convert';
import 'dart:convert';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location_apps/app/modules/home/controllers/home_controller.dart';
import 'package:location_apps/app/modules/home/model_Project.dart';
import 'package:location_apps/app/modules/home/model_locationType.dart';
import 'package:dio/dio.dart' as dio;
import 'package:http/http.dart' as http;

class LocationFloor extends StatelessWidget {
  const LocationFloor({super.key});

  @override
  Widget build(BuildContext context) {
    List location = [];
    final controller = Get.put(HomeController());
    return DropdownSearch<ModelProject>(
      validator: (value) => value == null ? 'Harap pilih kondisi' : null,
      label: "Choose Floor",
      showClearButton: true,
      onFind: (String filter) async {
        //uRL DIO
        String url =
            "https://test-api.seucom.com/api/locations/floor/${controller.iocCodeBuilding}";
        //uRL HTTP
        // Uri url = Uri.parse("https://test-api.seucom.com/api/locations/type");

        try {
          //Response dio
          final response = await dio.Dio().get(url);
          //Response http
          // final response = await http.get(url);

          // var data = jsonDecode(response.body)["data"];
          var data = response.data["data"];
          // print(data);
          // print(location);

          if (response.statusCode != 200) {
            print("error");
          }
          // print(listAllGedung);

          var listAllProject = data as List<dynamic>;
          print(listAllProject);

          var models = ModelProject.fromJsonList(listAllProject);
          // print(models);
          return models;
        } catch (err) {
          print(err);
          return List<ModelProject>.empty();
        }
      },
      onChanged: (locationFloor) {
        if (locationFloor != null) {
          controller.idFloor.text = locationFloor.locID.toString();
          print(locationFloor.locName);
        } else {
          controller.idFloor.text = "";
          // controller.iocCodeProject.value = "";
          print(locationFloor?.locName);
          // print("error location type");
        }
        // controller.showButton();
      },
      showSearchBox: true,
      searchBoxDecoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 25,
        ),
        hintText: "Choose Floor",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
      popupItemBuilder: (context, item, isSelected) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            "${item.locName}",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        );
      },
      itemAsString: (item) => item.locName!,
    );
  }
}
