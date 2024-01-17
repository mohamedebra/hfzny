import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled2/feature/auth/register/data/model/register_request_body.dart';
import 'package:untitled2/feature/auth/register/logic/register_cubit.dart';

import '../../../../core/routes/routes.dart';
import '../../../../core/style/color.dart';
import '../../../../core/style/style.dart';
import '../../../../core/widgets/app_botton.dart';
import '../../../path/data/model/model.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  bool isObscureText = true;
  bool isObscureText1 = true;
  TabBaModel? tabOneModel ;

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
                'انشاء حساب جديد',
                style: GoogleFonts.cairo(textStyle: TextStyles.font24weight600),
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(context, Routes.loginScreen, (route) => false);
            },
            icon: Icon(
              Icons.arrow_forward,
              color: Colors.grey,
            ),
          ),
        ],
      ),
      body: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state){
          if(state is RegisterLoading){
            showDialog(
              context: context,
              builder: (context) => const Center(
                child: CircularProgressIndicator(
                  color: ColorsManager.mainMauve,
                ),
              ),
            );
          }
          else if(state is RegisterSuccess){
            Navigator.pushNamed(context, Routes.tabOne,arguments: tabOneModel);
          }
          else if(state is RegisterError){
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
                              'الاسم الكامل',
                              style:
                              GoogleFonts.cairo(textStyle: TextStyles.font18weight600),
                            ),
                            //TextStyles.font18weight600
                          ),
                          TextFormField(
                            controller: context.read<RegisterCubit>().controllerName,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                                isDense: true,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.black12,
                                    width: 1.3,
                                  ),
                                ),
                                hintText: 'قم بادخال الاسم',
                                hintStyle: TextStyles.font14weight500,
                                prefixIcon:
                                Image.asset('assets/icons/solar_user-linear.png'),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.green,
                                    width: 1.3,
                                  ),
                                  borderRadius: BorderRadius.circular(7.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.red,
                                    width: 1.3,
                                  ),
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.red,
                                    width: 1.3,
                                  ),
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                contentPadding:
                                EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h)),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter a valid Name";
                              }
                            },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              'رقم الجوال',
                              style:
                              GoogleFonts.cairo(textStyle: TextStyles.font18weight600),
                            ),
                          ),
                          TextFormField(
                            controller: context.read<RegisterCubit>().controllerPhone,
                            keyboardType: TextInputType.phone,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter a valid Phone";
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
                                hintText: 'قم بادخال رقم الجوال',
                                hintStyle: TextStyles.font14weight500,
                                prefixIcon: Image.asset(
                                    'assets/icons/solar_smartphone-outline.png'),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(7)),
                                contentPadding:
                                EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h)),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              'البريد الالكتروني',
                              style:
                              GoogleFonts.cairo(textStyle: TextStyles.font18weight600),
                            ),
                          ),
                          TextFormField(
                            controller: context.read<RegisterCubit>().emailController,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter a valid Email";
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
                                hintText: 'قم بادخال البريد الالكتروني',
                                hintStyle: TextStyles.font14weight500,
                                prefixIcon:
                                Image.asset('assets/icons/solar_letter-linear.png'),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(7)),
                                contentPadding:
                                EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h)),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              'كلمة المرور',
                              style:
                              GoogleFonts.cairo(textStyle: TextStyles.font18weight600),
                            ),
                          ),
                          TextFormField(
                            keyboardType: TextInputType.visiblePassword,
                            controller: context.read<RegisterCubit>().passwordController,
                            obscureText: isObscureText,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter a valid Password";
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
                                contentPadding:
                                EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h)),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              'تاكيد كلمة المرور',
                              style:
                              GoogleFonts.cairo(textStyle: TextStyles.font18weight600),
                            ),
                          ),
                          TextFormField(
                            keyboardType: TextInputType.visiblePassword,
                            controller:
                            context.read<RegisterCubit>().controllerpasswordvalid,
                            obscureText: isObscureText1,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter a valid password";
                              }
                            },
                            decoration: InputDecoration(
                                isDense: true,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.green,
                                    width: 1.3,
                                  ),
                                  borderRadius: BorderRadius.circular(7.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.black12,
                                    width: 1.3,
                                  ),
                                ),
                                hintText: 'قم بتاكيد الرقم السري',
                                hintStyle: TextStyles.font14weight500,
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isObscureText1 = !isObscureText1;
                                    });
                                  },
                                  child: Image(
                                    image: isObscureText1
                                        ? AssetImage('assets/icons/visibilty_off.png')
                                        : AssetImage('assets/icons/Group (1).png'),
                                  ),
                                ),
                                prefixIcon: Image.asset('assets/icons/Group.png'),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7),
                                ),
                                contentPadding:
                                EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h)),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          AppTextButton(
                            buttonText: 'انشاء حساب جديد',
                            textStyle: TextStyle(fontSize: 16, color: Colors.white),
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                validateThenDoLogin(context);
                              }
                            },
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, Routes.tabOne,);

                                },
                                child: Text(
                                  'لدي حساب بالفعل',
                                  style: TextStyle(color: Colors.red),
                                ),
                              )
                            ],
                          ),
                        ],
                      )),
                ),
              ));
        },
      ),
    );
  }

  void validateThenDoLogin(BuildContext context) {
    if (formKey.currentState!.validate()) {
      context.read<RegisterCubit>().emitLoginStates(RegisterRequestBody(
          email: context.read<RegisterCubit>().emailController.text,
          password: context.read<RegisterCubit>().passwordController.text,
          name: context.read<RegisterCubit>().controllerName.text,
          password_confirmation:
              context.read<RegisterCubit>().controllerpasswordvalid.text,
          role_id: 2));
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
          style: TextStyles.font14weight500,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              'Got it',
              style: TextStyles.font14weight500,
            ),
          ),
        ],
      ),
    );
  }

}
