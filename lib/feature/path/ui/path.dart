import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled2/core/routes/routes.dart';
import 'package:untitled2/core/style/color.dart';
import 'package:untitled2/core/style/style.dart';
import 'package:untitled2/core/widgets/app_botton.dart';
import 'package:untitled2/feature/path/logic/path_cubit.dart';
import '../../../core/widgets/error.dart';
import '../data/model/model.dart';


class TabOne extends StatefulWidget {
  final TabBaModel? tabOneModel;

  const TabOne({super.key, this.tabOneModel});

  @override
  State<TabOne> createState() => _TabOneState();
}

class _TabOneState extends State<TabOne> {
  @override
  void initState() {
    BlocProvider.of<PathCubit>(context).emitPathStates();
    super.initState();
  }

  String? selectedOption;

  bool isLast = true;
  bool isList1 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          child: BlocBuilder<PathCubit, PathState>(
            builder: (context, state) {
              var cubit = PathCubit.get(context);
              if (state is PathSuccess) {
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'تفضيلاتي التعليمية',
                                style: GoogleFonts.cairo(
                                    textStyle: TextStyles.font24weight600),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: MediaQuery.sizeOf(context).width / 1.15,
                                child: Text(
                                  "${state.data.paths?[cubit.currentIndex].description}",
                                  style: GoogleFonts.cairo(),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "${state.data.paths![cubit.currentIndex].title}",
                                style: GoogleFonts.cairo(
                                    textStyle: TextStyles.font18weight600),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          isLast
                              ? SizedBox(
                                  height: MediaQuery.sizeOf(context).height / 2,
                                  child: ListView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return Column(
                                        children: [
                                          RadioListTile(
                                            title: Text(
                                              '${state.data.paths![cubit.currentIndex].pathItems![index].title}',
                                              style: GoogleFonts.cairo(
                                                  textStyle: TextStyles
                                                      .font16weight600),
                                            ),
                                            subtitle: Text(
                                              '${state.data.paths![cubit.currentIndex].pathItems![index].description}',
                                              style: GoogleFonts.cairo(
                                                textStyle: const TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 14,
                                                    color:
                                                        ColorsManager.text14),
                                              ),
                                            ),
                                            value: state
                                                .data
                                                .paths![cubit.currentIndex]
                                                .pathItems![index]
                                                .title,
                                            activeColor:
                                                ColorsManager.mainMauve,
                                            groupValue: selectedOption,
                                            onChanged: (value) {
                                              setState(() {
                                                selectedOption = value!;
                                                print(value);
                                              });
                                            },
                                          ),
                                          SizedBox(
                                            height: 10.h,
                                          )
                                        ],
                                      );
                                    },
                                    itemCount: state.data.paths!.length,
                                  ),
                                )
                              : SizedBox(
                                  height: MediaQuery.sizeOf(context).height / 2,
                                  child: GridView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio: 2,
                                    ),
                                    itemBuilder: (context, index) {
                                      return RadioListTile(
                                        title: Text(
                                          '${state.data.paths![cubit.currentIndex].pathItems![index].title}',
                                          style: GoogleFonts.cairo(
                                              textStyle:
                                                  TextStyles.font16weight600),
                                        ),
                                        subtitle: Text(
                                          '${state.data.paths![cubit.currentIndex].pathItems![index].description}',
                                          style: GoogleFonts.cairo(
                                            textStyle: const TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14,
                                                color: ColorsManager.text14),
                                          ),
                                        ),
                                        value: state
                                            .data
                                            .paths![cubit.currentIndex]
                                            .pathItems![index]
                                            .title,
                                        activeColor: ColorsManager.mainMauve,
                                        groupValue: selectedOption,
                                        onChanged: (value) {
                                          setState(() {
                                            selectedOption = value;
                                            print(value);
                                          });
                                        },
                                      );
                                    },
                                    itemCount: state
                                        .data
                                        .paths![cubit.currentIndex]
                                        .pathItems!
                                        .length,
                                  ),
                                ),
                        ],
                      ),
                      SizedBox(
                        height: 90.h,
                      ),
                      if (isList1)
                        AppTextButton(
                            buttonText: 'التالي',
                            textStyle: const TextStyle(
                                fontSize: 16, color: Colors.white),
                            onPressed: () {
                              cubit.currentIndex++;

                              if (cubit.currentIndex >=
                                  state.data.paths!.length) {
                                setState(() {
                                  cubit.currentIndex = 0;
                                });
                              }
                              setState(() {
                                if (cubit.currentIndex == 1) {
                                  isLast = false;
                                } else {
                                  isLast = true;
                                }
                              });
                              setState(() {
                                if (cubit.currentIndex == 2) {
                                  isList1 = false;
                                } else {
                                  isList1 = true;
                                }
                              });
                            })
                      else
                        AppTextButton(
                            buttonText: 'حفظ التفضيلات',
                            textStyle:
                                TextStyle(fontSize: 16, color: Colors.white),
                            onPressed: () {
                              setState(() {
                                cubit.currentIndex = 0;
                              });
                              Navigator.pushNamed(context, Routes.plan);
                            }),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                'تخطي اعداد التفضيلات',
                                style: GoogleFonts.cairo(
                                    textStyle:
                                        const TextStyle(color: Colors.red)),
                              )),
                        ],
                      )
                    ],
                  ),
                );
              }
              if (state is PathError) {
                CustomErrorWidget(
                  errMessage: state.error,
                );
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }

  void setupErrorState(BuildContext context, String error) {
    Navigator.of(context).pop();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(
          Icons.error,
          color: Colors.red,
          size: 32,
        ),
        content: Text(
          error,
          style: TextStyles.font16weight400,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              'Got it',
              style: TextStyles.font16weight400,
            ),
          ),
        ],
      ),
    );
  }
}
