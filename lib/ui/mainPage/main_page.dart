import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jabar_sejahtera/theme/theme.dart';
import 'package:jabar_sejahtera/ui/galery/pag_galery.dart';
import 'package:jabar_sejahtera/ui/home/home.dart';
import 'package:jabar_sejahtera/ui/kalkulator/kalkulator_zakat.dart';
import 'package:jabar_sejahtera/ui/laporan/page_laporan.dart';
import 'package:jabar_sejahtera/ui/page_profile/page_profile.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    Text(
      'Index 1: Galery',
      style: optionStyle,
    ),
    Text(
      'Index 2: Laporan',
      style: optionStyle,
    ),
    PageMyProfile()
  ];

  void _onItemTapped(int index) {
    switch (index) {
      case 1:
        {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const PageGalery(),
            ),
          );
          break;
        }
      case 2:
        {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const PageLaporan(),
            ),
          );
        }
        break;
      case 3:
        {
          setState(
                () {
              _selectedIndex = index;
            },
          );
        }
        break;
      default:
        {
          setState(
            () {
              _selectedIndex = index;
            },
          );
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: primaryColor,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: GoogleFonts.mali().copyWith(
          color: Colors.white,
          fontSize: 14,
        ),
        unselectedLabelStyle: GoogleFonts.mali().copyWith(
          color: Colors.white,
          fontSize: 14,
        ),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(
                  width: 2,
                  color: listColor,
                ),
              ),
              child: Column(
                children: [
                  Image.asset("assets/img/img_ic_home.png",
                      width: 45, height: 45, color: Colors.white, scale: 2),
                ],
              ),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(
                  width: 2,
                  color: listColor,
                ),
              ),
              child: Column(
                children: [
                  Image.asset("assets/img/img_ic_galery.png",
                      width: 45, height: 45, color: Colors.white, scale: 2),
                ],
              ),
            ),
            label: 'Galery',
          ),
          BottomNavigationBarItem(
            icon: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(
                  width: 2,
                  color: listColor,
                ),
              ),
              child: Column(
                children: [
                  Image.asset("assets/img/img_ic_laporan.png",
                      width: 45, height: 45, color: Colors.white, scale: 2),
                ],
              ),
            ),
            label: 'Laporan',
          ),
          BottomNavigationBarItem(
            icon: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(
                  width: 2,
                  color: listColor,
                ),
              ),
              child: Column(
                children: [
                  Image.asset("assets/img/img_ic_profile.png",
                      width: 45, height: 45, color: Colors.white, scale: 2),
                ],
              ),
            ),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.yellowAccent,
        unselectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const PageKalkulator()));
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            border: Border.all(
              width: 2,
              color: listColor,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/img/img_ic_calculator.png',
                width: 50,
                height: 50,
                color: Colors.white,
                scale: 2,
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
    );
  }

  Widget menuContent(int index) {
    switch (index) {
      case 1:
        {
          return const Text("Page 2");
        }
      default:
        {
          return const Text("Page 1");
        }
    }
  }
}

// import 'package:circle_nav_bar/circle_nav_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:jabar_sejahtera/theme/theme.dart';
// import 'package:jabar_sejahtera/ui/autentication/register.dart';
// import 'package:jabar_sejahtera/ui/home_page/home.dart';
// import 'package:jabar_sejahtera/ui/login/login.dart';
//
// class MainPage extends StatefulWidget {
//   const MainPage({Key? key}) : super(key: key);
//
//   @override
//   State<MainPage> createState() => _MainPageState();
// }
//
// class _MainPageState extends State<MainPage>
//     with SingleTickerProviderStateMixin {
//   int tabIndex = 1;
//   late TabController tabController =
//       TabController(length: 5, vsync: this, initialIndex: tabIndex);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: CircleNavBar(
//         activeIcons: const [
//           Icon(Icons.home, color: Colors.white),
//           Icon(Icons.image, color: Colors.white),
//           Icon(Icons.calculate, color: Colors.white),
//           Icon(Icons.file_open_rounded, color: Colors.white),
//           Icon(Icons.favorite, color: Colors.deepPurple),
//           // Padding(
//           //   padding: EdgeInsets.all(4.0),
//           //   child: CircleAvatar(
//           //     radius: 50,
//           //     backgroundImage: AssetImage(
//           //       "assets/img/img_ic_calculator.png"
//           //     ),
//           //   ),
//           // ),
//
//         ],
//         inactiveIcons: const [
//           Icon(Icons.home, color: Colors.white),
//           Icon(Icons.image, color: Colors.white),
//           Icon(Icons.calculate, color: Colors.white),
//           Icon(Icons.file_open_rounded, color: Colors.white),
//           Icon(Icons.file_open_rounded, color: Colors.white),
//           // Text("Home"),
//           // Text("Galery"),
//           // Text("Calculator"),
//           // Text("Laporan"),
//           // Text("Profile"),
//         ],
//         color: primaryColor,
//         height: 60,
//         circleWidth: 60,
//         initIndex: tabIndex,
//         onChanged: (v) {
//           // switch (v) {
//           //   case 1:
//           //     {
//           //       setState(() {
//           //         tabIndex = 0;
//           //         tabController.animateTo(v);
//           //       });
//           //         Navigator.push(
//           //             context, MaterialPageRoute(builder: (context) => Login()));
//           //       break;
//           //     }
//           //   case 2:
//           //     {
//           //       setState(() {
//           //         tabIndex = 0;
//           //         tabController.animateTo(v);
//           //       });
//           //         Navigator.push(
//           //             context, MaterialPageRoute(builder: (context) => Login()));
//           //       break;
//           //     }
//           //   case 3:
//           //     {
//           //       setState(() {
//           //         tabIndex = 0;
//           //         tabController.animateTo(v);
//           //       });
//           //         Navigator.push(
//           //             context, MaterialPageRoute(builder: (context) => Login()));
//           //       break;
//           //     }
//           //   default:
//           //     {
//           //       setState(() {
//           //         tabIndex = v;
//           //         tabController.animateTo(v);
//           //       });
//           //     }
//           // }
//
//
//
//           // if (v == 0) {
//           //   Navigator.push(
//           //       context, MaterialPageRoute(builder: (context) => Login()));
//           // } else {
//           //   tabIndex = v;
//           //   tabController.animateTo(v);
//           // }
//           // setState(() {});
//         },
//         // tabCurve: ,
//         padding: const EdgeInsets.only(left: 5, right: 5, bottom: 10),
//         cornerRadius: const BorderRadius.only(
//           topLeft: Radius.circular(8),
//           topRight: Radius.circular(8),
//           bottomRight: Radius.circular(24),
//           bottomLeft: Radius.circular(24),
//         ),
//         shadowColor: Colors.deepPurple,
//         elevation: 10,
//       ),
//       body: TabBarView(
//         physics: const NeverScrollableScrollPhysics(),
//         controller: tabController,
//         children: [
//           Register(),
//           HomePage(),
//           Container(
//               width: double.infinity,
//               height: double.infinity,
//               color: Colors.blue),
//           Container(
//               width: double.infinity,
//               height: double.infinity,
//               color: Colors.blue),
//           Container(
//               width: double.infinity,
//               height: double.infinity,
//               color: Colors.blue),
//         ],
//       ),
//     );
//   }
// }
