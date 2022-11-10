import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:dio/dio.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:jabar_sejahtera/constant/app_constant.dart';
import 'package:jabar_sejahtera/data/model/pemasukan_donasi_model.dart';
import 'package:jabar_sejahtera/data/storage_manager.dart';
import 'package:jabar_sejahtera/theme/theme.dart';
import 'package:lottie/lottie.dart';

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

  PemasukanDonasiModel? pemasukanDonasiModel;
  bool isLoading = false;

  @override
  void initState() {
    _dio.options = BaseOptions(baseUrl: AppConstant.baseUrl);
    getListPemasukanDonasi();
    inputStartDate.text = DateFormat("dd-MM-yyyy").format(DateTime.now().subtract(const Duration(days: 7)));
    inputEndDate.text = DateFormat("dd-MM-yyyy").format(DateTime.now());
    super.initState();
  }

  String hint = 'Pilih Jenis Pemasukan';
  final List<String> items = [
    'Zakat',
    'Donasi',
  ];
  String? selectedValue = "Donasi";

  TextEditingController inputStartDate = TextEditingController();
  TextEditingController inputEndDate = TextEditingController();

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
                    hint: Text(selectedValue ?? items.first),
                    dropdownDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    // value: items.first,
                    items: items
                        .map((item) => DropdownMenuItem<String>(
                            value: item, child: Text(item)))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value;
                        getListPemasukanDonasi();
                      });
                    }),
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
                              controller: inputStartDate,
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
                                    inputStartDate.text = formattedDate;
                                  });
                                } else {
                                  print("Date is not selected");
                                }
                                getListPemasukanDonasi();
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
                              controller: inputEndDate,
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
                                    inputEndDate.text = formattedDate;
                                  });
                                } else {
                                  print("Date is not selected");
                                }
                                getListPemasukanDonasi();
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                isLoading?Lottie.asset("assets/vector/loading_data.json"): pemasukanDonasiModel?.data?.isNotEmpty == true ? ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    children: pemasukanDonasiModel?.data?.map((e) => Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 50,
                              child: Text(
                                '${e.id}',
                                style: GoogleFonts.beVietnamPro().copyWith(
                                  fontSize: 14,
                                  fontWeight: bold,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Flexible(
                              flex: 3,
                              child: Text(
                                e.createdAt ??
                                    '',
                                style: GoogleFonts.beVietnamPro().copyWith(
                                  fontSize: 14,
                                  fontWeight: bold,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.33,
                              child: Text(
                                e.name ?? '',
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.beVietnamPro().copyWith(
                                  fontSize: 14,
                                  fontWeight: bold,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              flex: 3,
                              child: Text(
                                currencyFormater
                                    .format(e.nominal
                                    .toString() ??
                                    '0')
                                    .toString(),
                                style: GoogleFonts.beVietnamPro().copyWith(
                                  fontSize: 14,
                                  fontWeight: bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )).toList() ?? [],
                    // itemCount: pemasukanDonasiModel?.data?.length,
                    // itemBuilder: (context, index) {
                    //   return ;
                    // }),
                ) : Lottie.asset("assets/vector/loading_nodata.json"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void getListPemasukanDonasi() async {
    setState(() {
      isLoading = true;
    });
    try {
      var response = await _dio.get("/reports/${selectedValue == "Zakat" ? "zakat": "donation"}",
          queryParameters: {
            "start_date": inputStartDate.text,
            "end_date": inputEndDate.text,
          },
          options: Options(headers: {"Accept": "application/json"}));
      print(response.realUri.toString());
      print(response.data);
      setState(() {
        pemasukanDonasiModel = PemasukanDonasiModel.fromJson(response.data);
        isLoading = false;
      });
    } on DioError catch (e) {
      print(e.response?.data);
      setState(() {
        isLoading = false;
      });
      String errorMessage = "";
      if (e.response?.statusCode != 200) {
        errorMessage = e.message;
      }
    }
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
