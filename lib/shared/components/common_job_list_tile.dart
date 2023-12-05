import 'package:ujian_akhir_refactoring/config/config.dart';

import '../../models/models.dart';
import '../packages.dart';

class CommonJobListTile extends StatelessWidget {
  const CommonJobListTile({
    super.key,
    required this.item,
    required this.textTheme,
  });

  final CompanyModel item;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
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
        item.time,
        style: textTheme.bodySmall,
      ),
    );
  }
}
