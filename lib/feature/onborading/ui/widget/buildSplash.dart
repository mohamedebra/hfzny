import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/routes/routes.dart';
import '../../../../core/style/color.dart';
import '../../../../core/style/style.dart';
import '../../../../core/widgets/app_botton.dart';
import '../../data/model/modle_splash.dart';

class BuildSplash extends StatelessWidget {
  const BuildSplash({
    super.key,
    required this.model,
    required this.isLast,
    required this.controller,
    required this.boarding,
  });
  final BaordindModel model;
  final bool isLast;
  final PageController controller;
  final List<BaordindModel> boarding;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: SizedBox(
              width: MediaQuery.sizeOf(context).width / 1.4,
              child: Image(
                image: AssetImage(model.image),
              )),
        ),
        const SizedBox(
          height: 40,
        ),
        Text(
          model.title,
          style: GoogleFonts.cairo(
            textStyle: TextStyles.font28weight400,
          ),
        ),
        Text(
          model.body,
          textAlign: TextAlign.center,
          style: GoogleFonts.cairo(),
        ),
        const SizedBox(
          height: 15,
        ),
        SmoothPageIndicator(
            controller: controller,
            effect: ExpandingDotsEffect(
              dotHeight: 5,
              expansionFactor: 1.8,
              radius: 2,
              dotColor: Colors.grey,
              paintStyle: PaintingStyle.fill,
              activeDotColor: ColorsManager.mainMauve,
            ),
            count: boarding.length),
      ],

    );
  }
}
