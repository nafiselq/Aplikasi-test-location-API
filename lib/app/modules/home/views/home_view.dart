import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:location_apps/app/modules/home/views/widget/dropdownLocationType.dart';
import 'package:location_apps/app/modules/home/views/widget/locationBuilding.dart';
import 'package:location_apps/app/modules/home/views/widget/locationFloor.dart';
import 'package:location_apps/app/modules/home/views/widget/locationType.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Tambah Location Apps'),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
              child: Row(
                children: [
                  Text("Location Type?"),
                  SizedBox(
                    width: 20.0,
                  ),
                  Expanded(child: LocationTypeTest()),
                ],
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Project"),
                  Spacer(),
                  Expanded(child: LocationProject()),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: Row(
                children: [
                  Text("Building"),
                  Spacer(),
                  Expanded(child: LocationBuilding()),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 10.0,
              ),
              child: Row(
                children: [
                  Text("Floor"),
                  Spacer(),
                  Expanded(child: LocationFloor()),
                ],
              ),
            ),
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
                    controller: controller.nameLocation,
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
                    controller: controller.latitude,
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
                    controller: controller.longitude,
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
                    controller: controller.distance,
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
                    controller.submit();
                  },
                  child: Text("Submit")),
            )
          ],
        ));
  }
}
