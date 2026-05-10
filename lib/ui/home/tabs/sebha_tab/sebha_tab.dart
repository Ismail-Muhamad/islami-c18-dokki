import 'package:flutter/material.dart';
import 'package:islami_c18_dokki/theme/text_styles.dart';
import 'package:islami_c18_dokki/ui/home/widgets/base_tab.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 0;
  int zekrIndex = 0;

  List<String> azkar = [
    "سبحان الله",
    "الحمد لله",
    "الله أكبر",
  ];

  void onSebhaTap() {
    counter++;

    if (counter == 34) {
      counter = 1;
      zekrIndex++;

      if (zekrIndex == azkar.length) {
        zekrIndex = 0;
      }
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;

    return BaseTab(
      image: "assets/images/sebha_bg.png",
      child: Column(
        children: [
          SafeArea(
            child: Image.asset(
              "assets/images/img_header.png",
              width: width * 0.6,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            "سَبِّحِ اسْمَ رَبِّكَ الأعلى",
            style: TextStyles.titleLargeStyle(),
          ),
          const SizedBox(height: 35),
          Expanded(
            child: Center(
              child: GestureDetector(
                onTap: onSebhaTap,
                child: SizedBox(
                  width: width * 0.9,
                  height: width * 0.9,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Transform.rotate(
                        angle: counter * 0.193,
                        child: Image.asset(
                          "assets/images/sebha.png",
                          width: width * 0.9,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            azkar[zekrIndex],
                            style: TextStyles.titleMediumStyle(),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            "$counter",
                            style: TextStyles.titleLargeStyle(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}