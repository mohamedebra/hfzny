import 'package:flutter/material.dart';
import 'package:untitled2/core/style/style.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.errMessage});
  final String errMessage;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errMessage,
        style: TextStyles.font16weight700,
        textAlign: TextAlign.center,
      ),
    );
  }
}
