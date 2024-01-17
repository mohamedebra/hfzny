import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/style/color.dart';
import '../../../../core/style/style.dart';
import '../../../../core/widgets/app_botton.dart';
import '../data/models/login_request_body.dart';
import '../logic/login_cubit.dart';
import '../logic/login_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isObscureText = true;
  bool isObscureText1 = true;

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'تسجيل الدخول',
                style: GoogleFonts.cairo(textStyle: TextStyles.font24weight600),
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, Routes.onBoardingScreen, (route) => false);
            },
            icon: Icon(
              Icons.arrow_forward,
              color: Colors.grey,
            ),
          ),
        ],
      ),
      body: BlocConsumer<LoginCubit,LoginState>(
        listener: (context, state){
          if(state is LoginLoading){
            showDialog(
              context: context,
              builder: (context) => const Center(
                child: CircularProgressIndicator(
                  color: ColorsManager.mainMauve,
                ),
              ),
            );
          }
          else if(state is LoginSuccess){
            Navigator.pushNamedAndRemoveUntil(context, Routes.homeScreen, (route) => false);
          }
          else if(state is LoginError){
            setupErrorState(context, state.error);

          }
        },
        builder: (context, state){
          return SafeArea(
            child: Padding(
              padding: EdgeInsets.only(top: 30.h, right: 20.w, left: 20.w),
              child: Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        child: Text(
                          'رقم الجوال',
                          style: GoogleFonts.cairo(
                              textStyle: TextStyles.font18weight600),
                        ),
                        //TextStyles.font18weight600
                      ),
                      TextFormField(
                        controller: context.read<LoginCubit>().phoneController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black12,
                                width: 1.3,
                              ),
                            ),
                            isDense: true,
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.green,
                                width: 1.3,
                              ),
                              borderRadius: BorderRadius.circular(7.0),
                            ),

                            hintText: 'قم بادخال رقم الجوال',
                            hintStyle: TextStyles.font14weight500,
                            prefixIcon: Image.asset(
                                'assets/icons/solar_smartphone-outline.png'),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7)),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20.w, vertical: 15.h)),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter a valid Phone";
                          }
                        },

                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          'كلمة المرور',
                          style: GoogleFonts.cairo(
                              textStyle: TextStyles.font18weight600),
                        ),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        controller: context.read<LoginCubit>().passwordController,
                        obscureText: isObscureText,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter a valid password";
                          }
                        },
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black12,
                                width: 1.3,
                              ),
                            ),
                            isDense: true,
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.green,
                                width: 1.3,
                              ),
                              borderRadius: BorderRadius.circular(7.0),
                            ),
                            hintText: 'قم بادخال الرقم السري',
                            hintStyle: TextStyles.font14weight500,
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  isObscureText = !isObscureText;
                                });
                              },
                              child: Image(
                                image: isObscureText
                                    ? AssetImage('assets/icons/visibilty_off.png')
                                    : AssetImage('assets/icons/Group (1).png'),
                              ),
                            ),
                            prefixIcon: Image.asset('assets/icons/Group.png'),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(7),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20.w, vertical: 15.h)),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, Routes.resetPassword);
                              },
                              child: Text(
                                'نسيت كلمة المرور !',
                                style: GoogleFonts.cairo(
                                    textStyle: TextStyles.font16weight400),
                              ))
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      AppTextButton(
                        buttonText: 'تسجيل الدخول',
                        textStyle: TextStyle(fontSize: 16, color: Colors.white),
                        onPressed: () async {
                          // Navigator.pushNamedAndRemoveUntil(context, Routes.path, (route) => false);
                          if (formKey.currentState!.validate()) {
                            validateThenDoLogin(context);
                          }
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                              onPressed: () {
                                Navigator.pushNamedAndRemoveUntil(context,
                                    Routes.registerScreen, (route) => false);
                              },
                              child: Text(
                                'ليس لديك حساب ؟ انشاء حساب جديد',
                                style: GoogleFonts.cairo(
                                    textStyle: TextStyles.font16weight700),
                              ))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void validateThenDoLogin(BuildContext context) {
    if (formKey.currentState!.validate()) {
      context.read<LoginCubit>().emitLoginStates(
            LoginRequestBody(
              email: context.read<LoginCubit>().phoneController.text,
              password: context.read<LoginCubit>().passwordController.text,
            ),
          );
    }
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
