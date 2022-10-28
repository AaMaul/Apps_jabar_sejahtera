import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jabar_sejahtera/constant/app_constant.dart';
import 'package:jabar_sejahtera/data/model/profile_model.dart';
import 'package:jabar_sejahtera/data/storage_manager.dart';

import '../../theme/theme.dart';
import '../login/login.dart';

class PageMyProfile extends StatefulWidget {
  const PageMyProfile({Key? key}) : super(key: key);

  @override
  State<PageMyProfile> createState() => _PageMyProfileState();
}

class _PageMyProfileState extends State<PageMyProfile> {
  final _dio = Dio();
  final storage = StorageManager();

  bool isLoading = false;
  ProfileModel? _profileModel;

  bool enableEditName = false;
  bool enableEditEmail = false;
  bool enableEditPhone = false;

  final editNameController = TextEditingController();
  final editEmailController = TextEditingController();
  final editPhoneController = TextEditingController();

  @override
  void initState() {
    _dio.options = BaseOptions(baseUrl: AppConstant.baseUrl);
    getUserProfile();
    editNameController.text = 'Ari Maulana. A';
    editEmailController.text = 'maul@gmail.com';
    editPhoneController.text = "89887829748392";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 230,
                  ),
                  Container(
                    height: 190,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 10,
                    right: 0,
                    top: 20,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'My Profile',
                              style: GoogleFonts.mali().copyWith(
                                fontSize: 20,
                                fontWeight: bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              width: 70,
                            ),
                            Image.asset(
                              'assets/img/img_jds.png',
                              width: 60,
                              height: 40,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Image.asset(
                              'assets/img/img_diskomifo.png',
                              width: 70,
                              height: 40,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Image.asset(
                              'assets/img/img_logo_white.png',
                              width: 70,
                              height: 40,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      child: Image.asset(
                        enableEditName == true && enableEditEmail == true ? "assets/img/img_profile_edit.png" :'assets/img/img_profile.png',
                        width: 100,
                        height: 100,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nama Lengkap',
                      style: GoogleFonts.beVietnamPro().copyWith(
                        fontSize: 14,
                        fontWeight: bold,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      enabled: enableEditName,
                      controller: editNameController,
                      decoration: InputDecoration(
                        disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: BorderSide(
                              width: 2,
                              color: primaryColor,
                            )),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            'assets/img/img_ic_name.png',
                            width: 35,
                            height: 35,
                          ),
                        ),
                        // labelText: 'Ari Maulana. A',
                        labelStyle: GoogleFonts.beVietnamPro().copyWith(
                          fontSize: 16,
                          fontWeight: bold,
                          color: Colors.black,
                        ),
                        contentPadding: const EdgeInsets.all(12),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Email Terdaftar',
                      style: GoogleFonts.beVietnamPro().copyWith(
                        fontSize: 14,
                        fontWeight: bold,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      enabled: enableEditEmail,
                      controller: editEmailController,
                      decoration: InputDecoration(
                        disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: BorderSide(
                              width: 2,
                              color: primaryColor,
                            )),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            'assets/img/img_ic_email.png',
                            width: 35,
                            height: 35,
                          ),
                        ),
                        // labelText: 'maul@gmail.com',
                        labelStyle: GoogleFonts.beVietnamPro().copyWith(
                          fontSize: 16,
                          fontWeight: bold,
                          color: Colors.black,
                        ),
                        contentPadding: const EdgeInsets.all(12),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'No Tlp',
                      style: GoogleFonts.beVietnamPro().copyWith(
                        fontSize: 14,
                        fontWeight: bold,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      enabled: enableEditPhone,
                      controller: editPhoneController,
                      decoration: InputDecoration(
                        disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: BorderSide(
                              width: 2,
                              color: primaryColor,
                            )),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            'assets/img/img_ic_phone.png',
                            width: 35,
                            height: 35,
                          ),
                        ),
                        // labelText: '+62 821 2278 3908',
                        labelStyle: GoogleFonts.beVietnamPro().copyWith(
                          fontSize: 16,
                          fontWeight: bold,
                          color: Colors.black,
                        ),
                        contentPadding: const EdgeInsets.all(12),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.45,
                    child: TextButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                alignment: Alignment.center,
                                title: const Text('Apakah yakin ingin Keluar?'),
                                titleTextStyle: GoogleFonts.mali().copyWith(
                                  fontSize: 18,
                                  fontWeight: bold,
                                  color: Colors.black,
                                ),
                                actions: [
                                  TextButton(
                                    style: TextButton.styleFrom(
                                        textStyle: GoogleFonts.mali()
                                            .copyWith(fontSize: 14)),
                                    onPressed: () {
                                      Navigator.pop(context);
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) {
                                            storage.deleteAuthResponse();
                                            return Login();
                                          },
                                        ),
                                      );
                                    },
                                    child: Text(
                                      'YA',
                                      style: GoogleFonts.mali().copyWith(
                                        fontSize: 18,
                                        fontWeight: bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  TextButton(
                                    style: TextButton.styleFrom(
                                        textStyle: GoogleFonts.mali()
                                            .copyWith(fontSize: 14)),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      'TIDAK',
                                      style: GoogleFonts.mali().copyWith(
                                        fontSize: 18,
                                        fontWeight: bold,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            });
                        storage.deleteAuthResponse();
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/img/img_ic_logout_white.png',
                            width: 30,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Logout',
                            style: GoogleFonts.mali().copyWith(
                              fontSize: 18,
                              fontWeight: bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.45,
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          enableEditPhone = !enableEditPhone;
                          enableEditEmail = !enableEditEmail;
                          enableEditName = !enableEditName;
                        });
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            enableEditName == true && enableEditEmail == true ? "assets/img/img_ic_save.png" : 'assets/img/img_ic_editprofil_white.png',
                            width: 30,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Text(
                              enableEditName == true && enableEditEmail == true ? "Save Profile" : 'Edit Profile',
                              overflow: TextOverflow.fade,
                              style: GoogleFonts.mali().copyWith(
                                fontSize: 18,
                                fontWeight: bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void getUserProfile() async {
    setState(() {
      isLoading = true;
    });
    try {
      var response =
          await _dio.get("/api/v1/users/${storage.getCurrentUserId()}",
              options: Options(headers: {
                "Accept": "application/json",
                "Authorization": "Bearer ${storage.getAccessToken()}"
              }));
      if (response.statusCode == 200) {
        setState(() {
          _profileModel = ProfileModel.fromJson(response.data);
          isLoading = false;
        });
      }
    } on DioError catch (e) {
      setState(() {
        isLoading = false;
      });
      print(e.error);
    }
  }
}

// body: SafeArea(
// child: Column(
// children: [
// Container(
// margin: const EdgeInsets.only(
// left: 10,
// top: 10,
// ),
// child: GestureDetector(
// onTap: () {
// Navigator.pop(context);
// },
// child: Row(
// children: [
// Text(
// 'My Profile',
// style: GoogleFonts.mali().copyWith(
// fontSize: 20,
// fontWeight: bold,
// color: listColor,
// ),
// ),
// ],
// ),
// ),
// ),
// ],
// ),
// ),
