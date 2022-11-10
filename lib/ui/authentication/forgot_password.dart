import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jabar_sejahtera/data/model/forgot__password_model.dart';
import 'package:jabar_sejahtera/data/storage_manager.dart';
import 'package:jabar_sejahtera/theme/theme.dart';
import 'package:jabar_sejahtera/ui/login/login.dart';

import '../../constant/app_constant.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  bool isObscure = true;
  bool isObscure1 = true;
  // String hint = 'Pilih Petanyaan Kemanan';
  // List<String> items = ['Nama Mantan Kamu', 'Nama Samaran Kamu'];
  String? selectedValue;

  final emailController = TextEditingController();
  final mantanController = TextEditingController();
  final passwordController = TextEditingController();
  final konfirmasiPasswordController = TextEditingController();
  
  ForgotPasswordModel? forgotPasswordModel;
  final storage = StorageManager();
  final _dio = Dio();
  final _formkey = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  void initState() {
    _dio.options = BaseOptions(baseUrl: AppConstant.baseUrl);
    forgotPassword();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(
                  left: 10,
                  top: 10,
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: listColor,
                        size: 35,
                      ),
                    ),
                    const SizedBox(width: 10,),
                    Text(
                      'Lupa Password',
                      style: GoogleFonts.mali().copyWith(
                        fontSize: 20,
                        fontWeight: bold,
                        color: listColor,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  left: 10,
                  top: 50,
                  right: 10,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Masukan Email Terdaftar',
                        style: GoogleFonts.mali().copyWith(
                          fontSize: 14,
                          fontWeight: bold,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          hintText: 'Masukan Email yang terdaftar',
                          suffixIcon: Icon(
                            Icons.mail,
                            color: listColor,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          contentPadding: const EdgeInsets.all(12),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      // DropdownButtonFormField(
                      //   decoration: InputDecoration(
                      //     border: OutlineInputBorder(
                      //       borderRadius: BorderRadius.circular(14),
                      //     ),
                      //   ),
                      //   isExpanded: true,
                      //   hint: Text(hint),
                      //   items: items
                      //       .map((item) => DropdownMenuItem<String>(
                      //           value: item, child: Text(item)))
                      //       .toList(),
                      //   onChanged: (value) {},
                      // ),
                      // const SizedBox(
                      //   height: 16,
                      // ),
                      Text(
                        'Nama Mantan Kamu',
                        style: GoogleFonts.mali().copyWith(
                          fontSize: 14,
                          fontWeight: bold,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        controller: mantanController,
                        decoration: InputDecoration(
                          hintText: 'Masukan Jawaban Anda',
                          suffixIcon: Icon(
                            Icons.question_answer,
                            color: listColor,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          contentPadding: const EdgeInsets.all(12),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Password Baru',
                        style: GoogleFonts.mali().copyWith(
                          fontSize: 14,
                          fontWeight: bold,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        controller: passwordController,
                        obscureText: isObscure,
                        decoration: InputDecoration(
                          hintText: 'Buat Password Baru',
                          suffixIcon: IconButton(
                            icon: Icon(
                              isObscure
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility,
                              color: listColor,
                            ),
                            onPressed: () {
                              setState(() {
                                isObscure = !isObscure;
                              });
                            },
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          contentPadding: const EdgeInsets.all(12),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        'Konfirmasi Password',
                        style: GoogleFonts.mali().copyWith(
                          fontSize: 14,
                          fontWeight: bold,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        controller: konfirmasiPasswordController,
                        obscureText: isObscure1,
                        decoration: InputDecoration(
                          hintText: 'Masukan kembali password Anda',
                          suffixIcon: IconButton(
                            icon: Icon(
                              isObscure1
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility,
                              color: listColor,
                            ),
                            onPressed: () {
                              setState(() {
                                isObscure1 = !isObscure1;
                              });
                            },
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          contentPadding: const EdgeInsets.all(12),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: TextButton(
                          onPressed: () {
                            forgotPassword();
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(56),
                            ),
                          ),
                          child: Text(
                            'SUBMIT',
                            style: whiteTextStyle.copyWith(
                              fontSize: 20,
                              fontWeight: bold,
                            ),
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
      ),
    );
  }
  
  void forgotPassword() async {
    setState(() {
      isLoading = true;
    });
    try {
      _dio.options = BaseOptions(baseUrl: AppConstant.baseUrl);
      var respon = await _dio.put("/users/forgot-password",
      data: {
        'email' : emailController.text,
        'password' : passwordController.text,
        'password_confirmation' : konfirmasiPasswordController.text,
        'security_question' : mantanController.text,
      },
        options: Options(headers: {
          "Accept" : "aplication/json",

        }));
      if(respon.statusCode == 200) {
        /// udah sukses update password
        forgotPasswordModel = ForgotPasswordModel.fromJson(respon.data);
        setState(() {
          isLoading = false;
        });
        if (forgotPasswordModel?.status == true) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Password Berhasil Dirubah!")));
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login()));
        }
        print(respon.data);
      }
    } on DioError catch (e) {
      print(e.response);
      setState(() {
        isLoading = false;
      });
      if (e.response?.statusCode != 200) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Gagal ganti password")));
          /// gagal update password
      }
    }
  }
}
