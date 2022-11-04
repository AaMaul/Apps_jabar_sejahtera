import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:dio/dio.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:jabar_sejahtera/constant/app_constant.dart';
import 'package:jabar_sejahtera/data/storage_manager.dart';
import 'package:jabar_sejahtera/theme/theme.dart';

class LaporanPemasukan extends StatefulWidget {
  const LaporanPemasukan({Key? key}) : super(key: key);

  @override
  State<LaporanPemasukan> createState() => _LaporanPemasukanState();
}

class _LaporanPemasukanState extends State<LaporanPemasukan> {
  var currencyFormater = CurrencyTextInputFormatter(
    locale: 'id',
    decimalDigits: 0,
    symbol: 'Rp. ',
  );

  final _dio = Dio();
  final storage = StorageManager();

  String hint = 'Pilih Jenis Pemasukan';
  final List<String> items = [
    'Zakat',
    'Donasi',
  ];
  String? selectedValue;

  TextEditingController dateinput = TextEditingController();
  TextEditingController dateinput1 = TextEditingController();

  @override
  void initState() {
    dateinput.text = "Pilih Date";
    dateinput1.text = "Pilih Date";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                DropdownButtonFormField2(
                    dropdownPadding: const EdgeInsets.all(10),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: BorderSide(
                            width: 2,
                            color: primaryColor,
                          )),
                    ),
                    isExpanded: true,
                    hint: Text(hint),
                    dropdownDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    items: items
                        .map((item) => DropdownMenuItem<String>(
                            value: item, child: Text(item)))
                        .toList(),
                    onChanged: (value) {}),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Dari Tanggal',
                            style: GoogleFonts.beVietnamPro().copyWith(
                              fontSize: 14,
                              fontWeight: bold,
                            ),
                          ),
                          SizedBox(
                            height: 75,
                            width: 150,
                            child: TextFormField(
                              controller: dateinput,
                              decoration: const InputDecoration(
                                icon: Icon(Icons.calendar_month_rounded),
                              ),
                              readOnly: true,
                              onTap: () async {
                                DateTime? pickeDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2101));
                                if (pickeDate != null) {
                                  print(pickeDate);
                                  String formattedDate =
                                      DateFormat('dd-MM-yyyy')
                                          .format(pickeDate);
                                  print(formattedDate);
                                  setState(() {
                                    dateinput.text = formattedDate;
                                  });
                                } else {
                                  print("Date is not selected");
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            'Sampai Tanggal',
                            style: GoogleFonts.beVietnamPro().copyWith(
                              fontSize: 14,
                              fontWeight: bold,
                            ),
                          ),
                          SizedBox(
                            height: 75,
                            width: 150,
                            child: TextFormField(
                              controller: dateinput1,
                              decoration: const InputDecoration(
                                icon: Icon(Icons.calendar_month_rounded),
                              ),
                              readOnly: true,
                              onTap: () async {
                                DateTime? pickeDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2101));
                                if (pickeDate != null) {
                                  print(pickeDate);
                                  String formattedDate =
                                      DateFormat('dd-MM-yyyy')
                                          .format(pickeDate);
                                  print(formattedDate);
                                  setState(() {
                                    dateinput1.text = formattedDate;
                                  });
                                } else {
                                  print("Date is not selected");
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: AppConstant.listPemasukan.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                AppConstant.listPemasukan[index]['no']!,
                                style: GoogleFonts.beVietnamPro().copyWith(
                                  fontSize: 14,
                                  fontWeight: bold,
                                ),
                              ),
                              Text(
                                AppConstant.listPemasukan[index]['tgl']!,
                                style: GoogleFonts.beVietnamPro().copyWith(
                                  fontSize: 14,
                                  fontWeight: bold,
                                ),
                              ),
                              Text(
                                AppConstant.listPemasukan[index]['pemasukan']!,
                                style: GoogleFonts.beVietnamPro().copyWith(
                                  fontSize: 14,
                                  fontWeight: bold,
                                ),
                              ),
                              Text(
                                AppConstant.listPemasukan[index]['nominal']!,
                                style: GoogleFonts.beVietnamPro().copyWith(
                                  fontSize: 14,
                                  fontWeight: bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// DropdownButtonFormField(
//   decoration: InputDecoration(
//     border: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(14),
//     ),
//   ),
//   isExpanded: false,
//   hint: Text(hint),
//   items: items
//       .map((item) => DropdownMenuItem<String>(
//       value: item, child: Text(item)))
//       .toList(),
//   onChanged: (value) {},
