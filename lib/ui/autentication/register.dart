import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jabar_sejahtera/theme/theme.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  margin: const EdgeInsets.only(
                    top: 25,
                  ),
                  child: Text(
                    'Register',
                    style: GoogleFonts.mali().copyWith(
                      fontSize: 26,
                      fontWeight: bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
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
                      decoration: InputDecoration(
                        hintText: 'Masukan Nama Lengkap',
                        suffixIcon: Icon(
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
                      decoration: InputDecoration(
                        hintText: 'Masukan No Tlp Aktif',
                        suffixIcon: Icon(
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
                      decoration: InputDecoration(
                        hintText: 'Masukan Email Aktif',
                        suffixIcon: Icon(
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
                      obscureText: isObscure,
                      decoration: InputDecoration(
                        hintText: 'Buat Password Anda',
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
                      obscureText: isObscure1,
                      decoration: InputDecoration(
                        hintText: 'Masukan kembali Password Anda',
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
                      'Pertanyaan Keamanan',
                      style: blackTextStyle.copyWith(
                        fontWeight: bold,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    DropdownButtonFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      isExpanded: true,
                      hint: Text(hint),
                      items: items
                          .map((item) => DropdownMenuItem<String>(
                              value: item, child: Text(item)))
                          .toList(),
                      onChanged: (value) {},
                    ),

                    // TextFormField(
                    //   decoration: InputDecoration(
                    //     hintText: 'Masukan No Tlp Aktif',
                    //     suffixIcon: Icon(
                    //       Icons.phone,
                    //       color: listColor,
                    //     ),
                    //     border: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(14),
                    //     ),
                    //     contentPadding: const EdgeInsets.all(12),
                    //   ),
                    // ),
                    SizedBox(
                      height: 16,
                    ),
                  ],
                ),
              ),

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
                      'Jawaban Keamanan',
                      style: blackTextStyle.copyWith(
                        fontWeight: bold,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Masukan Jawabannya',
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
                      height: 30,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: TextButton(
                        onPressed: () {},
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
              SizedBox(
                height: 30,
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  'Login Tanpa Akun?',
                  style: GoogleFonts.mali().copyWith(
                    fontSize: 18,
                    fontWeight: bold,
                    color: primaryColor,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
