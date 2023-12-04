import '../../shared/packages.dart';

class DetailController extends GetxController {
  var isChangeImage = false.obs;
  var image = 'assets/icons/bookmark.png'.obs;
  var isExpanded = false.obs;

  void changeImage() => image.value == 'assets/icons/bookmark.png'
      ? image.value = 'assets/icons/bookmark_onTap.png'
      : image.value = 'assets/icons/bookmark.png';

  int changeLine() => isExpanded.value ? 20 : 3;

  IconData changeIcon() =>
      isExpanded.value ? Icons.expand_less : Icons.expand_more;
}
