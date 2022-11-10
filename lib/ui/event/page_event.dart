import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jabar_sejahtera/constant/app_constant.dart';
import 'package:jabar_sejahtera/data/model/event_model.dart';
import 'package:jabar_sejahtera/data/storage_manager.dart';
import 'package:jabar_sejahtera/theme/theme.dart';
import 'package:jabar_sejahtera/ui/event/detail_event.dart';

class PageEvent extends StatefulWidget {
  const PageEvent({Key? key}) : super(key: key);

  @override
  State<PageEvent> createState() => _PageEventState();
}

class _PageEventState extends State<PageEvent> {

  final _dio = Dio();
  var storage = StorageManager();

  EventModel? eventModel;

  bool isLoading = false;
  List<Data?>? listEven = [];

  @override
  void initState() {
    _dio.options = BaseOptions(baseUrl: AppConstant.baseUrl);
    listEvent();
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
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.arrow_back,
                      color: listColor,
                      size: 35,
                    ),
                    Text(
                      'Program Event',
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                style: GoogleFonts.beVietnamPro().copyWith(
                  fontSize: 14,
                ),
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    listEven = listEven
                        ?.where((element) =>
                    element?.title
                        ?.toLowerCase()
                        .contains(
                        value.toLowerCase()) ==
                        true)
                        .toList();
                    setState(() {
                    });
                  } else {
                    listEven?.clear();
                    listEvent();
                    setState(() {
                    });
                  }
                },
                decoration: InputDecoration(
                  hintText: 'Cari Event',
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
            eventModel != null ?
            Expanded(
              child: ListView.builder(
                primary: false,
                shrinkWrap: true,
                itemCount: listEven?.length,
                itemBuilder: (context, index) => SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PageDetailEvent(
                            index: index,
                            eventModel: listEven?[index],
                          ),
                        ),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Card(
                          shape: Border.all(
                            width: 2,
                            color: primaryColor,
                          ),
                          elevation: 8,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width - 240,
                                      child: Text(
                                        listEven?[index]?.title ?? "-",
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.beVietnamPro().copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Image.asset(
                                      'assets/img/img_ic_free.png',
                                      width: 55,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/img/img_ic_event1.png',
                                      width: 20,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      listEven?[index]?.organizer ?? "_",
                                      style: GoogleFonts.beVietnamPro().copyWith(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/img/img_ic_event2.png',
                                      width: 20,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      listEven?[index]?.location ?? "_",
                                      style: GoogleFonts.beVietnamPro().copyWith(
                                        fontSize: 14,
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
                                      width: 20,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      listEven?[index]?.date ?? "-",
                                      style: GoogleFonts.beVietnamPro().copyWith(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                right: 5,
                              ),
                              child: Image.network(
                                listEven?[index]?.image ?? "https://",
                                width: 150,
                                height: 150,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
            : const CircularProgressIndicator.adaptive()
          ],
        ),
      ),
    );
  }

  void listEvent() async {
    setState(() {
      isLoading = true;
    });
    try {
      var response = await _dio.get("/events",
          options: Options(headers: {"Accept": "application/json"}));
      print(response.data);
      eventModel = EventModel.fromJson(response.data);
      listEven = eventModel?.data;
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
