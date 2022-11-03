import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jabar_sejahtera/data/storage_manager.dart';
import 'package:jabar_sejahtera/theme/theme.dart';
import 'package:jabar_sejahtera/ui/donasi/page_donasi.dart';
import 'package:jabar_sejahtera/ui/event/page_event.dart';

import '../zakat/page_zakat.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  final storage =StorageManager();

  String? name = "User";


  @override
  void initState() {
    super.initState();
    setState(() {
      name = storage.getCurrentUsername();
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Image.asset(
          'assets/img/img_logo_white.png',
          width: 120,
          height: 56,
        ),
        elevation: 0,
        backgroundColor: primaryColor,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(2),
          child: Divider(color: listColor, thickness: 2),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: IconButton(
              onPressed: () {
              },
              icon: Icon(
                Icons.notifications_active,
                color: orangeColor,
                size: 40,
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 190,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                top: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Hi $name Selamat datang di\nJabar Sejahtera',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.mali().copyWith(
                        fontSize: 16,
                        fontWeight: bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PageDonasi(),
                          ),
                        );
                      },
                      style: TextButton.styleFrom(
                        elevation: 10,
                        backgroundColor: listColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      child: Text(
                        'Donasi Sekarang',
                        style: GoogleFonts.mali().copyWith(
                          fontSize: 12,
                          fontWeight: bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                      ),
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 130,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          width: 2,
                          color: listColor,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const PageZakat(),
                                    ),
                                  );
                                },
                                child: Container(
                                  width: 80,
                                  height: 80,
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: listColor,
                                        width: 2,
                                      ),
                                      shape: BoxShape.circle),
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        'assets/img/img_ic_zakat.png',
                                        width: 50,
                                        height: 50,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Text(
                                'Zakat',
                                style: GoogleFonts.mali().copyWith(
                                  fontSize: 14,
                                  fontWeight: bold,
                                  color: listColor,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const PageDonasi(),
                                    ),
                                  );
                                },
                                child: Container(
                                  width: 80,
                                  height: 80,
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: listColor,
                                        width: 2,
                                      ),
                                      shape: BoxShape.circle),
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        'assets/img/img_ic_donasi.png',
                                        width: 50,
                                        height: 50,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Text(
                                'Donasi',
                                style: GoogleFonts.mali().copyWith(
                                  fontSize: 14,
                                  fontWeight: bold,
                                  color: listColor,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const PageEvent(),
                                    ),
                                  );
                                },
                                child: Container(
                                  width: 80,
                                  height: 80,
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: listColor,
                                        width: 2,
                                      ),
                                      shape: BoxShape.circle),
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        'assets/img/img_ic_event.png',
                                        width: 50,
                                        height: 50,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Text(
                                'Event',
                                style: GoogleFonts.mali().copyWith(
                                  fontSize: 14,
                                  fontWeight: bold,
                                  color: listColor,
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
            ],
          ),
          const SizedBox(
            height: 72,
          ),
          CarouselSlider(
            items: [
              Container(
                width: size.width,
                child: Image.asset(
                  "assets/img/img_slider1.png",
                ),
              ),
              Container(
                width: size.width,
                child: Image.asset(
                  "assets/img/img_slider2.png",
                ),
              ),
              Container(
                width: size.width,
                child: Image.asset(
                  "assets/img/img_slider3.png",
                ),
              ),
            ],
            options: CarouselOptions(
              height: 200,
              onPageChanged: (index, reason) {
                setState(() {
                  currentIndex = index;
                });
              },
              viewportFraction: 1,
              autoPlay: true,
            ),
          ),
          DotsIndicator(
            position: currentIndex.toDouble(),
            dotsCount: 3,
            decorator: DotsDecorator(
              size: Size.square(9.0),
              activeSize: Size(18.0, 9.0),
              activeShapes: [
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
              ],
            ),
            // sizes: [
            //   Size.square(10.0),
            //   Size.square(10.0),
            //   Size.square(10.0),
            // ],
            // activeSizes: [
            //   Size.square(10.0),
            //   Size.square(10.0),
            //   Size.square(10.0),
            // ],
          ),
          const SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              'Partnership',
              style: GoogleFonts.mali().copyWith(
                fontSize: 18,
                fontWeight: bold,
              ),
            ),
          ),
          CarouselSlider(
            items: [
              Container(
                width: size.width,
                child: Image.asset(
                  "assets/img/img_partner12.png",
                ),
              ),
              Container(
                width: size.width,
                child: Image.asset(
                  "assets/img/img_partner35.png",
                ),
              ),
            ],
            options: CarouselOptions(
              height: 75,
              onPageChanged: (index, reason) {
                setState(
                  () {
                    currentIndex = index;
                  },
                );
              },
              viewportFraction: 1,
            ),
          ),
        ],
      ),
    );
  }
}
