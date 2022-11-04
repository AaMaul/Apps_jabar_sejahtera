import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jabar_sejahtera/ui/laporan/laporan_pemasukan.dart';
import 'package:jabar_sejahtera/ui/laporan/laporan_pengeluaran.dart';

import '../../theme/theme.dart';

class PageLaporan extends StatefulWidget {
  const PageLaporan({Key? key}) : super(key: key);

  @override
  State<PageLaporan> createState() => _PageLaporanState();
}

class _PageLaporanState extends State<PageLaporan> {
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
            'Laporan',
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
                    Image.asset(
                      'assets/img/img_ic_laporan1.png',
                      width: 25,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Pemasukan',
                      style: GoogleFonts.mali().copyWith(
                        fontSize: 14,
                        fontWeight: bold,
                        color: primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/img/img_ic_laporan1.png',
                      width: 25,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Pengeluaran',
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
        body: TabBarView(
          children: [
            LaporanPemasukan(),
            LaporanPengeluaran(),
          ],
        ),
      ),
    );
  }
}
