import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location_apps/app/modules/home/controllers/home_controller.dart';
import 'package:location_apps/app/modules/home/model_Project.dart';
import 'package:dio/dio.dart' as dio;

class LocationProject extends StatelessWidget {
  const LocationProject({super.key});

  @override
  Widget build(BuildContext context) {
    List location = [];
    final controller = Get.put(HomeController());
    print(controller.selectedItem);
    return DropdownSearch<ModelProject>(
      validator: (value) => value == null ? 'Harap pilih kondisi' : null,
      label: "Choose Project",
      showClearButton: true,
      onFind: (String filter) async {
        //uRL DIO
        String url = "https://test-api.seucom.com/api/locations/project";

        try {
          //Response dio
          final response = await dio.Dio().get(url);
          var data = response.data["data"];
          if (response.statusCode != 200) {
            print("error");
          }
          var listAllProject = data as List<dynamic>;
          var models = ModelProject.fromJsonList(listAllProject);
          return models;
        } catch (err) {
          print(err);
          return List<ModelProject>.empty();
        }
      },
      onChanged: (locationProject) {
        if (locationProject != null) {
          controller.iocCodeProject.value = locationProject.locCode.toString();
          controller.idProject.text = locationProject.locCode.toString();
          print(controller.idProject.text);
        } else {
          controller.idProject.text = "";
          controller.iocCodeProject.value = "";
          print(controller.iocCodeProject);
        }
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
