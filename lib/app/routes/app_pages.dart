import 'package:get/get.dart';

import '../modules/edit_locations/bindings/edit_locations_binding.dart';
import '../modules/edit_locations/views/edit_locations_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/list_locations/bindings/list_locations_binding.dart';
import '../modules/list_locations/views/list_locations_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LIST_LOCATIONS,
      page: () => const ListLocationsView(),
      binding: ListLocationsBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_LOCATIONS,
      page: () => const EditLocationsView(),
      binding: EditLocationsBinding(),
    ),
  ];
}
