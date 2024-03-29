import '../../config/config.dart';
import '../../models/models.dart';
import '../../shared/packages.dart';

class DashboardController extends GetxController {
  var listItems = [].obs;

  var selected = 0.obs;
  var searchFieldController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    listItems.value = items;
  }

  Color getColorNameAndJob(String type) {
    switch (type) {
      case 'green':
      case 'blue':
      case 'red':
        return const Color(0xFFF9F9F9);
      default:
        return const Color(0xFF545454);
    }
  }

  Color getColorCategoryApplicantAndContract(String type) {
    switch (type) {
      case 'green':
      case 'blue':
        return const Color(0xFFF9F9F9);
      default:
        return const Color(0xFF545454);
    }
  }

  Color getBgColor(String type) {
    switch (type) {
      case 'green':
        return const Color(0xFF89C45F);
      case 'blue':
        return const Color(0xFF5672B6);
      case 'red':
        return const Color(0xFFFABEC1);
      case 'yellow':
        return const Color(0xFFF6FB1E);
      default:
        return ThemeColors.bgPrimary;
    }
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
