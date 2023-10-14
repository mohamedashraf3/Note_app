import 'package:flutter/material.dart';
import 'package:note_application/view/components/text_custom.dart';

import '../../view_model/utils/app_colors.dart';
class ButtonCustom extends StatelessWidget {
  const ButtonCustom({super.key, required this.onPressed, required this.text});
  final  void Function()? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return   ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.bluedegree,
        minimumSize: const Size(double.infinity, 45),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8))),
      ),
      onPressed: onPressed,
      child:  TextCustom(text: text,),
    );
  }
}
// if (formKey.currentState!.validate()) {
// }
