import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:location_apps/app/modules/home/controllers/home_controller.dart';
import 'package:location_apps/app/modules/listLocation_model.dart';

import '../../home/views/widget/dropdownLocationType.dart';
import '../../home/views/widget/locationBuilding.dart';
import '../../home/views/widget/locationFloor.dart';
import '../../home/views/widget/locationType.dart';
import '../controllers/edit_locations_controller.dart';

class EditLocationsView extends GetView<EditLocationsController> {
  const EditLocationsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final cLocation = Get.put(HomeController());
    final ListLocation location = Get.arguments;
    cLocation.nameLocation.text = location.locName.toString();
    cLocation.latitude.text = location.locLatitude.toString();
    cLocation.longitude.text = location.locLongitude.toString();
    cLocation.distance.text = location.locDispensation.toString();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Edit Location Apps'),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 10.0,
              ),
              child: Row(
                children: [
                  Text("Location Name"),
                  SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                      child: TextField(
                    controller: cLocation.nameLocation,
                    showCursor: false,
                    decoration: InputDecoration(border: OutlineInputBorder()),
                  )),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                children: [
                  Text("Location"),
                  SizedBox(
                    width: 20.0,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                      child: TextField(
                    showCursor: false,
                    controller: cLocation.latitude,
                    enabled: false,
                    decoration: InputDecoration(
                        label: Text("Latitude"), border: OutlineInputBorder()),
                  )),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                      child: TextField(
                    showCursor: false,
                    controller: cLocation.longitude,
                    enabled: false,
                    decoration: InputDecoration(
                        label: Text("Longitude"), border: OutlineInputBorder()),
                  )),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                      child: TextField(
                    showCursor: false,
                    controller: cLocation.distance,
                    enabled: false,
                    decoration: InputDecoration(
                        label: Text("Dispensation (in meters)"),
                        border: OutlineInputBorder()),
                  )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 20.0,
              ),
              child: ElevatedButton(
                  onPressed: () {
                    cLocation.updateLocation(location.locID.toString());
                  },
                  child: Text("Submit")),
            )
          ],
        ));
  }
}
