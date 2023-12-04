import '../../config/config.dart';
import '../../shared/packages.dart';

class DashboardController extends GetxController {
  var selected = 0.obs;

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
}
