import 'package:get/get.dart';

import '../controllers/edit_locations_controller.dart';

class EditLocationsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditLocationsController>(
      () => EditLocationsController(),
    );
  }
}
