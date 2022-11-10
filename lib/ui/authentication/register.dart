import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jabar_sejahtera/constant/app_constant.dart';
import 'package:jabar_sejahtera/data/storage_manager.dart';
import 'package:jabar_sejahtera/theme/theme.dart';
import 'package:jabar_sejahtera/ui/login/login.dart';

import '../../data/model/register_model.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool isObscure = true;
  bool isObscure1 = true;
  String hint = 'Pilih Pertanyaan Keamanan';
  List<String> items = ['Nama Mantan Kamu', 'Nama Samaran Kamu'];
  String? selectedValue;

  final namaController = TextEditingController();
  final notlpController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final konformasiPasswordController = TextEditingController();
  final pertanyaanController = TextEditingController();
  final jawabanController = TextEditingController();

  RegisterModel? registerModel;
  var storage = StorageManager();

  final _dio = Dio();

  final _formKey = GlobalKey<FormState>();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          'Register',
          style: GoogleFonts.mali().copyWith(
            fontSize: 20,
            fontWeight: bold,
            color: listColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    left: 10,
                    top: 10,
                    right: 10,
                  ),

                  ///INPUT NAMA
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Nama Lengkap',
                        style: blackTextStyle.copyWith(
                          fontWeight: bold,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        controller: namaController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return ("Nama Harus Diisi");
                          }
                        },
                        decoration: InputDecoration(
                          hintText: 'Masukan Nama Lengkap',
                          prefixIcon: Icon(
                            Icons.person,
                            color: listColor,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          contentPadding: const EdgeInsets.all(12),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                    ],
                  ),
                ),

                /// INPUT NAMA
                Container(
                  margin: const EdgeInsets.only(
                    left: 10,
                    top: 10,
                    right: 10,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'No Tlp/HP',
                        style: blackTextStyle.copyWith(
                          fontWeight: bold,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        controller: notlpController,
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return ("No Tlp Harus Diisi");
                          }
                        },
                        decoration: InputDecoration(
                          hintText: 'Masukan No Tlp Aktif',
                          prefixIcon: Icon(
                            Icons.phone,
                            color: listColor,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          contentPadding: const EdgeInsets.all(12),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                    ],
                  ),
                ),

                /// INPUT Email
                Container(
                  margin: const EdgeInsets.only(
                    left: 10,
                    top: 10,
                    right: 10,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Email Aktif',
                        style: blackTextStyle.copyWith(
                          fontWeight: bold,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        controller: emailController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return ("Email Harus Diisi");
                          }
                        },
                        decoration: InputDecoration(
                          hintText: 'Masukan Email Aktif',
                          prefixIcon: Icon(
                            Icons.email,
                            color: listColor,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          contentPadding: const EdgeInsets.all(12),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                    ],
                  ),
                ),

                /// INPUT Password
                Container(
                  margin: const EdgeInsets.only(
                    left: 10,
                    top: 10,
                    right: 10,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Password',
                        style: blackTextStyle.copyWith(
                          fontWeight: bold,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        controller: passwordController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return ("Password Harus Diisi");
                          }
                        },
                        obscureText: isObscure,
                        decoration: InputDecoration(
                          hintText: 'Buat Password Anda',
                          prefixIcon: Icon(Icons.key_rounded, color: listColor,),
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
                    ],
                  ),
                ),

                /// Konfirmasi Password
                Container(
                  margin: const EdgeInsets.only(
                    left: 10,
                    top: 10,
                    right: 10,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Konfirmasi Password',
                        style: blackTextStyle.copyWith(
                          fontWeight: bold,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        controller: konformasiPasswordController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return ("Konfirmasi Password Harus Diisi");
                          }
                          if (passwordController.text !=
                              konformasiPasswordController.text) {
                            return "Password Harus Sama";
                          }
                        },
                        obscureText: isObscure1,
                        decoration: InputDecoration(
                          hintText: 'Masukan kembali Password Anda',
                          prefixIcon: Icon(Icons.key_rounded, color: listColor,),
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
                        height: 16,
                      ),
                    ],
                  ),
                ),

                /// Pertanyaan Keamanan
                // Container(
                //   margin: const EdgeInsets.only(
                //     left: 10,
                //     top: 10,
                //     right: 10,
                //   ),
                //   child: Column(
                //     mainAxisAlignment: MainAxisAlignment.start,
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       Text(
                //         'Pertanyaan Keamanan',
                //         style: blackTextStyle.copyWith(
                //           fontWeight: bold,
                //         ),
                //       ),
                //       const SizedBox(
                //         height: 8,
                //       ),
                //       DropdownButtonFormField(
                //         decoration: InputDecoration(
                //           border: OutlineInputBorder(
                //             borderRadius: BorderRadius.circular(14),
                //           ),
                //         ),
                //         isExpanded: true,
                //         hint: Text(hint),
                //         items: items
                //             .map((item) => DropdownMenuItem<String>(
                //                 value: item, child: Text(item)))
                //             .toList(),
                //         onChanged: (value) {},
                //       ),
                //
                //       // TextFormField(
                //       //   decoration: InputDecoration(
                //       //     hintText: 'Masukan No Tlp Aktif',
                //       //     suffixIcon: Icon(
                //       //       Icons.phone,
                //       //       color: listColor,
                //       //     ),
                //       //     border: OutlineInputBorder(
                //       //       borderRadius: BorderRadius.circular(14),
                //       //     ),
                //       //     contentPadding: const EdgeInsets.all(12),
                //       //   ),
                //       // ),
                //       SizedBox(
                //         height: 16,
                //       ),
                //     ],
                //   ),
                // ),

                /// Jawaban Keamanan
                Container(
                  margin: const EdgeInsets.only(
                    left: 10,
                    top: 10,
                    right: 10,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Siapa Nama Mantan Kamu',
                        style: blackTextStyle.copyWith(
                          fontWeight: bold,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        controller: pertanyaanController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return ("Pertanyaan Keamanan Harus Diisi");
                          }
                        },
                        decoration: InputDecoration(
                          hintText: 'Masukan Jawabannya',
                          prefixIcon: Icon(
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
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: TextButton(
                          onPressed: () {
                            if (_formKey.currentState?.validate() == true) {
                              print('ok');
                              doRegister();
                            }
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(56),
                            ),
                          ),
                          child: isLoading
                              ? const CircularProgressIndicator.adaptive()
                              : Text(
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
                const SizedBox(
                  height: 10,
                ),
                // Container(
                //   margin: const EdgeInsets.only(
                //     left: 10,
                //     top: 10,
                //     right: 10,
                //   ),
                //   child: Column(
                //     mainAxisAlignment: MainAxisAlignment.start,
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       Text(
                //         'Siapa Nama Mantan Kamu',
                //         style: blackTextStyle.copyWith(
                //           fontWeight: bold,
                //         ),
                //       ),
                //       SizedBox(
                //         height: 8,
                //       ),
                //       TextFormField(
                //         decoration: InputDecoration(
                //           hintText: 'Masukan Jawabannya',
                //           suffixIcon: Icon(
                //             Icons.question_answer,
                //             color: listColor,
                //           ),
                //           border: OutlineInputBorder(
                //             borderRadius: BorderRadius.circular(14),
                //           ),
                //           contentPadding: const EdgeInsets.all(12),
                //         ),
                //       ),
                //       const SizedBox(
                //         height: 30,
                //       ),
                //       SizedBox(
                //         width: double.infinity,
                //         height: 50,
                //         child: TextButton(
                //           onPressed: () {},
                //           style: TextButton.styleFrom(
                //             backgroundColor: primaryColor,
                //             shape: RoundedRectangleBorder(
                //               borderRadius: BorderRadius.circular(56),
                //             ),
                //           ),
                //           child: Text(
                //             'SUBMIT',
                //             style: whiteTextStyle.copyWith(
                //               fontSize: 20,
                //               fontWeight: bold,
                //             ),
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),

                Container(
                  alignment: Alignment.center,
                  child: Text(
                    'Login Tanpa Akun?',
                    style: GoogleFonts.mali().copyWith(
                      fontSize: 16,
                      fontWeight: bold,
                      color: primaryColor,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void doRegister() async {
    setState(() {
      isLoading = true;
    });
    try {
      _dio.options = BaseOptions(baseUrl: AppConstant.baseUrl);
      var response = await _dio.post("/register",
          data: {
            'name': namaController.text,
            'phone_number': notlpController.text,
            'email': emailController.text,
            'password': passwordController.text,
            'password_confirmation': konformasiPasswordController.text,
            'security_question': pertanyaanController.text,
          },
          options: Options(headers: {"Accept": "aplication/json"}));
      print(response.data);
      if (response.statusCode == 200) {
        registerModel = RegisterModel.fromJson(response.data);
        setState(() {
          isLoading = false;
        });
        if (registerModel?.status == true) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Register Berhasil, Silakan Login!")));
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (contex) => Login()));
        }
        print(response.data);
      }
    } on DioError catch (e) {
      setState(() {
        isLoading = false;
      });
      if (e.response?.statusCode == 422) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.response?.data["message"])));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.response?.data["message"])));
      }
    }
  }
}
