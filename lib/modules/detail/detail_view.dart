import '../../config/config.dart';
import '../../models/models.dart';
import '../../shared/packages.dart';
import 'detail_controller.dart';

class DetailView extends GetView<DetailController> {
  const DetailView({super.key});

  @override
  Widget build(BuildContext context) {
    CompanyModel widget = Get.arguments;
    var textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeColors.bgPrimary,
        leading: IconButton(
          padding: const EdgeInsets.only(top: 20, bottom: 19),
          onPressed: () => Get.back(),
          icon: Image.asset('assets/icons/back_icon.png'),
        ),
        flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          title: Text(
            "Job Detail",
            style: textTheme.titleMedium,
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 20),
            child: Obx(() => GestureDetector(
                  onTap: () => controller.changeImage(),
                  child: Image.asset(
                    controller.image.value,
                    width: 20,
                  ),
                )),
          ),
        ],
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _LogoSection(textTheme: textTheme, widget: widget),
              const SizedBox(height: 16),
              _InfoSection(textTheme: textTheme, widget: widget),
              const SizedBox(height: 20),
              _DescriptionSection(textTheme: textTheme, widget: widget),
              const SizedBox(height: 16),
              _RequirementList(textTheme: textTheme),
            ],
          ),
        ),
      ),
    );
  }
}

class _LogoSection extends StatelessWidget {
  const _LogoSection({required this.textTheme, required this.widget});

  final TextTheme textTheme;
  final CompanyModel widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.job.toString(),
          textAlign: TextAlign.center,
          style: textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
        ),
        Text(
          widget.name.toString(),
          textAlign: TextAlign.center,
          style: textTheme.titleSmall,
        ),
        const SizedBox(height: 16),
        Container(
          width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF000000).withOpacity(0.10),
                blurRadius: 20,
                spreadRadius: 1,
              ),
            ],
          ),
          child: Image.asset(widget.logo.toString()),
        ),
      ],
    );
  }
}

class _InfoSection extends StatelessWidget {
  const _InfoSection({required this.textTheme, required this.widget});

  final TextTheme textTheme;
  final CompanyModel widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ThemeColors.bgPrimary,
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF000000).withOpacity(0.20),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            widget.location.toString(),
            textAlign: TextAlign.center,
            style: textTheme.labelMedium!.copyWith(color: Colors.grey),
          ),
          Container(
            width: 1,
            height: 25,
            color: Colors.grey,
          ),
          Text(
            widget.category.toString(),
            textAlign: TextAlign.center,
            style: textTheme.labelMedium!.copyWith(color: Colors.grey),
          ),
          Container(
            width: 1,
            height: 25,
            color: Colors.grey,
          ),
          Text(
            "${widget.contract} Year",
            textAlign: TextAlign.center,
            style: textTheme.labelMedium!.copyWith(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

class _DescriptionSection extends GetView<DetailController> {
  const _DescriptionSection({required this.textTheme, required this.widget});

  final TextTheme textTheme;
  final CompanyModel widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Job Description',
          style: textTheme.labelLarge!.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 2),
        Obx(
          () => GestureDetector(
            onTap: () => controller.isExpanded.toggle(),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    widget.description.toString(),
                    textAlign: TextAlign.justify,
                    maxLines: controller.changeLine(),
                    overflow: TextOverflow.ellipsis,
                    style: textTheme.bodySmall,
                  ),
                ),
                Icon(controller.changeIcon())
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _RequirementList extends StatelessWidget {
  const _RequirementList({required this.textTheme});

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Requirements',
          textAlign: TextAlign.justify,
          style: textTheme.labelLarge!.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 2),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: requirements.length,
          itemBuilder: (context, index) {
            return Row(
              children: [
                Container(
                  width: 4,
                  height: 4,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black,
                  ),
                ),
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    minWidth: 20,
                    minHeight: 20,
                    maxWidth: 315,
                    maxHeight: 150,
                  ),
                  child: Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: Text(
                      requirements[index].text!,
                      textAlign: TextAlign.justify,
                      style: textTheme.bodySmall,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
