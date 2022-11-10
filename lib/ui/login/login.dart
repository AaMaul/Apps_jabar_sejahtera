import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jabar_sejahtera/constant/app_constant.dart';
import 'package:jabar_sejahtera/data/model/login_model.dart';
import 'package:jabar_sejahtera/data/storage_manager.dart';
import 'package:jabar_sejahtera/theme/theme.dart';
import 'package:jabar_sejahtera/ui/authentication/forgot_password.dart';
import 'package:jabar_sejahtera/ui/authentication/register.dart';
import 'package:jabar_sejahtera/ui/mainPage/main_page.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isObscure = true;

  final _dio = Dio();
  final storage = StorageManager();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  LoginModel? loginModel;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _dio.options = BaseOptions(
      baseUrl: AppConstant.baseUrl
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 220,
                  decoration: BoxDecoration(
                      color: primaryColor,
                      border: Border.all(color: listColor, width: 4),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(116),
                          bottomLeft: Radius.circular(116))),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  top: 75,
                  child: Image.asset(
                    'assets/img/img_logo_overlay.png',
                    width: 80,
                    height: 80,
                  ),
                ),
                Positioned(
                    bottom: 15,
                    left: 0,
                    right: 15,
                    child: Container(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Login',
                          style: GoogleFonts.mali().copyWith(
                            fontSize: 24,
                            fontWeight: bold,
                            color: Colors.white,
                          ),
                        )))
              ],
            ),
            // Positioned(
            //   top: 0,
            //   child: Container(
            //     height: 232,
            //     decoration: BoxDecoration(
            //         color: primaryColor,
            //         border: Border.all(color: listColor, width: 4),
            //         borderRadius: BorderRadius.only(
            //             topRight: Radius.circular(116),
            //             bottomLeft: Radius.circular(116))),
            //   ),
            // ),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                height: 400,
                padding: const EdgeInsets.all(22),
                margin: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                  top: 50,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 3,
                    color: listColor,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  color: whiteColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //EMAIL INPUT
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Email',
                          style: blackTextStyle.copyWith(
                            fontWeight: medium,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.mark_email_read_outlined,
                              color: listColor,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                            contentPadding: const EdgeInsets.all(12),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    //PASSWORD INPUT
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Password',
                          style: blackTextStyle.copyWith(
                            fontWeight: medium,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        TextFormField(
                          controller: passwordController,
                          obscureText: isObscure,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.vpn_key_outlined, color: listColor,),
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
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Register()));
                          },
                          child: Text(
                            'Register',
                            style: blueTextStyle,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ForgotPassword(),
                              ),
                            );
                          },
                          child: Text(
                            'Forgot Password',
                            style: blueTextStyle,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: TextButton(
                        onPressed: () {
                          doLogin();
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(56),
                          ),
                        ),
                        child: isLoading
                            ? const CircularProgressIndicator.adaptive(
                                valueColor:
                                    AlwaysStoppedAnimation(Colors.white))
                            : Text(
                                'Login',
                                style: whiteTextStyle.copyWith(
                                  fontSize: 16,
                                  fontWeight: semiBold,
                                ),
                              ),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MainPage(),
                              ),
                            );
                          },
                          child: Container(
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
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    ));
  }

  void doLogin() async {
    setState(() {
      isLoading = true;
    });
    try {
      var response = await _dio.post("/login",
          data: {
            'email': emailController.text,
            'password': passwordController.text,
          },
          options: Options(headers: {"Accept": "application/json"}));
      print(response.data);
      if (response.statusCode == 200) {
        loginModel = LoginModel.fromJson(response.data);
        storage.saveAuthResponse(loginModel);
        print(response.data);

        setState(() {
          isLoading = false;
        });

        /// pindah ke homepage
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => MainPage()));
      }
    } on DioError catch (e) {
      setState(() {
        isLoading = false;
      });                  
      String errorMessage = "";
      if (e.response?.statusCode == 401) {
        errorMessage = "Anda salah password";
      } else {
        errorMessage = e.message;
      }
      showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: Text(errorMessage ?? "-"),
            actions: [
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                ),
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
      print(e.error);
    }
  }
}

// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:jabar_sejahtera/theme/theme.dart';
//
// class Login extends StatefulWidget {
//   const Login({Key? key}) : super(key: key);
//
//   @override
//   State<Login> createState() => _LoginState();
// }
//
// class _LoginState extends State<Login> {
//   bool isObscure = true;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.white,
//         body: Stack(
//           clipBehavior: Clip.none,
//           children: [
//             Positioned(
//               top: 25,
//               right: 0,
//               left: 0,
//               child: Stack(
//                 children: [
//                   Container(
//                     height: 220,
//                     decoration: BoxDecoration(
//                         color: primaryColor,
//                         border: Border.all(color: listColor, width: 4),
//                         borderRadius: BorderRadius.only(
//                             topRight: Radius.circular(116),
//                             bottomLeft: Radius.circular(116))),
//                   ),
//                   Positioned(
//                     left: 0,
//                     right: 0,
//                     top: 75,
//                     child: Image.asset(
//                       'assets/img/img_logo_overlay.png',
//                       width: 80,
//                       height: 80,
//                     ),
//                   ),
//                   Positioned(
//                       bottom: 15,
//                       left: 0,
//                       right: 15,
//                       child: Container(
//                           alignment: Alignment.centerRight,
//                           child: Text(
//                             'Login',
//                             style: GoogleFonts.mali().copyWith(
//                               fontSize: 24,
//                               fontWeight: bold,
//                               color: Colors.white,
//                             ),
//                           )))
//                 ],
//               ),
//             ),
//             // Positioned(
//             //   top: 0,
//             //   child: Container(
//             //     height: 232,
//             //     decoration: BoxDecoration(
//             //         color: primaryColor,
//             //         border: Border.all(color: listColor, width: 4),
//             //         borderRadius: BorderRadius.only(
//             //             topRight: Radius.circular(116),
//             //             bottomLeft: Radius.circular(116))),
//             //   ),
//             // ),
//             Positioned(
//                 bottom: 0, child: Image.asset('assets/img/img_footer.png')),
//             Positioned.fill(
//               child: Align(
//                 alignment: Alignment.centerRight,
//                 child: Container(
//                   height: 400,
//                   padding: const EdgeInsets.all(22),
//                   margin: const EdgeInsets.only(
//                     left: 10,
//                     right: 10,
//                     top: 50,
//                   ),
//                   decoration: BoxDecoration(
//                     border: Border.all(
//                       width: 3,
//                       color: listColor,
//                     ),
//                     borderRadius: BorderRadius.circular(20),
//                     color: whiteColor,
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       //EMAIL INPUT
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             'Email',
//                             style: blackTextStyle.copyWith(
//                               fontWeight: medium,
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 8,
//                           ),
//                           TextFormField(
//                             decoration: InputDecoration(
//                               suffixIcon: Icon(
//                                 Icons.mark_email_read_outlined,
//                                 color: listColor,
//                               ),
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(14),
//                               ),
//                               contentPadding: const EdgeInsets.all(12),
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(
//                         height: 16,
//                       ),
//                       //PASSWORD INPUT
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             'Password',
//                             style: blackTextStyle.copyWith(
//                               fontWeight: medium,
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 8,
//                           ),
//                           TextFormField(
//                             obscureText: isObscure,
//                             decoration: InputDecoration(
//                               suffixIcon: IconButton(
//                                 icon: Icon(
//                                   isObscure
//                                       ? Icons.visibility_off_outlined
//                                       : Icons.visibility,
//                                   color: listColor,
//                                 ),
//                                 onPressed: () {
//                                   setState(() {
//                                     isObscure = !isObscure;
//                                   });
//                                 },
//                               ),
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(14),
//                               ),
//                               contentPadding: const EdgeInsets.all(12),
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(
//                         height: 8,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             'Register',
//                             style: blueTextStyle,
//                           ),
//                           Text(
//                             'Forgot Password',
//                             style: blueTextStyle,
//                           ),
//                         ],
//                       ),
//                       const SizedBox(
//                         height: 30,
//                       ),
//                       SizedBox(
//                         width: double.infinity,
//                         height: 50,
//                         child: TextButton(
//                           onPressed: () {},
//                           style: TextButton.styleFrom(
//                             backgroundColor: primaryColor,
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(56),
//                             ),
//                           ),
//                           child: Text(
//                             'Log In',
//                             style: whiteTextStyle.copyWith(
//                               fontSize: 16,
//                               fontWeight: semiBold,
//                             ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 50,),
//                       Column(
//                         children: [
//                           Container(
//                             alignment: Alignment.center,
//                             child: Text(
//                               'Login Tanpa Akun?',
//                               style: GoogleFonts.mali().copyWith(
//                                 fontSize: 16,
//                                 fontWeight: bold,
//                                 color: primaryColor,
//
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             )
//           ],
//         ));
//   }
// }
