import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jabar_sejahtera/theme/theme.dart';
import 'package:jabar_sejahtera/ui/zakat/page_zakat.dart';

class ZakatPenghasilan extends StatefulWidget {
  const ZakatPenghasilan({Key? key}) : super(key: key);

  @override
  State<ZakatPenghasilan> createState() => _ZakatPenghasilanState();
}

class _ZakatPenghasilanState extends State<ZakatPenghasilan> {
  var currencyFormater = CurrencyTextInputFormatter(
    locale: 'id',
    decimalDigits: 0,
    symbol: 'Rp. ',
  );

  var currencyFormater2 = CurrencyTextInputFormatter(
    locale: 'id',
    decimalDigits: 0,
    symbol: 'Rp. ',
  );

  var gajiFormater = CurrencyTextInputFormatter(
    locale: 'id',
    decimalDigits: 0,
    symbol: 'Rp. ',
  );

  var penghasilanFormater = CurrencyTextInputFormatter(
    locale: 'id',
    decimalDigits: 0,
    symbol: 'Rp. ',
  );

  var hutangFormater = CurrencyTextInputFormatter(
    locale: 'id',
    decimalDigits: 0,
    symbol: 'Rp. ',
  );

  var bersihFormater = CurrencyTextInputFormatter(
    locale: 'id',
    decimalDigits: 0,
    symbol: 'Rp. ',
  );

  var logamFormater = CurrencyTextInputFormatter(
    locale: 'id',
    decimalDigits: 0,
    symbol: 'Rp. ',
  );

  var x85Formater = CurrencyTextInputFormatter(
    locale: 'id',
    decimalDigits: 0,
    symbol: 'Rp. ',
  );

  var bagi12Formater = CurrencyTextInputFormatter(
    locale: 'id',
    decimalDigits: 0,
    symbol: 'Rp. ',
  );

  var harusBayarblnFormater = CurrencyTextInputFormatter(
    locale: 'id',
    decimalDigits: 0,
    symbol: 'Rp. ',
  );

  var harusBayartahunFormater = CurrencyTextInputFormatter(
    locale: 'id',
    decimalDigits: 0,
    symbol: 'Rp. ',
  );

  num totalPenghasilan = 0;
  num hargaEmas = 0;
  double bagiEmas =0;

  num gajiBulanan = 0;
  num gajiTambahan = 0;
  num hutang = 0;

  num perbulan = 0;
  num pertahun = 0;

  final hargaEmasController = TextEditingController();
  final totalPenghasilanController = TextEditingController();
  final bagi12Controller = TextEditingController();
  final perbulanController = TextEditingController();
  final pertahunController = TextEditingController();

  /// Total Harta / 12 bulan * 0.025
  ///

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Penghasilan Gaji Perbulan',
                  style: GoogleFonts.beVietnamPro()
                      .copyWith(fontSize: 14, fontWeight: bold),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  inputFormatters: [gajiFormater],
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      gajiBulanan = gajiFormater.getUnformattedValue();
                      totalPenghasilan = (gajiBulanan + gajiTambahan) - hutang;
                      totalPenghasilanController.text = hutangFormater.format(totalPenghasilan.toString());

                      perbulan = (totalPenghasilan / 12) * 0.025;
                      perbulanController.text = gajiFormater.format(perbulan.toInt().toString());

