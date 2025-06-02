import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syklin_apps/themes/colors.dart';
import 'package:syklin_apps/widgets/layanan_widget.dart';
import 'package:syklin_apps/widgets/rekomendasi_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 46),
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Selamat Datang!',
                      style: GoogleFonts.dmSans(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: secondaryColor,
                      ),
                    ),
                    Text(
                      'Mau dibantu apa hari ini?',
                      style: GoogleFonts.dmSans(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: greyColor,
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: IconButton(
                  onPressed: null,
                  icon: Image.asset(
                    'assets/ic-notifikasi.png',
                    width: 25,
                    height: 25,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 25),
          // image banner
          Stack(
            children: [
              Image.asset('assets/img-cta.png'),
              Positioned(
                top: 70,
                left: 15,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Cucian\tNumpuk\nbikin pusing?',
                      style: GoogleFonts.dmSans(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: whiteColor,
                      ),
                    ),
                    SizedBox(height: 6),
                    Container(
                      width: 70,
                      height: 25,
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          'Ayo Cuci!',
                          style: GoogleFonts.dmSans(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: primaryColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 17),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              LayananWidget(imagePath: "assets/laundry.png", label: "Laundry"),
              LayananWidget(
                imagePath: "assets/img-dryclean.png",
                label: "Dry Clean",
              ),
              LayananWidget(imagePath: "assets/setrika.png", label: "Setrika"),
              LayananWidget(
                imagePath: "assets/img-lainnya.png",
                label: "Lainnya",
              ),
            ],
          ),
          SizedBox(height: 30),
          Text(
            'Rekomendasi',
            style: GoogleFonts.dmSans(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: greyColor,
            ),
          ),
          SizedBox(height: 20),
          RekomendasiCard(
            imgUrl: "assets/img-drycleaning.png",
            nama: 'Dry Cleaning',
            harga: 'IDR 10000 / Kg',
          ),
          SizedBox(height: 20),
          RekomendasiCard(
            imgUrl: "assets/img-setrika.png",
            nama: 'Setrika',
            harga: 'IDR 5000 / Kg',
          ),
        ],
      ),
    );
  }
}
