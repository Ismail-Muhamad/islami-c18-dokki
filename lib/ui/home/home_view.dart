import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:islami_c18_dokki/theme/colors.dart';
import 'package:islami_c18_dokki/theme/text_styles.dart';
import 'package:islami_c18_dokki/ui/home/tabs/hadeth_tab/hadeth_tab.dart';
import 'package:islami_c18_dokki/ui/home/tabs/quran_tab/quran_tab.dart';
import 'package:islami_c18_dokki/ui/home/tabs/sebha_tab/sebha_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "homeScreen";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  List<Widget> tabs = [
    QuranTab(),
    HadethTab(),
    SebhaTab(),
    Container(color: Colors.blue),
    Container(color: Colors.green),
  ];

  late PageController pageController = PageController(
    initialPage: selectedIndex,
  );

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      if (((pageController.page ?? 0) % 1) > 0.5) {
        selectedIndex = (pageController.page ?? 0).toInt() + 1;
      } else {
        selectedIndex = (pageController.page ?? 0).toInt();
      }
      setState(() {});
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: PageView(controller: pageController, children: tabs),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.gold,
        selectedLabelStyle: TextStyles.bodySmallStyle(),
        showUnselectedLabels: false,
        selectedItemColor: AppColors.white,
        unselectedItemColor: AppColors.black,
        currentIndex: selectedIndex,
        onTap: (newIndex) {
          if (newIndex == selectedIndex) return;
          selectedIndex = newIndex;
          pageController.jumpToPage(
            selectedIndex,
            // duration: Duration(milliseconds: 300),
            // curve: Curves.easeInOut,
          );
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
            icon: _buildBottomNavigationBarIcon(
              "assets/images/ic_quran.png",
              0,
            ),
            label: "Quran",
          ),
          BottomNavigationBarItem(
            icon: _buildBottomNavigationBarIcon(
              "assets/images/ic_hadeth.png",
              1,
            ),
            label: "Hadeth",
          ),
          BottomNavigationBarItem(
            icon: _buildBottomNavigationBarIcon(
              "assets/images/ic_sebha.png",
              2,
            ),
            label: "Sebha",
          ),
          BottomNavigationBarItem(
            icon: _buildBottomNavigationBarIcon(
              "assets/images/ic_radio.png",
              3,
            ),
            label: "Radio",
          ),
          BottomNavigationBarItem(
            icon: _buildBottomNavigationBarIcon("assets/images/ic_time.png", 4),
            label: "Time",
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBarIcon(String imagePath, int index) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16 , vertical: 6),
      decoration: index == selectedIndex
          ? BoxDecoration(color: AppColors.black.withAlpha(60), borderRadius: BorderRadius.circular(100))
          : null,
      child: ImageIcon(AssetImage(imagePath)),
    );
  }
}
