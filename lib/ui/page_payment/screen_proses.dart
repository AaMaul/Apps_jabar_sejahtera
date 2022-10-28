import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jabar_sejahtera/ui/page_payment/payment_berhasil.dart';
import 'package:lottie/lottie.dart';

class ProsesPembayaran extends StatefulWidget {
  const ProsesPembayaran({Key? key}) : super(key: key);

  @override
  State<ProsesPembayaran> createState() => _ProsesPembayaranState();
}

class _ProsesPembayaranState extends State<ProsesPembayaran> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset("assets/vector/complete.json"),
      ),
    );
  }

  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (contex) => PembayaranBerhasil(),),);
    });
  }
}
