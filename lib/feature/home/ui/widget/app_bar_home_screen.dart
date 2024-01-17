import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled2/core/style/style.dart';

import '../../../../core/style/color.dart';

class AppBarHomeScreen extends StatelessWidget {
  const AppBarHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [

        Container(
          width: double.infinity,
          height: 165,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: ColorsManager.homeScreenBack
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topRight,

                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text("تعلم القرأن ",style: GoogleFonts.cairo(
                      textStyle: TextStyles.font30weight600
                  ),),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text("مع افضل المعلمين",
                  textAlign: TextAlign.end,
                  style: GoogleFonts.cairo(
                    textStyle: TextStyles.font20weight600,
                ),),
              ),
              SizedBox(height: 35,)

            ],
          ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SvgPicture.asset('assets/svg/appBar_homeScrreen.svg'),
        ),
        SvgPicture.asset('assets/svg/Rectangle 1452.svg',width: 245,),
        SvgPicture.asset('assets/svg/Rectangle 1453 (1).svg',width: 200,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Align(
              alignment: Alignment.bottomRight,
              child: SvgPicture.asset('assets/svg/Rectangle 1455.svg',)),
        ),

        Align(
            alignment: Alignment.bottomRight,
            child: SvgPicture.asset('assets/svg/Rectangle 1455.svg',)),

      ],
    );
  }
}
