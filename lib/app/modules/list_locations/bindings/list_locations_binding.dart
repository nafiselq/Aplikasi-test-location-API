import 'package:get/get.dart';

import '../controllers/list_locations_controller.dart';

class ListLocationsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListLocationsController>(
      () => ListLocationsController(),
    );
  }
}
