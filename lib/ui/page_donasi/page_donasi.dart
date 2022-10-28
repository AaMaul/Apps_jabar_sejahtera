import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jabar_sejahtera/ui/page_donasi/detail_donasi.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../theme/theme.dart';

class PageDonasi extends StatelessWidget {
  const PageDonasi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(
                left: 10,
                top: 10,
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => const HomePage(),
                  //   ),
                  // );
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.arrow_back,
                      color: listColor,
                      size: 35,
                    ),
                    Text(
                      'Program Donasi',
                      style: GoogleFonts.mali().copyWith(
                        fontSize: 20,
                        fontWeight: bold,
                        color: listColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                style: GoogleFonts.beVietnamPro().copyWith(
                  fontSize: 14,
                ),
                onChanged: (value) {},
                decoration: InputDecoration(
                  hintText: 'Cari Program Donasi',
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Icon(
                      Icons.search,
                      color: primaryColor,
                      size: 25,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      width: 2,
                      color: primaryColor,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: primaryColor,
                      width: 2,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (contex) => const DetailDonasi(),
                    ),
                  );
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/img/img_banner_donasi1.png',
                      height: 150,
                      width: 150,
                    ),
                    Card(
                      shape: Border.all(
                        width: 2,
                        color: primaryColor,
                      ),
                      elevation: 8,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Kebakaran Sekolah',
                              style: GoogleFonts.beVietnamPro().copyWith(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: const [
                                Icon(
                                  Icons.pin_drop,
                                  size: 20,
                                ),
                                Text('Bandung - Jawa Barat'),
                              ],
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            LinearPercentIndicator(
                              width: MediaQuery.of(context).size.width * 0.55,
                              animation: true,
                              lineHeight: 15.0,
                              animationDuration: 1000,
                              percent: 0.75,
                              center: Text(
                                "75%",
                                style: GoogleFonts.beVietnamPro().copyWith(
                                  fontSize: 12,
                                  fontWeight: bold,
                                ),
                              ),
                              linearStrokeCap: LinearStrokeCap.roundAll,
                              progressColor: primaryColor,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.55,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Terkumpul',
                                        style:
                                            GoogleFonts.beVietnamPro().copyWith(
                                          fontSize: 12,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        'Rp. 1.000.000',
                                        style:
                                            GoogleFonts.beVietnamPro().copyWith(
                                          fontSize: 12,
                                          fontWeight: bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        'Dibutuhkan',
                                        style:
                                            GoogleFonts.beVietnamPro().copyWith(
                                          fontSize: 12,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        'Rp. 15.000.000',
                                        style:
                                            GoogleFonts.beVietnamPro().copyWith(
                                          fontSize: 12,
                                          fontWeight: bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
