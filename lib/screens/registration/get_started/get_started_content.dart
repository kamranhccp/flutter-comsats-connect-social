class OnboardingContents {
  final String title;
  final String image;
  final String desc;

  OnboardingContents({
    required this.title,
    required this.image,
    required this.desc,
  });
}

List<OnboardingContents> contents = [
  OnboardingContents(
    title: "Explore Your University Experience",
    image: "assets/get_started/1.png",
    desc:
        "Discover the diverse aspects of your university life and make the most of your time on campus.",
  ),
  OnboardingContents(
    title: "Stay Organized with Your University Community",
    image: "assets/get_started/2.png",
    desc:
        "Understand the contributions your classmates and professors make to your academic success and campus life.",
  ),
  OnboardingContents(
    title: "Stay Informed About Campus Updates",
    image: "assets/get_started/3.png",
    desc:
        "Take control of notifications and stay updated on campus news, events, and academic developments.",
  ),
];
