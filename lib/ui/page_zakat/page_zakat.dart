import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jabar_sejahtera/theme/theme.dart';
import 'package:jabar_sejahtera/ui/kalkulator_zakat/kalkulator_zakat.dart';
import 'package:jabar_sejahtera/ui/page_payment/metode_payment.dart';

class PageZakat extends StatefulWidget {
  const PageZakat({Key? key}) : super(key: key);

  @override
  State<PageZakat> createState() => _PageZakatState();
}

class _PageZakatState extends State<PageZakat> {
  var currencyFormater = CurrencyTextInputFormatter(
    locale: 'id',
    decimalDigits: 0,
    symbol: 'Rp. ',
  );

  String tipeZakat = "Zakat Harta";

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
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => const MainPage(),
                    //   ),
                    // );
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.arrow_back,
                        color: listColor,
                        size: 35,
                      ),
                      Text(
                        'Form Zakat',
                        style: GoogleFonts.mali().copyWith(
                            fontSize: 20, fontWeight: bold, color: listColor),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                child: Column(
                  children: [
                    Text(
                      'ZAKAT',
                      style: GoogleFonts.mali().copyWith(
                        fontSize: 24,
                        fontWeight: extraBold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'Silahkan isi form untuk memulai berzakat',
                      style: GoogleFonts.beVietnamPro(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Container(
                      width: 50,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                          color: primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                padding: const EdgeInsets.only(right: 65, left: 65, top: 15),
                height: 120,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: primaryColor,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    Text(
                      'Hitung Zakat Telebih Dahulu',
                      style: GoogleFonts.mali().copyWith(
                        fontSize: 16,
                        fontWeight: bold,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PageKalkulator(),
                          ),
                        );
                      },
                      style: TextButton.styleFrom(
                        fixedSize: Size(115, 40),
                        backgroundColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 2, color: primaryColor),
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/img/img_ic_calculator_list.png',
                            width: 20,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            'HITUNG',
                            style: GoogleFonts.mali().copyWith(
                              fontSize: 16,
                              fontWeight: bold,
                              color: primaryColor,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nama Muzzaki',
                      style: GoogleFonts.beVietnamPro(
                          fontSize: 14, fontWeight: bold),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Masukan Nama Anda',
                        suffixIcon: Icon(
                          Icons.person,
                          color: primaryColor,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: BorderSide(
                            width: 1,
                            color: greyColor,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: BorderSide(
                            color: primaryColor,
                            width: 2,
                          ),
                        ),
                        contentPadding: const EdgeInsets.all(12),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Nominal Zakat',
                      style: GoogleFonts.beVietnamPro(
                          fontSize: 14, fontWeight: bold),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      inputFormatters: [currencyFormater],
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'Rp.',
                        suffixIcon: Icon(
                          Icons.money,
                          color: primaryColor,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: BorderSide(
                            width: 1,
                            color: greyColor,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: BorderSide(
                            color: primaryColor,
                            width: 2,
                          ),
                        ),
                        contentPadding: const EdgeInsets.all(12),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Jenis Jakat',
                      style: GoogleFonts.beVietnamPro(
                          fontSize: 14, fontWeight: bold),
                    ),
                    ListTile(
                      title: Text(
                        'Zakat Harta',
                        style: GoogleFonts.beVietnamPro().copyWith(
                          fontWeight: bold,
                          fontSize: 14,
                        ),
                      ),
                      leading: Radio(
                        activeColor: primaryColor,
                        value: "Zakat Harta",
                        groupValue: tipeZakat,
                        onChanged: (value) {
                          setState(() {
                            tipeZakat = value.toString();
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: Text(
                        'Zakat Penghasilan',
                        style: GoogleFonts.beVietnamPro().copyWith(
                          fontSize: 14,
                          fontWeight: bold,
                        ),
                      ),
                      leading: Radio(
                        activeColor: primaryColor,
                        value: "Zakat Penghasilan",
                        groupValue: tipeZakat,
                        onChanged: (value) {
                          setState(
                            () {
                              tipeZakat = value.toString();
                            },
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailPayment(),
                                ),
                              );
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/img/img_ic_byrzkt.png',
                                  width: 30,
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  'ZAKAT SEKARANG',
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
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
