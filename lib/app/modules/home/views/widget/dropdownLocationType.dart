import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location_apps/app/modules/home/controllers/home_controller.dart';

class LocationTypeTest extends StatefulWidget {
  const LocationTypeTest({super.key});

  @override
  State<LocationTypeTest> createState() => _LocationTypeTestState();
}

class _LocationTypeTestState extends State<LocationTypeTest> {
  String? selectItem = null;
  final controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    print(controller.tes);
    return FutureBuilder(
      future: controller.services.getLocationType(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return DropdownButtonHideUnderline(
            child: DropdownButton(
                iconSize: 36,
                icon: Icon(
                  Icons.arrow_drop_down,
                  color: Color(0xff13A89E),
                ),
                value: selectItem,
                items: controller.tes
                    .map((key, value) {
                      return MapEntry(
                          key,
                          DropdownMenuItem(
                            value: key,
                            child: Text(value),
                          ));
                    })
                    .values
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectItem = value;
                  });
                  controller.selectedItem = value;
                  controller.idType.text = value.toString();
                  print(controller.selectedItem);
                }));
      },
    );
  }
}
