import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jabar_sejahtera/constant/app_constant.dart';
import 'package:jabar_sejahtera/data/model/event_model.dart';
import 'package:jabar_sejahtera/theme/theme.dart';

import '../../data/storage_manager.dart';

class PageDetailEvent extends StatefulWidget {
  final int index;
  final Data? eventModel;
  const PageDetailEvent({Key? key, required this.index, required this.eventModel }) : super(key: key);

  @override
  State<PageDetailEvent> createState() => _PageDetailEventState();
}

class _PageDetailEventState extends State<PageDetailEvent> {

  final _dio = Dio();
  var storage = StorageManager();

  // EventModel? eventModel;

  bool isLoading = false;

  @override
  void initState() {
    _dio.options = BaseOptions(baseUrl: AppConstant.baseUrl);
    // detailEvent();
    setState(() {

    });
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
                        'Detail Event',
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
                child: Image.network(widget.eventModel?.image ?? "", width: 250,height: 250,),
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
                    )),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width - 175,
                            child: Text(
                              widget.eventModel?.title ?? "-",
                              style: GoogleFonts.beVietnamPro().copyWith(
                                fontSize: 18,
                                fontWeight: bold,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Image.asset(
                                'assets/img/img_ic_event1.png',
                                width: 25,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                widget.eventModel?.organizer ?? "-",
                                style: GoogleFonts.beVietnamPro().copyWith(
                                  fontSize: 14,
                                  fontWeight: bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Image.asset(
                                'assets/img/img_ic_event2.png',
                                width: 25,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                  widget.eventModel?.location ?? "-",
                                style: GoogleFonts.beVietnamPro().copyWith(
                                  fontSize: 14,
                                  fontWeight: bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Image.asset(
                                'assets/img/img_ic_event3.png',
                                width: 25,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                widget.eventModel?.date ?? "-",
                                style: GoogleFonts.beVietnamPro().copyWith(
                                  fontSize: 14,
                                  fontWeight: bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Image.asset('assets/img/img_ic_free.png'),
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
                      'Deskripsi',
                      style: GoogleFonts.beVietnamPro().copyWith(
                        fontSize: 14,
                        fontWeight: bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      widget.eventModel?.description ?? "-",
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
            ],
          ) ,
        ),
      ),
    );
  }

  // void detailEvent() async {
  //   setState(() {
  //     isLoading = true;
  //   });
  //   try {
  //     var response = await _dio.get("/events",
  //         options: Options(headers: {"Accept": "application/json"}));
  //     print(response.data);
  //     eventModel = EventModel.fromJson(response.data);
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
