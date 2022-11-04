import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jabar_sejahtera/theme/theme.dart';
import 'package:jabar_sejahtera/ui/galery/detail_galery.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

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

  YoutubePlayerController? controller;

  @override
  void initState() {
    super.initState();

    const url ='https://www.youtube.com/watch?v=jNPxNQLjNoo&t=5s';
    controller = YoutubePlayerController(initialVideoId: YoutubePlayer.convertUrlToId(url)!, flags: YoutubePlayerFlags(
      mute: false,
      autoPlay: true,
      forceHD: true
    ));
  }

  @override
  void deactivate() {
   controller?.pause();

    super.deactivate();
  }

  @override
  void dispose() {
   controller?.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: controller!,
      ),
      builder: (context, player) {
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
                        Container(
                          child: player,
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
                            return InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => DetailGalery(imageAssetUrl: listImage[index], index: index.toString(),)));
                              },
                              child: Hero(
                                tag: "gallery$index",
                                child: Container(
                                  width: 150,
                                  height: 150,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                        listImage[index],
                                      ),
                                    ),
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
    );
  }
}
