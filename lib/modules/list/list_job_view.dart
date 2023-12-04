import '../../config/config.dart';
import '../../models/models.dart';
import '../../shared/components/components.dart';
import '../../shared/packages.dart';
import 'list_job_controller.dart';

class ListJobView extends GetView<ListJobController> {
  const ListJobView({super.key});

  @override
  Widget build(BuildContext context) {
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
            "Job List",
            style: textTheme.titleMedium,
          ),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const CommonSearch(),
              const SizedBox(height: 10),
              CommonCategory(selected: controller.selected),
              const SizedBox(height: 10),
              CommonJobList(itemCount: items.length)
            ],
          ),
        ),
      ),
    );
  }
}
