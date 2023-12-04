import 'package:ujian_akhir_refactoring/config/config.dart';

import '../../models/models.dart';
import '../packages.dart';

class CommonJobList extends StatelessWidget {
  const CommonJobList({
    super.key,
    required this.itemCount,
  });

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) => const Divider(),
      itemCount: itemCount,
      itemBuilder: (context, index) {
        final item = items[index];
        return ListTile(
          onTap: () => Get.toNamed(RouteName.detail, arguments: item),
          leading: Image.asset(item.logoBg),
          title: Text(
            item.job,
            style: textTheme.titleSmall,
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.name,
                style: textTheme.labelMedium,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(item.category, style: textTheme.bodySmall),
                  Text(
                    '${item.contract} Year',
                    style: textTheme.bodySmall,
                  ),
                  const SizedBox(width: 10)
                ],
              ),
            ],
          ),
          trailing: Text(
            items[index].time,
            style: textTheme.bodySmall,
          ),
        );
      },
    );
  }
}
