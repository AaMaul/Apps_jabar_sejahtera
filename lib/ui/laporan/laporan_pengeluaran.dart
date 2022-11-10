import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:jabar_sejahtera/data/model/pengeluaran_model.dart';
import 'package:jabar_sejahtera/data/storage_manager.dart';
import 'package:lottie/lottie.dart';

import '../../constant/app_constant.dart';
import '../../theme/theme.dart';

class LaporanPengeluaran extends StatefulWidget {
  const LaporanPengeluaran({Key? key}) : super(key: key);

  @override
  State<LaporanPengeluaran> createState() => _LaporanPengeluaranState();
}

class _LaporanPengeluaranState extends State<LaporanPengeluaran> {
  // String hint = 'Pilih Jenis Pengeluaran';
  // final List<String> items = [
  //   'Zakat',
  //   'Donasi',
  // ];
  var currencyFormater = CurrencyTextInputFormatter(
    locale: 'id',
    decimalDigits: 0,
    symbol: 'Rp. ',
  );

  final _dio = Dio();
  final storage = StorageManager();

  PengeluaranModel? pengeluaranModel;
  bool isLoading = false;


  String? selectedValue;

  TextEditingController dateiMulai = TextEditingController();
  TextEditingController dateTarget = TextEditingController();


  @override
  void initState() {
    _dio.options = BaseOptions(baseUrl: AppConstant.baseUrl);
    getListPengeluaran();
    dateiMulai.text = DateFormat("dd-MM-yyyy").format(DateTime.now().subtract(const Duration(days: 7)));
    dateTarget.text = DateFormat("dd-MM-yyyy").format(DateTime.now());
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
                // DropdownButtonFormField2(
                //     dropdownPadding: const EdgeInsets.all(10),
                //     decoration: InputDecoration(
                //       border: OutlineInputBorder(
                //           borderRadius: BorderRadius.circular(14),
                //           borderSide: BorderSide(
                //             width: 2,
                //             color: primaryColor,
                //           )),
                //     ),
                //     isExpanded: true,
                //     hint: Text(hint),
                //     dropdownDecoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(10),
                //     ),
                //     items: items
                //         .map((item) => DropdownMenuItem<String>(
                //         value: item, child: Text(item)))
                //         .toList(),
                //     onChanged: (value) {}),
                // const SizedBox(
                //   height: 15,
                // ),
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
                            height: 70,
                            width: 150,
                            child: TextFormField(
                              controller: dateiMulai,
                              decoration: const InputDecoration(
                                icon: Icon(Icons.calendar_month_rounded),
                              ),
                              readOnly: true,
                              onTap: () async {
                                DateTime? pickeDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2101)
                                );
                                if(pickeDate !=null) {
                                  print(pickeDate);
                                  String formattedDate = DateFormat('dd-MM-yyyy').format(pickeDate);
                                  print(formattedDate);
                                  setState(() {
                                    dateiMulai.text = formattedDate;
                                  });
                                }else{
                                  print("Date is not selected");
                                }
                                getListPengeluaran();
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
                            height: 70,
                            width: 150,
                            child: TextFormField(
                              controller: dateTarget,
                              decoration: const InputDecoration(
                                icon: Icon(Icons.calendar_month_rounded),
                              ),
                              readOnly: true,
                              onTap: () async {
                                DateTime? pickeDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2101)
                                );
                                if(pickeDate !=null) {
                                  print(pickeDate);
                                  String formattedDate = DateFormat('dd-MM-yyyy').format(pickeDate);
                                  print(formattedDate);
                                  setState(() {
                                    dateTarget.text = formattedDate;
                                  });
                                }else{
                                  print("Date is not selected");
                                }
                                getListPengeluaran();
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                isLoading?Lottie.asset("assets/vector/loading_data.json"): pengeluaranModel?.data?.isNotEmpty == true ? ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    children: pengeluaranModel?.data?.map((e) => Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              width: 30,
                              child: Text(
                                '${e.id}',
                                style: GoogleFonts.beVietnamPro().copyWith(
                                  fontSize: 14,
                                  fontWeight: bold,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8,),
                            Flexible(
                              flex: 3,
                              child: Text(
                                e.donation?.date ?? '',
                                style: GoogleFonts.beVietnamPro().copyWith(
                                  fontSize: 14,
                                  fontWeight: bold,
                                ),
                              ),
                            ),
                            SizedBox(width: 10,),
                            SizedBox(
                              width: MediaQuery.of(context).size.width *0.33,
                              child: Text(
                                e.name ?? '',
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.beVietnamPro().copyWith(
                                  fontSize: 14,
                                  fontWeight: bold,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10,),
                            Flexible(
                              flex: 3,
                              child: Text(
                                currencyFormater.format(e.nominal.toString()?? '0').toString(),
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
                    ) : Lottie.asset("assets/vector/loading_nodata.json"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void getListPengeluaran() async {
    setState(() {
      isLoading = true;
    });
    try {
      var response = await _dio.get("/reports/expend",
          queryParameters: {
            "start_date": dateiMulai.text,
            "end_date": dateTarget.text,
          },
          options: Options(headers: {"Accept": "application/json"}));
      print(response.realUri.toString());
      print(response.data);
      setState(() {
        pengeluaranModel = PengeluaranModel.fromJson(response.data);
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
