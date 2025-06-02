import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syklin_apps/themes/colors.dart';

class LayananWidget extends StatelessWidget {
  final String imagePath, label;
  const LayananWidget({
    super.key, required this.imagePath, required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 65,
          height: 62,
          decoration: BoxDecoration(
            border: Border.all(color: lightGrayColor, width: 1),
            borderRadius: BorderRadius.circular(10)
          ),
          child: Center(
            child: Image.asset(imagePath, width: 32, height: 32,),
          ),
        ),
        SizedBox(height: 10,),
        Text(label,
        textAlign: TextAlign.center,
        style: GoogleFonts.dmSans(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: greyColor
        ),)
      ],
    );
    
  }
}
