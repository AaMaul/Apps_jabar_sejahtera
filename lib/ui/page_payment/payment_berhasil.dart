import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jabar_sejahtera/theme/theme.dart';
import 'package:jabar_sejahtera/ui/main_page/main_page.dart';
import 'package:lottie/lottie.dart';

class PembayaranBerhasil extends StatefulWidget {
  const PembayaranBerhasil({Key? key}) : super(key: key);

  @override
  State<PembayaranBerhasil> createState() => _PembayaranBerhasilState();
}

class _PembayaranBerhasilState extends State<PembayaranBerhasil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            "assets/vector/berhasil.json",
          ),
          Text(

            'Pembayaran Berhasil', style: GoogleFonts.mali().copyWith(fontSize: 20, fontWeight: bold, color: Colors.white,),
          ),
        ],
      ),
    );

  }

  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (contex) => MainPage(),),);
    });
  }
}