                      pertahun = totalPenghasilan * 0.025;
                      pertahunController.text = gajiFormater.format(pertahun.toInt().toString());
                    });
                  },
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
                    contentPadding: const EdgeInsets.all(12),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Penghasilan Tambahan Perbulan',
                  style: GoogleFonts.beVietnamPro()
                      .copyWith(fontSize: 14, fontWeight: bold),
                ),
                Text(
                  'Masukan keseluruhan penghasilan tambahan Anda',
                  style: GoogleFonts.beVietnamPro().copyWith(
                    fontSize: 12,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  inputFormatters: [penghasilanFormater],
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      gajiTambahan = penghasilanFormater.getUnformattedValue();
                      totalPenghasilan = (gajiBulanan + gajiTambahan) - hutang;
                      totalPenghasilanController.text = penghasilanFormater.format(totalPenghasilan.toString());

                      perbulan = (totalPenghasilan / 12) * 0.025;
                      perbulanController.text = gajiFormater.format(perbulan.toInt().toString());

                      pertahun = totalPenghasilan * 0.025;
                      pertahunController.text = gajiFormater.format(pertahun.toInt().toString());
                    });
                  },
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
                    contentPadding: const EdgeInsets.all(12),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Hutang Pribadi/Cicilan Perbulan',
                  style: GoogleFonts.beVietnamPro()
                      .copyWith(fontSize: 14, fontWeight: bold),
                ),
                Text(
                  'Masukan total hutang perbulan Anda',
                  style: GoogleFonts.beVietnamPro().copyWith(
                    fontSize: 12,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  inputFormatters: [hutangFormater],
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      hutang = hutangFormater.getUnformattedValue();
                      totalPenghasilan = (gajiBulanan + gajiTambahan) - hutang;
                      totalPenghasilanController.text = hutangFormater.format(totalPenghasilan.toString());

                      perbulan = (totalPenghasilan / 12) * 0.025;
                      perbulanController.text = gajiFormater.format(perbulan.toInt().toString());

                      pertahun = totalPenghasilan * 0.025;
                      pertahunController.text = gajiFormater.format(pertahun.toInt().toString());
                    });
                  },
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
                    contentPadding: const EdgeInsets.all(12),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Total Bersih Penghasilan',
                  style: GoogleFonts.beVietnamPro()
                      .copyWith(fontSize: 14, fontWeight: bold),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  enabled: false,
                  controller: totalPenghasilanController,
                  inputFormatters: [bersihFormater],
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Rp. ',
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide(
                        width: 2,
                        color: primaryColor,
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
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Harga Logam Muliah/Emas Saat ini',
                        style: GoogleFonts.beVietnamPro().copyWith(
                          fontSize: 14,
                          fontWeight: bold,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            flex: 4,
                            child: TextFormField(
                              onChanged: (value) {
                                setState(() {
                                  hargaEmas = logamFormater.getUnformattedValue() * 85;
                                  hargaEmasController.text = logamFormater.format(hargaEmas.toString());
                                  bagiEmas = hargaEmas / 12;
                                  bagi12Controller.text = bagi12Formater.format(bagiEmas.toInt().toString());


                                  perbulan = (totalPenghasilan / 12) * 0.025;
                                  perbulanController.text = gajiFormater.format(perbulan.toInt().toString());

                                  pertahun = totalPenghasilan * 0.025;
                                  pertahunController.text = gajiFormater.format(pertahun.toInt().toString());
                                });
                              },
                              inputFormatters: [logamFormater],
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: 'Rp.',
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
                          ),
                          Flexible(
                            flex: 1,
                            child: Text(
                              'X 85gr',
                              style: GoogleFonts.beVietnamPro().copyWith(
                                fontSize: 14,
                                fontWeight: bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            flex: 2,
                            child: TextFormField(
                              controller: hargaEmasController,
                              enabled: false,
                              inputFormatters: [x85Formater],
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: 'Rp.',
                                disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(14),
                                  borderSide: BorderSide(
                                    width: 2,
                                    color: primaryColor,
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
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Flexible(
                            flex: 1,
                            child: Text(
                              '/12 bulan',
                              style: GoogleFonts.beVietnamPro().copyWith(
                                fontSize: 14,
                                fontWeight: bold,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Flexible(
                            flex: 2,
                            child: TextFormField(
                              enabled: false,
                              controller: bagi12Controller,
                              inputFormatters: [bagi12Formater],
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: 'Rp.',
                                disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(14),
                                  borderSide: BorderSide(
                                    width: 2,
                                    color: primaryColor,
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
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
            Visibility(
              visible: (totalPenghasilan != 0 && hargaEmas != 0) && totalPenghasilan < hargaEmas == true,
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    width: 2,
                    color: primaryColor,
                  ),
                  color: Colors.transparent,
                ),
                child: Text(
                  'ANDA TIDAK WAJIB ZAKAT',
                  style: GoogleFonts.mali().copyWith(
                    fontSize: 18,
                    fontWeight: bold,
                    color: primaryColor,
                  ),
                ),
              ),
            ),
            Visibility(
              visible: (totalPenghasilan != 0 && hargaEmas != 0) && totalPenghasilan > hargaEmas == true,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        width: 2,
                        color: primaryColor,
                      ),
                      color: Colors.transparent,
                    ),
                    child: Text(
                      'ANDA WAJIB ZAKAT',
                      style: GoogleFonts.mali().copyWith(
                        fontSize: 18,
                        fontWeight: bold,
                        color: primaryColor,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Zakat yang harus dibayarkan/bulan',
                    style: GoogleFonts.beVietnamPro()
                        .copyWith(fontSize: 14, fontWeight: bold),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    enabled: false,
                    controller: perbulanController,
                    inputFormatters: [currencyFormater],
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Rp. ',
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide(
                          width: 2,
                          color: primaryColor,
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
                    'Zakat yang harus dibayarkan/tahun',
                    style: GoogleFonts.beVietnamPro()
                        .copyWith(fontSize: 14, fontWeight: bold),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    enabled: false,
                    controller: pertahunController,
                    inputFormatters: [currencyFormater],
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Rp. ',
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide(
                          width: 2,
                          color: primaryColor,
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
                ],
              ),
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
                              builder: (contex) => PageZakat(totalBayar: perbulanController.text.replaceAll("Rp. ", "").replaceAll(".", "")),
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
                              'BAYAR ZAKAT',
                              style: GoogleFonts.mali().copyWith(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
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
        ),
      ),
    );
  }
}
