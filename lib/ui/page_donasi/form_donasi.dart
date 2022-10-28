import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../theme/theme.dart';
import '../page_payment/metode_payment.dart';

class FormDonasi extends StatefulWidget {
  const FormDonasi({Key? key}) : super(key: key);

  @override
  State<FormDonasi> createState() => _FormDonasiState();
}

class _FormDonasiState extends State<FormDonasi> {
  bool isSwitched = false;

  var currenccyFormater = CurrencyTextInputFormatter(
    locale: 'id',
    decimalDigits: 0,
    symbol: 'Rp. ',
  );

  // bool _isSelected = false;

  int _selectedIndex = 0;
  List<String> _options = [
    'Rp. 10.000',
    'Rp. 25.000',
    'Rp. 50.000',
    'Rp. 70.000',
    'Rp. 85.000',
    'Rp. 100.000',
  ];

  // Widget _buildChips() {
  //   List<Widget> chips = [];

  //   for (int i = 0; i < _options.length; i++) {
  //     ChoiceChip choiceChip = ChoiceChip(
  //       selected: _selectedIndex == i,
  //       label: Text(_options[i],
  //           style: GoogleFonts.beVietnamPro().copyWith(
  //             fontSize: 16,
  //             fontWeight: bold,
  //             color: Colors.white,
  //           )),
  //       avatar: Image.asset(
  //         'assets/img/img_ic_chip.png',
  //       ),
  //       padding: const EdgeInsets.all(8),
  //       elevation: 5,
  //       pressElevation: 0,
  //       shadowColor: Colors.teal,
  //       backgroundColor: Colors.black54,
  //       selectedColor: primaryColor,
  //       onSelected: (bool selected) {
  //         setState(() {
  //           if (selected) {
  //             _selectedIndex = i;
  //           }
  //         });
  //       },
  //     );
  //
  //     chips.add(Padding(
  //         padding: EdgeInsets.symmetric(horizontal: 10), child: choiceChip));
  //   }
  //
  //   return ListView(
  //     // This next line does the trick.
  //     scrollDirection: Axis.horizontal,
  //     children: chips,
  //   );
  // }

  // final listChoices = <ItemChoice>[
  //   ItemChoice(1,'Rp.  10.000'),
  //   ItemChoice(2,'Rp.  30.000'),
  //   ItemChoice(3,'Rp.  50.000'),
  //   ItemChoice(4,'Rp.  100.000'),
  // ];
  //
  // var idSelected =0;

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
                    //     builder: (context) => const HomePage(),
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
                        'Form Donasi',
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
                      'DONASI',
                      style: GoogleFonts.mali().copyWith(
                        fontSize: 24,
                        fontWeight: extraBold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'Silahkan isi form untuk Berdonasi',
                      style: GoogleFonts.beVietnamPro(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Container(
                      width: 200,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: primaryColor,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Nama Donatur',
                            style: GoogleFonts.beVietnamPro(
                              fontSize: 14,
                              fontWeight: bold,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Masukan nama Anda',
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
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Atasnama Hamba Allah',
                                style: GoogleFonts.beVietnamPro(
                                  fontSize: 14,
                                  fontWeight: bold,
                                ),
                              ),
                              Switch(
                                value: isSwitched,
                                onChanged: (value) {
                                  setState(
                                    () {
                                      isSwitched = value;
                                    },
                                  );
                                },
                                activeColor: primaryColor,
                                activeTrackColor: primaryColor,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Nominal Donasi',
                            style: GoogleFonts.beVietnamPro(
                              fontSize: 14,
                              fontWeight: bold,
                            ),
                          ),
                          // SizedBox(
                          //     height: 100,
                          //     width: MediaQuery.of(context).size.width,
                          //     child: _buildChips()),

                          SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Wrap(
                                spacing: 8.0, // gap between adjacent chips
                                runSpacing: 4.0,
                                children: _options.map((e) => ChoiceChip(
                                  selected: _selectedIndex == _options.indexOf(e),
                                  label: Text(e,
                                      style: GoogleFonts.beVietnamPro().copyWith(
                                        fontSize: 16,
                                        fontWeight: bold,
                                        color: Colors.white,
                                      )),
                                  avatar: Image.asset(
                                    'assets/img/img_ic_chip.png',
                                  ),
                                  padding: const EdgeInsets.all(8),
                                  elevation: 5,
                                  pressElevation: 0,
                                  shadowColor: Colors.teal,
                                  backgroundColor: Colors.black54,
                                  selectedColor: primaryColor,
                                  onSelected: (bool selected) {
                                    setState(() {
                                      if (selected) {
                                        // _selectedIndex = i;
                                        _selectedIndex = _options.indexOf(e);
                                      }
                                    });
                                  },
                                )).toList(),
                              )),


                          // GridView.builder(
                          //   shrinkWrap: true,
                          //   physics: const NeverScrollableScrollPhysics(),
                          //   gridDelegate:
                          //       SliverGridDelegateWithFixedCrossAxisCount(
                          //     crossAxisCount: 3,
                          //   ),
                          //   itemCount: 6,
                          //   itemBuilder: (context, index) {
                          //     return ChoiceChip(
                          //       padding: const EdgeInsets.all(8),
                          //       avatar: Image.asset(
                          //         'assets/img/img_ic_chip.png',
                          //         width: 30,
                          //       ),
                          //       label: Text(
                          //         '10.000',
                          //         style: GoogleFonts.beVietnamPro().copyWith(
                          //           fontSize: 18,
                          //           fontWeight: bold,
                          //           color: Colors.white,
                          //         ),
                          //       ),
                          //       selected: _isSelected,
                          //       backgroundColor: primaryColor,
                          //       onSelected: (newBoolValue) {
                          //         setState(() {
                          //           _isSelected = newBoolValue;
                          //         });
                          //       },
                          //     );
                          //   },
                          // ),
                          const SizedBox(
                            height: 8,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Nominal Lain',
                            style: GoogleFonts.beVietnamPro(
                              fontSize: 14,
                              fontWeight: bold,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          TextFormField(
                            inputFormatters: [currenccyFormater],
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: 'Rp. ',
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
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(
                                height: 50,
                              ),
                              Expanded(
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (contex) => DetailPayment(),
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
                                        'assets/img/img_ic_donasiskr.png',
                                        width: 30,
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Text(
                                        'DONASI SEKARANG',
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
            ],
          ),
        ),
      ),
    );
  }
}

// class ItemChoice {
//   final int id;
//   final String label;
//
//   ItemChoice(this.id, this.label);
