import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syklin_apps/pages/bottom_nav.dart';
import 'package:syklin_apps/themes/colors.dart';
import 'package:syklin_apps/widgets/custom_textform.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Image.asset('assets/img-login.png'),
          SizedBox(height: 45),
          Center(
            child: Text(
              'Laundry lebih mudah!',
              style: GoogleFonts.dmSans(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: secondaryColor,
              ),
            ),
          ),
          SizedBox(height: 22),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                CustomTextForm(hinText: "Masukkan Username"),
                SizedBox(height: 20),
                CustomTextForm(
                  hinText: "Masukkan Password",
                  suffixIcon: Image.asset('assets/ic-eye.png'),
                ),
                SizedBox(height: 5),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    "Lupa Password?",
                    style: GoogleFonts.dmSans(
                      fontSize: 16,
                      color: primaryColor,
                    ),
                  ),
                ),
                SizedBox(height: 32),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNav()));
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Text(
                      'Masuk',
                      style: GoogleFonts.dmSans(
                        fontSize: 16,
                        color: whiteColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 100),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Belum punya akun?',
                style: GoogleFonts.dmSans(fontSize: 16, color: secondaryColor),
              ),
              SizedBox(width: 2),
              Text(
                'Daftar',
                style: GoogleFonts.dmSans(fontSize: 16, color: primaryColor),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
