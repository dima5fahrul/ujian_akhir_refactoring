import '../../models/models.dart';
import '../../shared/packages.dart';

class ListJobController extends GetxController {
  var selected = 0.obs;

  var listItems = [].obs;
  var searchFieldController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    listItems.value = items;
  }

  Future<List<CompanyModel>> searchJob(String keyword) async {
    List<CompanyModel> results = items
        .where((element) =>
            element.name.toLowerCase().contains(keyword.toLowerCase()))
        .toList();

    return results;
  }

  void onKeywordChange(String value) async {
    if (value.isEmpty) {
      listItems.value = items;
    } else {
      listItems.value = await searchJob(value);
    }
    update();
  }
}
