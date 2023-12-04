import '../../modules/modules.dart';
import '../../shared/packages.dart';
import 'route_name.dart';

class Routes {
  static final pages = [
    GetPage(
      name: RouteName.dashboard,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: RouteName.detail,
      page: () => const DetailView(),
      binding: DetailBinding(),
    ),
    GetPage(
      name: RouteName.list,
      page: () => const ListJobView(),
      binding: ListJobBinding(),
    ),
  ];
}
