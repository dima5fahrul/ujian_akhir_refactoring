import 'package:get/get.dart';

import 'list_job_controller.dart';

class ListJobBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ListJobController());
  }
}
