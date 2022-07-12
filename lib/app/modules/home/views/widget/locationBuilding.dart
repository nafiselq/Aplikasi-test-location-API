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

class LocationBuilding extends StatelessWidget {
  const LocationBuilding({super.key});

  @override
  Widget build(BuildContext context) {
    List location = [];
    final controller = Get.put(HomeController());
    return DropdownSearch<ModelProject>(
      validator: (value) => value == null ? 'Harap pilih kondisi' : null,
      label: "Choose Project",
      showClearButton: true,
      onFind: (String filter) async {
        //uRL DIO
        String url =
            "https://test-api.seucom.com/api/locations/building/${controller.iocCodeProject}";
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
      onChanged: (locationBuilding) {
        if (locationBuilding != null) {
          // print(controller.idKategori);
          controller.iocCodeBuilding.value =
              locationBuilding.locCode.toString();
          controller.idBuilding.text = locationBuilding.locCode.toString();
          print(locationBuilding.locName);
        } else {
          controller.idBuilding.text = "";
          controller.iocCodeBuilding.value = "";
          print(locationBuilding?.locName);
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
        hintText: "Choose Project",
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
