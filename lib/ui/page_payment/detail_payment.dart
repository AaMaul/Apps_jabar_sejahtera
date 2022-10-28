import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jabar_sejahtera/ui/page_payment/screen_proses.dart';

import '../../theme/theme.dart';

class DetailPembayaran extends StatelessWidget {
  final String image;

  const DetailPembayaran({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: primaryColor,
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
          'Detail Pembayaran',
          style: GoogleFonts.mali().copyWith(
            fontSize: 20,
            fontWeight: bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            image,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    width: 2,
                    color: Colors.white,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'No Virtual Account',
                      style: GoogleFonts.beVietnamPro().copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '98758392984792',
                      style: GoogleFonts.beVietnamPro().copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    width: 2,
                    color: Colors.white,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Lakukan Pembayaran dalam :',
                      style: GoogleFonts.beVietnamPro().copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      '23:59:59',
                      style: GoogleFonts.beVietnamPro().copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.brown,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'No Pembayaran\nTotal Pembayaran',
                              style: GoogleFonts.beVietnamPro().copyWith(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: bold,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              ':\n:',
                              style: GoogleFonts.beVietnamPro().copyWith(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: bold,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              '3023232424\nRp. 175.000,-',
                              style: GoogleFonts.beVietnamPro().copyWith(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                width: 100,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 2,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Cara Pembayaran :',
                          style: GoogleFonts.beVietnamPro().copyWith(
                            fontSize: 14,
                            fontWeight: bold,
                            color: Colors.white,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              'M-Bangking\n1. Buka Aplikasi M-Banking Anda'
                              '\n2. Masuk menu M-Transfer,'
                              '\n3. Pilih BCA Virtual Account,'
                              '\n4. Masukan Kode VA,'
                              '\n5. Pastikan tidak salah inpit no VA',
                              style: GoogleFonts.beVietnamPro().copyWith(
                                fontSize: 14,
                                fontWeight: bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Text(
                              'Transfer ATM\n1. Buka Aplikasi M-Banking Anda'
                              '\n2. Masuk menu M-Transfer,'
                              '\n3. Pilih BCA Virtual Account,'
                              '\n4. Masukan Kode VA,'
                              '\n5. Pastikan tidak salah inpit no VA',
                              style: GoogleFonts.beVietnamPro().copyWith(
                                fontSize: 14,
                                fontWeight: bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            width: 100,
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProsesPembayaran(),
                  ),
                );
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'OK',
                    style: GoogleFonts.mali().copyWith(
                      fontSize: 18,
                      fontWeight: bold,
                      color: primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
