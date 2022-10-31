import 'package:note/utils/images.dart';

class OnboardingModel {
  String imageName;
  String title;
  String subTitle;
  int postIndex = 0;

  OnboardingModel({
    required this.imageName,
    required this.title,
    required this.subTitle,
  });

  static List<OnboardingModel> onboard = [
    OnboardingModel(
      imageName: MyImages.image_onboarding_1,
      title: 'Manage your tasks',
      subTitle:
          'You can easily manage all of your daily tasks in DoMe for free',
    ),
    OnboardingModel(
      imageName: MyImages.image_onboarding_2,
      title: 'Create daily routine',
      subTitle:
          'In Uptodo  you can create your personalized routine to stay productive',
    ),
    OnboardingModel(
      imageName: MyImages.image_onboarding_3,
      title: 'Orgonaize your tasks',
      subTitle:
          'You can organize your daily tasks by adding your tasks into separate categories',
    ),
  ];
}
