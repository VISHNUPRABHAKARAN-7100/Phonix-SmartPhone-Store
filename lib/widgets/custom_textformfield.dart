import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField(
      {super.key,
      required this.obscureText,
      required this.textEditingController,
      this.suffixIconButton,
      required this.labelText,
      required this.ontap,
      this.inputFormats,
      this.keyboardType,});

  final TextEditingController textEditingController;
  final bool obscureText;
  IconButton? suffixIconButton;
  final String labelText;
  final String? Function() ontap;
  List<TextInputFormatter>? inputFormats;
  TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return TextFormField(
      
      keyboardType: keyboardType,
      inputFormatters: inputFormats,
      cursorColor: Colors.black,
      controller: textEditingController,
      obscureText: obscureText,
      decoration: InputDecoration(
        suffixIcon: suffixIconButton,
        labelStyle: const TextStyle(
          color: Colors.black,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(size.width * 0.02),
          borderSide: const BorderSide(
            color: Colors.black,
          ),
        ),
        labelText: labelText,
        focusColor: Colors.black,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(size.width * 0.02)),
      ),
      validator: (String? value) {
        // ontap();
        return ontap();
      },
    );
  }
}
