import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jabar_sejahtera/theme/theme.dart';
import 'package:video_player/video_player.dart';

class PageGalery extends StatefulWidget {
  const PageGalery({Key? key}) : super(key: key);

  @override
  State<PageGalery> createState() => _PageGaleryState();
}

class _PageGaleryState extends State<PageGalery> {
  List<String> listImage = [
    'assets/img/img_galery1.png',
    'assets/img/img_galery2.png',
    'assets/img/img_galery3.jpeg',
    'assets/img/img_galery4.jpg',
    'assets/img/img_galery5.jpg',
    'assets/img/img_galery6.jpg',
    'assets/img/img_galery7.jpg',
    'assets/img/img_galery8.jpeg',
    'assets/img/img_galery1.png',
    'assets/img/img_galery2.png',
  ];

  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    _controller = VideoPlayerController.network(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
      videoPlayerOptions: VideoPlayerOptions(
        allowBackgroundPlayback: true
      )
    );
    _initializeVideoPlayerFuture = _controller.initialize();

    _controller.setLooping(true);

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
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
                      'Galery',
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
              height: 20,
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FutureBuilder(
                      future: _initializeVideoPlayerFuture,
                      builder: (context, snapshot) {
                        if ( snapshot.connectionState == ConnectionState.done){
                          return AspectRatio(aspectRatio: _controller.value.aspectRatio, child: VideoPlayer(_controller),);
                        } else {
                          return Center(child: CircularProgressIndicator(),);
                        }
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GridView.builder(
                      padding: const EdgeInsets.all(8),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                      ),
                      itemCount: listImage.length,
                      itemBuilder: (context, index) {
                        return Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                listImage[index],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
