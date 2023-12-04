import '../../config/config.dart';
import '../packages.dart';

class CommonSearch extends StatelessWidget {
  const CommonSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ThemeColors.bgPrimary,
      height: 50,
      child: TextFormField(
        decoration: InputDecoration(
          prefixIcon: Container(
            margin: const EdgeInsets.only(left: 10, right: 10),
            padding: const EdgeInsets.only(top: 12, bottom: 12),
            child: Image.asset("assets/icons/search_icon.png"),
          ),
          hintText: 'What are you looking for?',
          hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}
