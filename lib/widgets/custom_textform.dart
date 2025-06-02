import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syklin_apps/themes/colors.dart';

class CustomTextForm extends StatelessWidget {
  final String? hinText;
  final Widget? suffixIcon;

  const CustomTextForm({super.key, this.hinText, this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        hintText: hinText,
        hintStyle: GoogleFonts.dmSans(
          fontSize: 16,
          color: greyColor
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: greyColor, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: greyColor, width: 1),
        ),
      ),
    );
  }
}
