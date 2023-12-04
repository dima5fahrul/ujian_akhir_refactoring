import 'package:ujian_akhir_refactoring/config/config.dart';

import '../../models/models.dart';
import '../../shared/components/components.dart';
import '../../shared/packages.dart';
import 'dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DashboardController());

    return Scaffold(
      appBar: AppBar(
        flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          title: Image.asset("assets/logos/logo.png", width: 80),
          titlePadding: const EdgeInsets.all(5.0),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: _DashboardSection(controller: controller),
        ),
      ),
    );
  }
}

class _DashboardSection extends StatelessWidget {
  const _DashboardSection({required this.controller});

  final DashboardController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CommonSearch(),
        const SizedBox(height: 10),
        Image.asset(
          "assets/images/banner.png",
        ),
        const SizedBox(height: 10),
        CommonCategory(selected: controller.selected),
        const SizedBox(height: 10),
        CommonTitleAndSeeAll(
          title: 'Top Company',
          onTap: () => Get.toNamed(RouteName.list),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 155,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final item = items[index];
              return _BannerSection(item: item);
            },
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            itemCount: items.length,
          ),
        ),
        CommonTitleAndSeeAll(
          title: 'Recent Jobs',
          onTap: () => Get.toNamed(RouteName.list),
        ),
        const SizedBox(height: 10),
        const CommonJobList(itemCount: 3),
        const SizedBox(height: 10),
        TextButton(
          onPressed: () => Get.toNamed(RouteName.list),
          child: Text(
            'View More',
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .copyWith(color: Colors.grey),
          ),
        ),
      ],
    );
  }
}

class _BannerSection extends GetView<DashboardController> {
  const _BannerSection({
    required this.item,
  });

  final CompanyModel item;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: () => Get.toNamed(RouteName.detail, arguments: item),
      child: Stack(
        children: [
          Container(
            width: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(item.bg),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 23, left: 84),
            height: 30,
            child: Center(
              child: Text(
                item.name,
                style: textTheme.titleLarge!.copyWith(
                  color: controller.getColorNameAndJob(item.type),
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 45, left: 84),
            height: 30,
            child: Center(
              child: Text(
                item.job,
                style: textTheme.bodyMedium!
                    .copyWith(color: controller.getColorNameAndJob(item.type)),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 95, left: 15),
            height: 27,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 8),
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  height: 27,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: controller.getBgColor(item.type),
                  ),
                  child: Text(item.category,
                      style: textTheme.bodyMedium!.copyWith(
                        color: controller
                            .getColorCategoryApplicantAndContract(item.type),
                      )),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 8),
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  height: 27,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: controller.getBgColor(item.type)),
                  child: Text('${item.apllicant} + Applied',
                      style: textTheme.labelMedium!.copyWith(
                        color: controller
                            .getColorCategoryApplicantAndContract(item.type),
                      )),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  height: 27,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: controller.getBgColor(item.type),
                  ),
                  child: Text('${item.contract} Years',
                      style: textTheme.labelMedium!.copyWith(
                        color: controller
                            .getColorCategoryApplicantAndContract(item.type),
                      )),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 15, top: 17),
            width: 60,
            child: Image.asset(item.logo),
          ),
        ],
      ),
    );
  }
}
