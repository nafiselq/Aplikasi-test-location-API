import 'package:get/get.dart';
import 'package:location_apps/app/modules/listLocation_model.dart';

import '../../../services/service.dart';

class ListLocationsController extends GetxController {
  Services services = Services();
  var listLocation = <ListLocation>[].obs;
  getListLocation() async {
    try {
      var result = await services.getAllLocation();
      if (result != null) {
        listLocation.assignAll(result);
      }
    } catch (e) {
      print(e);
    }
    update();
  }

  final count = 0.obs;
  @override
  void onInit() {
    getListLocation();
    super.onInit();
  }
}
