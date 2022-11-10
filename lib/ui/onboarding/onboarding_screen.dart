// import 'package:carousel_slider/carousel_controller.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:jabar_sejahtera/theme/theme.dart';
//
// class OnboardingScreen extends StatefulWidget {
//   const OnboardingScreen({Key? key}) : super(key: key);
//
//   @override
//   State<OnboardingScreen> createState() => _OnboardingScreenState();
// }
//
// class _OnboardingScreenState extends State<OnboardingScreen> {
//   @override
//   int currentIndex = 0;
//   final controller = PageController();
//   CarouselController carouselController = CarouselController();
//   List<String> titles = [
//     'Zakat Lebih Mudah\ndan Pasti Amanah',
//     'Mari Berbagi Bersana Kami, untuk memberikan Senyum kebahagiaan untuk kaum dhuafa',
//     'Data yang transparan dan\nPenyaluran dengan tepat',
//   ];
//
//   List<Widget> carousel = [
//     Image.asset('assets/img/img_onboarding1.png', width: 209, height: 192),
//     Image.asset('assets/img/img_onboarding2.png', width: 209, height: 192),
//     Image.asset('assets/img/img_onboarding3.png', width: 209, height: 192),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery
//         .of(context)
//         .size;
//     return Scaffold(
//       backgroundColor: primaryColor,
//       appBar: AppBar(
//         leading: SizedBox.shrink(),
//         elevation: 0,
//         backgroundColor: primaryColor,
//         actions: [
//           Stack(
//             children: [
//               Image.asset(
//                 "assets/img/img_skip.png",
//                 height: 56,
//               ),
//               Positioned(
//                 right: 10,
//                 bottom: 25,
//                 child: Text(
//                   'Skip',
//                   style: GoogleFonts.mali().copyWith(
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           const SizedBox(
//             height: kToolbarHeight,
//           ),
//           Flexible(
//             flex: 2,
//             child: CarouselSlider(
//                 carouselController: carouselController,
//                 options: CarouselOptions(
//                     height: 400,
//                     initialPage: 0,
//                     reverse: false,
//                     enableInfiniteScroll: false,
//                     viewportFraction: 1,
//                     onPageChanged: (index, reason) {
//                       setState(() {
//                         currentIndex = index;
//                       });
//                     }),
//                 items: carousel),
//           ),
//           Flexible(
//             flex: 1,
//             child: Container(
//               width: 230,
//               height: 120,
//               alignment: Alignment.center,
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                   image: AssetImage(
//                     "assets/img/img_logo_white.png",
//                   ),
//                   fit: BoxFit.contain,
//                 ),
//               ),
//             ),
//           ),
//           Flexible(
//             flex: 1,
//             child: Column(
//               children: [
//                 Text(
//                   titles[currentIndex],
//                   style: GoogleFonts.mali().copyWith(
//                     color: Colors.white,
//                     fontSize: 22,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//                 SizedBox(
//                   height: currentIndex == 2 ? 38 : 50,
//                 ),
//
//                 currentIndex == 2 ? Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//
//                   children: [
//                     Container(width: 12,height: 12,color: Colors.black,),
//                     Spacer(),
//                     SizedBox(
//                       width: 100,
//                       height: 50,
//                       child: TextButton(onPressed: () {
//                         carouselController.nextPage();
//                       },
//                         style: TextButton.styleFrom(
//                           backgroundColor: listColor,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(100),
//                           ),
//                         ),
//                         child: Text(
//                           'Next', style: GoogleFonts.mali().copyWith(
//                           color: Colors.white,
//                           fontSize: 16,
//                           fontWeight: bold,
//                         ),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                   ],
//                 ):Container(),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jabar_sejahtera/theme/theme.dart';
import 'package:jabar_sejahtera/ui/login/login.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currenIndex = 0;
  CarouselController carouselController = CarouselController();

  List<String> titles = [
    'Zakat Lebih Mudah\ndan Pasti Amanah',
    'Mari Berbagi Bersana Kami, untuk memberikan Senyum kebahagiaan untuk kaum dhuafa',
    'Data yang transparan dan\nPenyaluran dengan tepat',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        leading: const SizedBox.shrink(),
        elevation: 0,
        backgroundColor: primaryColor,
        actions: [
          Visibility(
            visible: currenIndex != 2,
            child: GestureDetector(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const Login()));
              },
              child: Stack(
                children: [
                  Image.asset(
                    "assets/img/img_skip.png",
                    height: 56,
                  ),
                  Positioned(
                    right: 10,
                    bottom: 25,
                    child: Text(
                      'Skip',
                      style: GoogleFonts.mali().copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CarouselSlider(
              items: [
                Image.asset(
                  'assets/img/img_onboarding1.png',
                  height: 201,
                  width: 209,
                ),
                Image.asset(
                  'assets/img/img_onboarding2.png',
                  height: 201,
                  width: 209,
                ),
                Image.asset(
                  'assets/img/img_onboarding3.png',
                  height: 201,
                  width: 209,
                ),
              ],
              options: CarouselOptions(
                height: 210,
                viewportFraction: 1,
                enableInfiniteScroll: false,
                onPageChanged: (index, reason) {
                  setState(() {
                    currenIndex = index;
                  });
                },
              ),
              carouselController: carouselController,
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                children: [
                  Text(
                    titles[currenIndex],
                    style: whiteTextStyle.copyWith(
                      fontSize: 20,
                      fontWeight: semiBold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 90,
                  ),
                  Image.asset(
                    'assets/img/img_logo_white.png',
                    width: 250,
                    height: 150,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 12,
                        height: 12,
                        margin: const EdgeInsets.only(
                          right: 10,
                        ),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: currenIndex == 0
                              ? listColor
                              : lightBackgroundColor,
                        ),
                      ),
                      Container(
                        width: 12,
                        height: 12,
                        margin: const EdgeInsets.only(
                          right: 10,
                        ),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: currenIndex == 1
                              ? listColor
                              : lightBackgroundColor,
                        ),
                      ),
                      Container(
                        width: 12,
                        height: 12,
                        margin: const EdgeInsets.only(
                          right: 10,
                        ),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: currenIndex == 2
                              ? listColor
                              : lightBackgroundColor,
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          currenIndex == 2
                              ? Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Login()))
                              : carouselController.nextPage();
                        },
                        child: Container(
                          height: 60,
                          width: 100,
                          decoration: BoxDecoration(
                            color: listColor,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                              child: Text(
                            currenIndex == 2 ? 'Start' : 'Next',
                            style: GoogleFonts.mali().copyWith(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: bold,
                            ),
                          )),
                        ),
                      )
                      // SizedBox(
                      //   width: 150,
                      //   height: 50,
                      //   child: TextButton(
                      //     onPressed: () {
                      //       carouselController.nextPage();
                      //     },
                      //     style: TextButton.styleFrom(
                      //       backgroundColor: purpleColor,
                      //       shape: BoxShape.circle
                      //     ),
                      //     child: Text(
                      //       'Continue',
                      //       style: whiteTextStyle.copyWith(
                      //         fontSize: 16,
                      //         fontWeight: semiBold,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
