import 'package:flutter/material.dart';
import 'package:islami_c18_dokki/theme/colors.dart';
import 'package:islami_c18_dokki/theme/text_styles.dart';
import 'package:islami_c18_dokki/ui/home/home_view.dart';

class IntroScreen extends StatefulWidget {
  static const String routeName = "intro";

  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  int selectedIndex = 0;

  final PageController pageController = PageController();

  final List<IntroData> introPages = [
    IntroData(
      image: "assets/images/intro_welcome.png",
      title: "Welcome To Islmi App",
    ),
    IntroData(
      image: "assets/images/intro_mosque.png",
      title: "Welcome To Islami",
      description: "We Are Very Excited To Have You In Our Community",
    ),
    IntroData(
      image: "assets/images/intro_quran.png",
      title: "Reading the Quran",
      description: "Read, and your Lord is the Most Generous",
    ),
    IntroData(
      image: "assets/images/intro_sebha.png",
      title: "Bearish",
      description: "Praise the name of your Lord, the Most High",
    ),
    IntroData(
      image: "assets/images/intro_radio.png",
      title: "Holy Quran Radio",
      description:
          "You can listen to the Holy Quran Radio through the application for free and easily",
    ),
  ];

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: pageController,
                itemCount: introPages.length,
                onPageChanged: (index) {
                  selectedIndex = index;
                  setState(() {});
                },
                itemBuilder: (context, index) {
                  return IntroPage(
                    introData: introPages[index],
                    width: width,
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Row(
                children: [
                  SizedBox(
                    width: 60,
                    child: selectedIndex == 0
                        ? const SizedBox()
                        : IntroTextButton(
                            text: "Back",
                            onTap: goToPreviousPage,
                          ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        introPages.length,
                        (index) => IntroIndicator(
                          isSelected: index == selectedIndex,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 60,
                    child: IntroTextButton(
                      text: selectedIndex == introPages.length - 1
                          ? "Finish"
                          : "Next",
                      onTap: selectedIndex == introPages.length - 1
                          ? goToHomeScreen
                          : goToNextPage,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void goToNextPage() {
    pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void goToPreviousPage() {
    pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void goToHomeScreen() {
    Navigator.pushReplacementNamed(context, HomeScreen.routeName);
  }
}

class IntroPage extends StatelessWidget {
  final IntroData introData;
  final double width;

  const IntroPage({required this.introData, required this.width, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(height: 16),
          Image.asset(
            "assets/images/img_header.png",
            width: width * 0.7,
          ),
          const Spacer(),
          Image.asset(
            introData.image,
            height: MediaQuery.sizeOf(context).height * 0.37,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 32),
          Text(
            introData.title,
            textAlign: TextAlign.center,
            style: TextStyles.labelLargeStyle(color: AppColors.gold),
          ),
          if (introData.description != null) ...[
            const SizedBox(height: 24),
            Text(
              introData.description!,
              textAlign: TextAlign.center,
              style: TextStyles.labelMediumSmall(color: AppColors.gold),
            ),
          ],
          const Spacer(flex: 2),
        ],
      ),
    );
  }
}

class IntroIndicator extends StatelessWidget {
  final bool isSelected;

  const IntroIndicator({required this.isSelected, super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 3),
      width: isSelected ? 16 : 6,
      height: 6,
      decoration: BoxDecoration(
        color: isSelected ? AppColors.gold : AppColors.gray,
        borderRadius: BorderRadius.circular(100),
      ),
    );
  }
}

class IntroTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const IntroTextButton({required this.text, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyles.labelMediumSmall(color: AppColors.gold),
      ),
    );
  }
}

class IntroData {
  final String image;
  final String title;
  final String? description;

  IntroData({required this.image, required this.title, this.description});
}
