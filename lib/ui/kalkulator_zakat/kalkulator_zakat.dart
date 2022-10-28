import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jabar_sejahtera/ui/kalkulator_zakat/zakat_harta.dart';
import 'package:jabar_sejahtera/ui/kalkulator_zakat/zakat_penghasilan.dart';

import '../../theme/theme.dart';

class PageKalkulator extends StatefulWidget {
  const PageKalkulator({Key? key}) : super(key: key);

  @override
  State<PageKalkulator> createState() => _PageKalkulatorState();
}

class _PageKalkulatorState extends State<PageKalkulator> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: listColor,
              size: 30,
            ),
          ),
          title: Text(
            'Kalkulator Zakat',
            style: GoogleFonts.mali().copyWith(
              fontSize: 20,
              fontWeight: bold,
              color: listColor,
            ),
          ),
          bottom: TabBar(
            indicatorColor: primaryColor,
            indicatorSize: TabBarIndicatorSize.label,
            tabs: [
              Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.calculate_rounded,
                      color: primaryColor,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Zakat Harta',
                      style: GoogleFonts.mali().copyWith(
                          fontSize: 14, fontWeight: bold, color: primaryColor),
                    ),
                  ],
                ),
              ),
              Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.calculate_rounded,
                      color: primaryColor,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Zakat Penghasilan',
                      style: GoogleFonts.mali().copyWith(
                        fontSize: 14,
                        fontWeight: bold,
                        color: primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: const TabBarView(
        children: [
          ZakatHarta(),
          ZakatPenghasilan(),
        ],
        ),
        // body: SafeArea(
        //   child: Column(
        //     children: [
        //       Container(
        //         margin: const EdgeInsets.only(
        //           left: 10,
        //           top: 10,
        //         ),
        //         child: GestureDetector(
        //           onTap: () {
        //             Navigator.pop(context);
        //           },
        //           child: Row(
        //             children: [
        //               Icon(
        //                 Icons.arrow_back,
        //                 color: listColor,
        //                 size: 35,
        //               ),
        //               Text(
        //                 'Kalkulator Zakat',
        //                 style: GoogleFonts.mali().copyWith(
        //                   fontSize: 20,
        //                   fontWeight: bold,
        //                   color: listColor,
        //                 ),
        //               ),
        //             ],
        //           ),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
      ),
    );
  }
}
