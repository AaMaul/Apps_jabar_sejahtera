import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:jabar_sejahtera/constant/app_constant.dart';
import 'package:jabar_sejahtera/data/model/donation_model.dart';
import 'package:jabar_sejahtera/data/storage_manager.dart';
import 'package:jabar_sejahtera/theme/theme.dart';
import 'package:jabar_sejahtera/ui/donasi/form_donasi.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class DetailDonasi extends StatefulWidget {
  final int index;
  final Data? donationModel;

  const DetailDonasi({
    Key? key,
    required this.index, required this.donationModel,
  }) : super(key: key);

  @override
  State<DetailDonasi> createState() => _DetailDonasiState();
}

class _DetailDonasiState extends State<DetailDonasi> {
  var currencyFormater = CurrencyTextInputFormatter(
    locale: 'id',
    decimalDigits: 0,
    symbol: 'Rp. ',
  );

  var numberFormat = NumberFormat.simpleCurrency(decimalDigits: 0);

  final _dio = Dio();
  var storage = StorageManager();
  // DonationModel? donationModel;

  bool isLoading = false;

  @override
  void initState() {
    _dio.options = BaseOptions(baseUrl: AppConstant.baseUrl);
    // detailDonasi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.arrow_back,
                              color: listColor,
                              size: 35,
                            ),
                            Text(
                              'Detail Donasi',
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
                    Container(
                      padding: const EdgeInsets.only(
                        right: 5,
                        left: 5,
                      ),
                      child: Image.network(
                        // loadingBuilder: (context, child, loadingProgress) => CircularProgressIndicator(),
                        widget.donationModel?.image ?? "",
                        width: 250,
                        height: 250,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          width: 1,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.donationModel?.title ?? "",
                              style: GoogleFonts.beVietnamPro().copyWith(
                                fontSize: 18,
                                fontWeight: bold,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.pin_drop,
                                  size: 25,
                                ),
                                Text(
                                  widget.donationModel?.location ?? "",
                                  style: GoogleFonts.beVietnamPro()
                                      .copyWith(fontSize: 14, fontWeight: bold),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            LinearPercentIndicator(
                              width: MediaQuery.of(context).size.width * 0.90,
                              animation: true,
                              lineHeight: 15.0,
                              animationDuration: 1000,
                              percent: double.parse(widget.donationModel?.totalCollected.toString() ?? "0") / double.parse(widget.donationModel?.totalBudget.toString() ?? "0") > 1 ? 1.0 : double.parse(widget.donationModel?.totalCollected.toString() ?? "0") / double.parse(widget.donationModel?.totalBudget.toString() ?? "0"),
                              center: Text(
                                "${NumberFormat("###.##").format(double.parse(widget.donationModel?.totalCollected.toString() ?? "0") / double.parse(widget.donationModel?.totalBudget.toString() ?? "0") * 100)}%",
                                style: GoogleFonts.beVietnamPro().copyWith(
                                  fontSize: 12,
                                  fontWeight: bold,
                                ),
                              ),
                              progressColor: primaryColor,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Terkumpul',
                                      style:
                                          GoogleFonts.beVietnamPro().copyWith(
                                        fontSize: 14,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      currencyFormater
                                          .format(widget.donationModel?.totalCollected.toString() ?? "0")
                                          .toString(),
                                      style: GoogleFonts.beVietnamPro()
                                          .copyWith(
                                              fontSize: 14, fontWeight: bold),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      'dibutuhkan',
                                      style:
                                          GoogleFonts.beVietnamPro().copyWith(
                                        fontSize: 14,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      currencyFormater.format(widget.donationModel?.totalBudget.toString() ?? "-"),
                                      style: GoogleFonts.beVietnamPro()
                                          .copyWith(
                                              fontSize: 14, fontWeight: bold),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.only(
                        left: 10,
                        right: 10,
                      ),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 1),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Penjelasan',
                            style: GoogleFonts.beVietnamPro().copyWith(
                              fontSize: 14,
                              fontWeight: bold,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            widget.donationModel?.description ??
                                "_",
                            textAlign: TextAlign.justify,
                            // 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing'
                            // 'software like Aldus PageMaker including versions of Lorem Ipsum',
                            style: GoogleFonts.beVietnamPro().copyWith(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const FormDonasi(),
                            ),
                          );
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
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
                              width: 10,
                            ),
                            Text(
                              'DONASi SEKARANG',
                              style: GoogleFonts.mali().copyWith(
                                fontSize: 18,
                                fontWeight: bold,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  // void detailDonasi() async {
  //   setState(() {
  //     isLoading = true;
  //   });
  //   try {
  //     var response = await _dio.get("/donations",
  //         options: Options(headers: {"Accept": "application/json"}));
  //     print(response.data);
  //     donationModel = DonationModel.fromJson(response.data);
  //     setState(() {});
  //   } on DioError catch (e) {
  //     print(e.response?.data);
  //     setState(() {
  //       isLoading = false;
  //     });
  //     String errorMessage = "";
  //     if (e.response?.statusCode != 200) {
  //       errorMessage = e.message;
  //     }
  //   }
  // }
}
