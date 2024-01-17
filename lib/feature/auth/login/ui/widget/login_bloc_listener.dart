// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../../../../core/routes/routes.dart';
// import '../../../../../core/style/color.dart';
// import '../../../../../core/style/style.dart';
// import '../../logic/login_cubit.dart';
// import '../../logic/login_state.dart';
//
// class LoginBlocListener extends StatelessWidget {
//   const LoginBlocListener({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return  BlocListener<LoginCubit,LoginState>(
//         listenWhen: (previous, current) =>
//         current is Loading || current is Success || current is Error,
//         listener: (context,state){
//           state.whenOrNull(
//             loading: () {
//               showDialog(
//                 context: context,
//                 builder: (context) => const Center(
//                   child: CircularProgressIndicator(
//                     color: ColorsManager.mainMauve,
//                   ),
//                 ),
//               );
//             },
//             success: (loginResponse) {
//               Navigator.pushNamed(context, Routes.path);
//             },
//             error: (error) {
//               setupErrorState(context, error);
//             },
//           );
//         },
//         child: const SizedBox.shrink());
//   }
//   void setupErrorState(BuildContext context, String error) {
//     Navigator.of(context).pop();
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         icon: const Icon(
//           Icons.error,
//           color: Colors.red,
//           size: 32,
//         ),
//         content: Text(
//           error,
//           style: TextStyles.font16weight400,
//         ),
//         actions: [
//           TextButton(
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//             child: Text(
//               'Got it',
//               style: TextStyles.font16weight400,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
