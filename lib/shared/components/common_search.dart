import '../../config/config.dart';
import '../packages.dart';

class CommonSearch extends StatelessWidget {
  const CommonSearch({
    Key? key,
    required this.searchFieldController,
    required this.onChanged,
    required this.onTap,
  }) : super(key: key);

  final TextEditingController searchFieldController;
  final Function(String) onChanged;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            color: ThemeColors.bgPrimary,
            height: 50,
            child: TextField(
              controller: searchFieldController,
              onChanged: onChanged,
              decoration: InputDecoration(
                hintText: 'What are you looking for?',
                hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        GestureDetector(
          onTap: onTap,
          child: Image.asset("assets/icons/search_icon.png", height: 30),
        ),
      ],
    );
  }
}
