import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled2/feature/onborading/ui/widget/buildSplash.dart';

import '../../../core/routes/routes.dart';
import '../../../core/style/color.dart';
import '../../../core/widgets/app_botton.dart';
import '../data/model/modle_splash.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var controller = PageController();
  bool isLast = false;

  List<BaordindModel> boarding = [
    BaordindModel(
      image: 'assets/images/quran 1.png',
      title: 'حفظنى معك فى تعلم القرأن',
      body:
          "هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى\n المقروء لصفحة ما سيلهي القارئ عن التركيز على\n الشكل الخارجي للنص أو شكل توضع الفقرات في\n الصفحة التي يقرأها",
    ),
    BaordindModel(
      image: 'assets/images/teacher 1.png',
      title: 'اكثر من معلم ومعلمة',
      body:
          "هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى\n المقروء لصفحة ما سيلهي القارئ عن التركيز على\n الشكل الخارجي للنص أو شكل توضع الفقرات في\n الصفحة التي يقرأها",
    ),
    BaordindModel(
      image: 'assets/images/age-group 1@2x.png',
      title: 'مختلف الاعمار والمستويات',
      body:
          "هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى\n المقروء لصفحة ما سيلهي القارئ عن التركيز على\n الشكل الخارجي للنص أو شكل توضع الفقرات في\n الصفحة التي يقرأها",
    ),
  ];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 150),
            child: PageView.builder(
              physics: const BouncingScrollPhysics(),
              onPageChanged: (int index) {
                if (index == boarding.length - 1) {
                  setState(() {
                    isLast = true;
                  });
                } else {
                  setState(() {
                    isLast = false;
                  });
                }
              },
              controller: controller,
              itemBuilder: (context, index) => BuildSplash(
                model: boarding[index],
                isLast: isLast,
                controller: controller,
                boarding: boarding,
              ),
              itemCount: boarding.length,
            ),
          ),
        ),
        isLast
            ? Padding(
                padding: EdgeInsets.only(
                    right: 25.w, left: 25.w, top: 50.h, bottom: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppTextButton(
                      buttonText: 'الدخول كطالب',
                      textStyle: GoogleFonts.cairo(
                          textStyle: TextStyle(color: Colors.white)),
                      verticalPadding: 12,
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                            context, Routes.loginScreen, (route) => false);
                      },
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    AppTextButton(
                      buttonText: 'الدخول كمعلم',
                      textStyle: GoogleFonts.cairo(
                          textStyle: TextStyle(color: ColorsManager.text14)),
                      backgroundColor: ColorsManager.onBoardingBack,
                      verticalPadding: 12,
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                            context, Routes.loginScreen, (route) => false);
                      },
                    ),
                  ],
                ),
              )
            : Padding(
                padding: EdgeInsets.only(
                    right: 25.w, left: 25.w, top: 50.h, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppTextButton(
                      buttonText: 'التالي',
                      textStyle: const TextStyle(color: Colors.white),
                      verticalPadding: 12,
                      onPressed: () {
                        if (isLast) {
                          // Navigator.of(context).push(MaterialPageRoute(
                          //     builder: (context) => GetStart(
                          //       controller: controller,
                          //       boarding: boarding,
                          //       model: boarding[2],
                          //     )));
                        } else {
                          controller.nextPage(
                              duration: const Duration(
                                milliseconds: 500,
                              ),
                              curve: Curves.fastOutSlowIn);
                          //fastLinearToSlowEaseIn
                        }
                      },
                      buttonHeight: 45,
                      buttonWidth: 120,
                    ),
                    AppTextButton(
                      buttonText: 'تخطي',
                      textStyle:
                          const TextStyle(color: ColorsManager.onBoardingBack),
                      backgroundColor: Colors.white10,
                      verticalPadding: 12,
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(context, Routes.loginScreen, (route) => false);
                      },
                      buttonHeight: 45,
                      buttonWidth: 120,
                    ),
                  ],
                ),
              )
      ],
    ));
  }
}
