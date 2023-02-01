import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../utils/constant_colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.obscureText,
    required this.textEditingController,
    this.suffixIconButton,
    required this.labelText,
    required this.ontap,
    this.inputFormats,
    this.keyboardType,
  });

  final TextEditingController textEditingController;
  final bool obscureText;
  final IconButton? suffixIconButton;
  final String labelText;
  final String? Function() ontap;
  final List<TextInputFormatter>? inputFormats;
  final TextInputType? keyboardType;
  

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return TextFormField(
      keyboardType: keyboardType,
      inputFormatters: inputFormats,
      cursorColor: ConstantColors.constantBlackColor,
      controller: textEditingController,
      obscureText: obscureText,
      decoration: InputDecoration(
        suffixIcon: suffixIconButton,
        labelStyle: const TextStyle(
          color: ConstantColors.constantBlackColor,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(size.width * 0.02),
          borderSide: const BorderSide(
            color: ConstantColors.constantBlackColor,
          ),
        ),
        labelText: labelText,
        focusColor: ConstantColors.constantBlackColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(size.width * 0.02),
        ),
      ),
      validator: (String? value) {
        return ontap();
      },
    );
  }
}
