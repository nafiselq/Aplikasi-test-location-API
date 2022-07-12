import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/list_locations_controller.dart';

class ListLocationsView extends GetView<ListLocationsController> {
  const ListLocationsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Locations'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: controller.services.getAllLocation(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView.builder(
              itemCount: controller.listLocation.length,
              itemBuilder: (context, index) {
                var item = controller.listLocation[index];
                return Padding(
                  padding: const EdgeInsets.only(
                    bottom: 20.0,
                    left: 20.0,
                    right: 20.0,
                    top: 20.0,
                  ),
                  child: Material(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(20),
                    child: InkWell(
                      onTap: () =>
                          Get.toNamed(Routes.EDIT_LOCATIONS, arguments: item),
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            Text(item.locType.toString()),
                            SizedBox(
                              width: 50,
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      width: 200,
                                      child: Text(item.locName.toString())),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                      width: 150,
                                      child: Text(item.locCode.toString())),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    width: 150,
                                    child: Text(item.locTypeLabel.toString()),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(Routes.HOME),
        child: Icon(
          Icons.add,
          size: 35,
        ),
      ),
    );
  }
}
