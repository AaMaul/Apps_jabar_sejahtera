import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jabar_sejahtera/constant/app_constant.dart';
import 'package:jabar_sejahtera/data/storage_manager.dart';
import 'package:jabar_sejahtera/theme/theme.dart';
import 'package:jabar_sejahtera/ui/payment/detail_payment.dart';

class MetodePayment extends StatefulWidget {
  final totalBayar;
  const MetodePayment({Key? key, required this.totalBayar}) : super(key: key);

  @override
  State<MetodePayment> createState() => _MetodePaymentState();
}


class _MetodePaymentState extends State<MetodePayment> {
  final _dio = Dio();
  final storage = StorageManager();
  final totalBayarController = TextEditingController();

  var currencyFormater = CurrencyTextInputFormatter(
    locale: 'id',
    decimalDigits: 0,
    symbol: 'Rp. ',
  );

  @override
  void initState() {
    super.initState();
    totalBayarController.text = currencyFormater.format(widget.totalBayar.toString());
    _dio.options = BaseOptions(
      baseUrl: AppConstant.baseUrl
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
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
          'Metode Pembayaran',
          style: GoogleFonts.mali().copyWith(
            fontSize: 20,
            fontWeight: bold,
            color: listColor,
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Card(
              color: primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Total Pembayaran',
                    style: GoogleFonts.mali().copyWith(
                      fontSize: 20,
                      fontWeight: extraBold,
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset(
                        'assets/img/img_ic_pembayaran.png',
                      ),
                      Text(
                        currencyFormater.format(widget.totalBayar.toString()),
                        // 'Rp. 175.000',
                        style: GoogleFonts.beVietnamPro().copyWith(
                          fontSize: 30,
                          fontWeight: extraBold,
                          color: Colors.white,
                        ),
                      ),
                      Image.asset(
                        'assets/img/img_ic_pembayaran.png',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              padding: const EdgeInsets.all(5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Pembayaran E-Wallet',
                    style: GoogleFonts.mali().copyWith(
                      fontSize: 16,
                      fontWeight: bold,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: AppConstant.listWallet.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailPembayaran(
                                    image: AppConstant.listWallet[index],
                                  ),
                                ),
                              );
                            },
                            child: Image.asset(
                                width: 80, AppConstant.listWallet[index]),
                          ),
                        );
                      },
                    ),
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //   children: [
                  //     GestureDetector(
                  //       onTap: () {
                  //         Navigator.push(
                  //           context,
                  //           MaterialPageRoute(
                  //             builder: (context) => DetailPembayaran(
                  //               image: AppConstant.listWallet[0],
                  //             ),
                  //           ),
                  //         );
                  //       },
                  //       child: Image.asset(
                  //         AppConstant.listWallet[0],
                  //         width: 90,
                  //       ),
                  //     ),
                  //     Image.asset(
                  //       'assets/img/img_dana.png',
                  //       width: 90,
                  //     ),
                  //     Image.asset(
                  //       'assets/img/img_ovo.png',
                  //       width: 90,
                  //     ),
                  //     Image.asset(
                  //       'assets/img/img_shopeepay.png',
                  //       width: 90,
                  //     ),
                  //   ],
                  // ),
                  // const SizedBox(
                  //   height: 20,
                  // ),
                  Text(
                    'Pembayaran Virtual Acoount Bank',
                    style: GoogleFonts.mali().copyWith(
                      fontSize: 16,
                      fontWeight: bold,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: AppConstant.listVirtualAccount.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailPembayaran(
                                    image: AppConstant.listVirtualAccount[index],
                                  ),
                                ),
                              );
                            },
                            child: Image.asset(
                                width: 75, AppConstant.listVirtualAccount[index]),
                          ),
                        );
                      },
                    ),
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //   children: [
                  //     Image.asset(
                  //       'assets/img/img_bca.png',
                  //       width: 80,
                  //     ),
                  //     Image.asset(
                  //       'assets/img/img_bni.png',
                  //       width: 80,
                  //     ),
                  //     Image.asset(
                  //       'assets/img/img_bri.png',
                  //       width: 80,
                  //     ),
                  //     Image.asset(
                  //       'assets/img/img_mandiri.png',
                  //       width: 80,
                  //     ),
                  //   ],
                  // ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Pembayaran Bank Transfer',
                    style: GoogleFonts.mali().copyWith(
                      fontSize: 16,
                      fontWeight: bold,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: AppConstant.listBank.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailPembayaran(
                                    image: AppConstant.listBank[index],
                                  ),
                                ),
                              );
                            },
                            child: Image.asset(
                                width: 75, AppConstant.listBank[index]),
                          ),
                        );
                      },
                    ),
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //   children: [
                  //     Image.asset(
                  //       'assets/img/img_bca.png',
                  //       width: 80,
                  //     ),
                  //     Image.asset(
                  //       'assets/img/img_bni.png',
                  //       width: 80,
                  //     ),
                  //     Image.asset(
                  //       'assets/img/img_bri.png',
                  //       width: 80,
                  //     ),
                  //     Image.asset(
                  //       'assets/img/img_mandiri.png',
                  //       width: 80,
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
