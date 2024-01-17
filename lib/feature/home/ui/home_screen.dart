import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled2/core/style/color.dart';
import 'package:untitled2/core/style/style.dart';
import 'package:untitled2/feature/home/ui/widget/app_bar_home_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundImage:
                            AssetImage('assets/icons/image_person.png'),
                      ),
                      SizedBox(
                        width: 7.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'اهلا بك',
                            style: GoogleFonts.cairo(
                                textStyle: TextStyles.font18weight600),
                          ),
                          Text(
                            'محمد ابراهيم احمد ',
                            style: GoogleFonts.cairo(
                                textStyle: TextStyles.font14weight500),
                          )
                        ],
                      )
                    ],
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset('assets/svg/notafication.svg'),
                  ),
                ],
              ),
              SizedBox(
                height: 35.h,
              ),
              const AppBarHomeScreen(),
              SizedBox(
                height: 45.h,
              ),
              Center(
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    SizedBox(height: 10,),

                    CircleAvatar(
                      radius: 80,
                        backgroundColor: ColorsManager.onBoardingBack,
                        child: CircleAvatar(
                      radius: 70,
                      backgroundColor: Colors.white,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Text('الباقة الفضية',style: GoogleFonts.cairo(
                              textStyle: TextStyles.font16weight600
                            ),),
                          ),
                          SizedBox(height: 10,),
                          Text('30:00',style: TextStyles.font16weight600,),
                          SizedBox(height: 10,),
                          Text('صالحة لمدة 28 يوم',style: TextStyle(fontSize: 14,color: Colors.grey),)
                        ],
                      ),
                    )),

                    CircleAvatar(radius: 20,backgroundColor: Colors.white,child: Image(image: AssetImage('assets/icons/fav_home.png'),),),

                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
