import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:jabar_sejahtera/constant/app_constant.dart';
import 'package:jabar_sejahtera/data/model/donation_model.dart';
import 'package:jabar_sejahtera/data/storage_manager.dart';
import 'package:jabar_sejahtera/ui/donasi/detail_donasi.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../theme/theme.dart';

class PageDonasi extends StatefulWidget {
  const PageDonasi({Key? key}) : super(key: key);

  @override
  State<PageDonasi> createState() => _PageDonasiState();
}

class _PageDonasiState extends State<PageDonasi> {
  var currencyFormater = CurrencyTextInputFormatter(
    locale: 'id',
    decimalDigits: 0,
    symbol: 'Rp. ',
  );

  var numberFormat = NumberFormat.simpleCurrency(decimalDigits: 0);

  final _dio = Dio();
  var storage = StorageManager();

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final totalbudgetController = TextEditingController();
  final imageController = TextEditingController();
  final categoryController = TextEditingController();
  final tanggalController = TextEditingController();
  final totalController = TextEditingController();
  final transactionController = TextEditingController();
  final locationController = TextEditingController();

  DonationModel? donationModel;

  bool isLoading = false;

  @override
  void initState() {
    _dio.options = BaseOptions(baseUrl: AppConstant.baseUrl);
    listDonasi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                      'Program Donasi',
                      style: GoogleFonts.mali().copyWith(
                        fontSize: 20,
                        fontWeight: bold,
                        color: listColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                style: GoogleFonts.beVietnamPro().copyWith(
                  fontSize: 14,
                ),
                onChanged: (value) {},
                decoration: InputDecoration(
                  hintText: 'Cari Program Donasi',
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Icon(
                      Icons.search,
                      color: primaryColor,
                      size: 25,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      width: 2,
                      color: primaryColor,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: primaryColor,
                      width: 2,
                    ),
                  ),
                ),
              ),
            ),

            /// item list donasi
            donationModel != null
                ? Expanded(
                  child: ListView.builder(
                      primary: false,
                      shrinkWrap: true,
                      itemCount: donationModel?.data?.length,
                      itemBuilder: (context, index) => SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (contex) => DetailDonasi(
                                      index: index,
                                      donationModel: donationModel?.data?[index],
                                    ),
                                  ),
                                );
                              },
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.network(
                                    donationModel?.data?[index].image ?? "https://",
                                    height: 150,
                                    width: 150,
                                  ),
                                  Card(
                                    shape: Border.all(
                                      width: 2,
                                      color: primaryColor,
                                    ),
                                    elevation: 8,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: MediaQuery.of(context).size.width - 175,
                                            child: Text(
                                              donationModel?.data?[index].title ?? "-",
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.beVietnamPro()
                                                  .copyWith(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.pin_drop,
                                                size: 20,
                                              ),
                                              Text(
                                                donationModel?.data?[index].location ?? "-",
                                                overflow: TextOverflow.ellipsis,
                                                style: GoogleFonts.beVietnamPro()
                                                    .copyWith(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          LinearPercentIndicator(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.55,
                                            animation: true,
                                            lineHeight: 15.0,
                                            animationDuration: 1000,
                                            percent: double.parse(donationModel?.data?[index].totalCollected.toString() ?? "0") / double.parse( donationModel?.data?[index].totalBudget.toString() ?? "0") > 1 ? 1.0 : double.parse(donationModel?.data?[index].totalCollected.toString() ?? "0") / double.parse( donationModel?.data?[index].totalBudget.toString() ?? "0"),
                                            center: Text(
                                              "${NumberFormat("###.##").format(double.parse(donationModel?.data?[index].totalCollected.toString() ?? "0") / double.parse( donationModel?.data?[index].totalBudget.toString() ?? "0") * 100)}%",
                                              style: GoogleFonts.beVietnamPro()
                                                  .copyWith(
                                                fontSize: 12,
                                                fontWeight: bold,
                                              ),
                                            ),
                                            // linearStrokeCap:
                                            //     LinearStrokeCap.roundAll,
                                            barRadius: const Radius.circular(10),
                                            progressColor: primaryColor,
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.55,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Terkumpul',
                                                      style: GoogleFonts
                                                              .beVietnamPro()
                                                          .copyWith(
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text(
                                                      currencyFormater.format(donationModel?.data?[index].totalCollected.toString() ?? "0").toString(),
                                                      style: GoogleFonts
                                                              .beVietnamPro()
                                                          .copyWith(
                                                        fontSize: 12,
                                                        fontWeight: bold,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Text(
                                                      'Dibutuhkan',
                                                      style: GoogleFonts
                                                              .beVietnamPro()
                                                          .copyWith(
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text(
                                                     currencyFormater.format(donationModel?.data?[index].totalBudget.toString() ?? "-"),
                                                      style: GoogleFonts
                                                              .beVietnamPro()
                                                          .copyWith(
                                                        fontSize: 12,
                                                        fontWeight: bold,
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
                                ],
                              ),
                            ),
                          )),
                )
                : const CircularProgressIndicator.adaptive()
          ],
        ),
      ),
    );
  }

  void listDonasi() async {
    setState(() {
      isLoading = true;
    });
    try {
      var response = await _dio.get("/donations",
          options: Options(headers: {"Accept": "application/json"}));
      print(response.data);
      donationModel = DonationModel.fromJson(response.data);
      setState(() {});
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
