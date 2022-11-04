import 'package:flutter/material.dart';

class DetailGalery extends StatelessWidget {
  DetailGalery({Key? key, required this.imageAssetUrl, required this.index}) : super(key: key);

  String imageAssetUrl;
  String index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      body: Center(
        child: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Hero(
            tag: "gallery$index",
            child: Image.asset(
              imageAssetUrl,
              width: MediaQuery.of(context).size.width -10,
            ),
          ),
        ),
      ),
    );
  }
}
