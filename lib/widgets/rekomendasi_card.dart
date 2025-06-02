import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syklin_apps/themes/colors.dart';

class RekomendasiCard extends StatelessWidget {
  final String imgUrl, nama, harga;
  const RekomendasiCard({super.key, required this.imgUrl, required this.nama, required this.harga});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(imgUrl),
         Positioned(
          bottom: 16,
          left: 13,
          child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
              Text(nama,
              style: GoogleFonts.dmSans(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: whiteColor
              ),),
              Text(harga, style: GoogleFonts.dmSans(
                fontSize: 20, color: whiteColor
              ),)
             ],
         ))
      ],
    );
  }
}