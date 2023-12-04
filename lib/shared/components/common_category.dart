import '../../config/config.dart';
import '../../models/models.dart';
import '../packages.dart';

class CommonCategory extends StatelessWidget {
  const CommonCategory({
    super.key,
    required this.selected,
  });

  final Rx<int> selected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Obx(
          () => GestureDetector(
            onTap: () => selected.value = index,
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: selected.value == index
                    ? ThemeColors.bgSecondary
                    : ThemeColors.bgTertiary,
              ),
              child: Text(
                jobs[index].name,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: Colors.white),
              ),
            ),
          ),
        ),
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemCount: jobs.length,
      ),
    );
  }
}
