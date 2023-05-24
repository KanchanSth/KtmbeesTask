import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotebookingui/Model/data.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:hotebookingui/Widgets/ctext.dart';

class CContent extends StatefulWidget {
  const CContent({super.key});

  @override
  State<CContent> createState() => _CContentState();
}

class _CContentState extends State<CContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Container(
        child: CarouselSlider.builder(
            itemCount: imagedata.length,
            itemBuilder: (context, index, realIndex) {
              return GestureDetector(
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(15)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Stack(children: [
                      Column(
                        children: [
                          Image.asset(
                            imagedata[index],
                            width: 200,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                      // SvgPicture.asset(
                      //   imagedata[index],
                      //   width: 500,
                      //   height: 500,
                      // ),
                    ]),
                  ),
                ),
                onTap: () {},
              );
            },
            options: CarouselOptions(
                enlargeCenterPage: true,
                height: 300,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                aspectRatio: 7.0)),
      ),
    );
  }
}
