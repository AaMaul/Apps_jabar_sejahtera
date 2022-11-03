import 'package:flutter/material.dart';

class DetailGalery extends StatelessWidget {
  const DetailGalery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: (){
          Navigator.pop(context);
        },
        child: Hero (
          tag: "Foto1",
          child: Image.asset("assets/img/img_galery2.png", width: 100,),
        ),
      ),
    );
  }
}
