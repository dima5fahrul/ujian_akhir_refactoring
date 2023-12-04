import '../packages.dart';

class CommonTitleAndSeeAll extends StatelessWidget {
  const CommonTitleAndSeeAll({
    super.key,
    required this.title,
    required this.onTap,
  });

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w500),
        ),
        InkWell(
          onTap: onTap,
          child: Text(
            'See All',
            style: textTheme.bodyMedium!.copyWith(color: Colors.grey),
          ),
        ),
      ],
    );
  }
}
