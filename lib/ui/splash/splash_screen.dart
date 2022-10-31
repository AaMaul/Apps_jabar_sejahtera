import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jabar_sejahtera/data/storage_manager.dart';
import 'package:jabar_sejahtera/ui/login/login.dart';
import 'package:jabar_sejahtera/ui/mainPage/main_page.dart';

import '../onboarding/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  final storage = StorageManager();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset("assets/img/img_logo_overlay.png", width: 150,),
      ),
    );
  }

  @override
//   void initState() {
//     storage.ensureStorageReady();
//     Timer(const Duration(seconds: 3), () {
//       if(storage.getAccessToken() == null || storage.getAccessToken() == "token_not_loaded") {
//         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MainPage()));
//       } else {
//         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const OnboardingScreen()));
//       }
//     });
//     super.initState();
//   }
// }
  void initState() {
    storage.ensureStorageReady();
    // var token = StorageManager().getAccessToken();
    storage.getAccessToken();
    StorageManager.isfirstOpen().then((isOpen) {
      if (isOpen == false){
        StorageManager.setIsOpen(true);
        Timer(const Duration(seconds: 3), () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => OnboardingScreen()),
          );
        });
      } else {
          Timer(const Duration(seconds: 3), () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => storage.getAccessToken() != null ? MainPage() : Login()),
            );
          });
      }
    });
    super.initState();
  }
}
