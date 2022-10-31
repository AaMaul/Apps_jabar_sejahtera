import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jabar_sejahtera/theme/theme.dart';
import 'package:jabar_sejahtera/ui/payment/metode_payment.dart';

class ZakatHarta extends StatefulWidget {
  const ZakatHarta({Key? key}) : super(key: key);

  @override
  State<ZakatHarta> createState() => _ZakatHartaState();
}

class _ZakatHartaState extends State<ZakatHarta> {
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

  var tabunganFormater = CurrencyTextInputFormatter(
    locale: 'id',
    decimalDigits: 0,
    symbol: 'Rp. ',
  );

  var propertyFormater = CurrencyTextInputFormatter(
    locale: 'id',
    decimalDigits: 0,
    symbol: 'Rp. ',
  );

  var kendaraanFormater = CurrencyTextInputFormatter(
    locale: 'id',
    decimalDigits: 0,
    symbol: 'Rp. ',
  );

  var perhiasanFormater = CurrencyTextInputFormatter(
    locale: 'id',
    decimalDigits: 0,
    symbol: 'Rp. ',
  );

  var hutangFormater = CurrencyTextInputFormatter(
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

  var kenaZakatFormater = CurrencyTextInputFormatter(
    locale: 'id',
    decimalDigits: 0,
    symbol: 'Rp. ',
  );

  var harusBayarthnFormater = CurrencyTextInputFormatter(
    locale: 'id',
    decimalDigits: 0,
    symbol: 'Rp. ',
  );

  var harusbayarblnFormater = CurrencyTextInputFormatter(
    locale: 'id',
    decimalDigits: 0,
    symbol: 'Rp. ',
  );

  var totalHartaFormater = CurrencyTextInputFormatter(
    locale: 'id',
    decimalDigits: 0,
    symbol: 'Rp. ',
  );

  num totalHarta = 0;
  num hargaEmas = 0;

  num hartaTabungan = 0;
  num hartaProperty = 0;
  num hartaKendaraan = 0;
  num hartaPerhiasan = 0;
  num hutang = 0;

  num hartakenaZakat = 0;
  num zakatpertahun = 0;
  num zakatperbulan = 0;

  final hargaEmasController = TextEditingController();
  final totalHartaController = TextEditingController();
  final kenaZakatController = TextEditingController();
  final perbulanController = TextEditingController();
  final pertahunController = TextEditingController();

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
                  'Harta Berupa Tabungan',
                  style: GoogleFonts.beVietnamPro()
                      .copyWith(fontSize: 14, fontWeight: bold),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  inputFormatters: [tabunganFormater],
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      hartaTabungan = tabunganFormater.getUnformattedValue();
                      totalHarta = (hartaTabungan +
                              hartaProperty +
                              hartaKendaraan +
                              hartaPerhiasan) -
                          hutang;
                      totalHartaController.text =
                          hutangFormater.format(totalHarta.toString());

                      zakatperbulan = (totalHarta / 12) * 0.025;
                      perbulanController.text = tabunganFormater
                          .format(zakatperbulan.toInt().toString());

                      zakatpertahun = (totalHarta * 0.025);
                      pertahunController.text = tabunganFormater
                          .format(zakatpertahun.toInt().toString());

                      hartakenaZakat = totalHarta;
                      kenaZakatController.text = tabunganFormater
                          .format(hartakenaZakat.toInt().toString());
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
                  'Harta Berupa Property',
                  style: GoogleFonts.beVietnamPro()
                      .copyWith(fontSize: 14, fontWeight: bold),
                ),
                Text(
                  'Rumah, Tanah, dan lain lain (masukan dalam nilai rupiah)',
                  style: GoogleFonts.beVietnamPro().copyWith(
                    fontSize: 12,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  inputFormatters: [propertyFormater],
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      hartaProperty = propertyFormater.getUnformattedValue();
                      totalHarta = (hartaTabungan +
                              hartaProperty +
                              hartaKendaraan +
                              hartaPerhiasan) -
                          hutang;
                      totalHartaController.text =
                          hutangFormater.format(totalHarta.toString());

                      zakatperbulan = (totalHarta / 12) * 0.025;
                      perbulanController.text = propertyFormater
                          .format(zakatperbulan.toInt().toString());

                      zakatpertahun = (totalHarta * 0.025);
                      pertahunController.text = propertyFormater
                          .format(zakatpertahun.toInt().toString());

                      hartakenaZakat = totalHarta;
                      kenaZakatController.text = propertyFormater
                          .format(hartakenaZakat.toInt().toString());
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
                  'Harta Berupa Kendaraan',
                  style: GoogleFonts.beVietnamPro()
                      .copyWith(fontSize: 14, fontWeight: bold),
                ),
                Text(
                  'Mobil / Motor (masukan dalam nilai rupiah)',
                  style: GoogleFonts.beVietnamPro().copyWith(
                    fontSize: 12,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  inputFormatters: [kendaraanFormater],
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      hartaKendaraan = kendaraanFormater.getUnformattedValue();
                      totalHarta = (hartaTabungan +
                              hartaProperty +
                              hartaKendaraan +
                              hartaPerhiasan) -
                          hutang;
                      totalHartaController.text =
                          hutangFormater.format(totalHarta.toString());

                      zakatperbulan = (totalHarta / 12) * 0.025;
                      perbulanController.text = kendaraanFormater
                          .format(zakatperbulan.toInt().toString());

                      zakatpertahun = (totalHarta * 0.025);
                      pertahunController.text = kendaraanFormater
                          .format(zakatpertahun.toInt().toString());

                      hartakenaZakat = totalHarta;
                      kenaZakatController.text = kendaraanFormater
                          .format(hartakenaZakat.toInt().toString());
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
                  'Harta Berupa Perhiasan',
                  style: GoogleFonts.beVietnamPro()
                      .copyWith(fontSize: 14, fontWeight: bold),
                ),
                Text(
                  'Hitung seluruh perhiasan dengan harga saat ini (masukan dalam nilai rupiah)',
                  style: GoogleFonts.beVietnamPro().copyWith(
                    fontSize: 12,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  inputFormatters: [perhiasanFormater],
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      hartaPerhiasan = perhiasanFormater.getUnformattedValue();
                      totalHarta = (hartaTabungan +
                              hartaProperty +
                              hartaKendaraan +
                              hartaPerhiasan) -
                          hutang;
                      totalHartaController.text =
                          perhiasanFormater.format(totalHarta.toString());

                      zakatperbulan = (totalHarta / 12) * 0.025;
                      perbulanController.text = perhiasanFormater
                          .format(zakatperbulan.toInt().toString());

                      zakatpertahun = (totalHarta * 0.025);
                      pertahunController.text = perhiasanFormater
                          .format(zakatpertahun.toInt().toString());

                      hartakenaZakat = totalHarta;
                      kenaZakatController.text = perhiasanFormater
                          .format(hartakenaZakat.toInt().toString());
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
                  'Total Hutang Saat ini',
                  style: GoogleFonts.beVietnamPro()
                      .copyWith(fontSize: 14, fontWeight: bold),
                ),
                Text(
                  'Masukan total hutang Anda saat ini',
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
                      totalHarta = (hartaTabungan +
                              hartaProperty +
                              hartaKendaraan +
                              hartaPerhiasan) -
                          hutang;
                      totalHartaController.text =
                          hutangFormater.format(totalHarta.toString());

                      zakatperbulan = (totalHarta / 12) * 0.025;
                      perbulanController.text = hutangFormater
                          .format(zakatperbulan.toInt().toString());

                      zakatpertahun = (totalHarta * 0.025);
                      pertahunController.text = hutangFormater
                          .format(zakatpertahun.toInt().toString());

                      hartakenaZakat = totalHarta;
                      kenaZakatController.text = hutangFormater
                          .format(hartakenaZakat.toInt().toString());
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
                  'Total Harta',
                  style: GoogleFonts.beVietnamPro()
                      .copyWith(fontSize: 14, fontWeight: bold),
                ),
                Text(
                  'keseluruh harta dan di kurangi dengan hutang',
                  style: GoogleFonts.beVietnamPro().copyWith(
                    fontSize: 12,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  enabled: false,
                  controller: totalHartaController,
                  inputFormatters: [totalHartaFormater],
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide(
                        width: 2,
                        color: primaryColor,
                      ),
                    ),
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
                            flex: 2,
                            child: TextFormField(
                              onChanged: (value) {
                                setState(() {
                                  hargaEmas =
                                      logamFormater.getUnformattedValue() * 85;
                                  hargaEmasController.text = logamFormater
                                      .format(hargaEmas.toString());

                                  hartakenaZakat = totalHarta;

                                  zakatperbulan = (totalHarta / 12) * 0.025;
                                  perbulanController.text = logamFormater
                                      .format(zakatperbulan.toInt().toString());

                                  zakatpertahun = (totalHarta * 0.025);
                                  pertahunController.text = logamFormater
                                      .format(zakatpertahun.toInt().toString());
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
                          Flexible(
                            flex: 2,
                            child: TextFormField(
                              controller: hargaEmasController,
                              enabled: false,
                              inputFormatters: [x85Formater],
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: 'Rp.',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(14),
                                  borderSide: BorderSide(
                                    width: 1,
                                    color: greyColor,
                                  ),
                                ),
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
                  visible: (totalHarta != 0 && hargaEmas != 0) &&
                      totalHarta < hargaEmas == true,
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
                      'ANDA TIDA WAJIB ZAKAT',
                      style: GoogleFonts.mali().copyWith(
                        fontSize: 18,
                        fontWeight: bold,
                        color: primaryColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Visibility(
                  visible: (totalHarta != 0 && hargaEmas != 0) &&
                      totalHarta > hargaEmas == true,
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
                        'Total Harta Kena Zakat',
                        style: GoogleFonts.beVietnamPro()
                            .copyWith(fontSize: 14, fontWeight: bold),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        enabled: false,
                        controller: kenaZakatController,
                        inputFormatters: [kenaZakatFormater],
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
                        inputFormatters: [harusBayarthnFormater],
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
                        inputFormatters: [harusbayarblnFormater],
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
