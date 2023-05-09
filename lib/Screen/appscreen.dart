import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:task5/Model/data.dart';
import 'package:task5/Screen/details.dart';

class AppScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 233, 235, 240),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 233, 235, 240),
        elevation: 0,
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.list,
              size: 35,
              color: Colors.black,
            )),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                size: 30,
                color: Colors.black,
              )),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: const CircleAvatar(
              foregroundImage: AssetImage("images/flower.jpg"),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15, left: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Your Daily",
              style: TextStyle(
                  color: Color.fromARGB(255, 166, 179, 192),
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "Recommendation",
              style: TextStyle(
                  color: Color.fromARGB(255, 5, 7, 8),
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: CarouselSlider.builder(
                  itemCount: imagedata.length,
                  itemBuilder: (context, index, realIndex) {
                    return GestureDetector(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Stack(children: [
                            Image.network(
                              imagedata[index],
                              width: 500,
                              height: 500,
                              fit: BoxFit.cover,
                            ),
                            Positioned(
                              bottom: 80,
                              left: 50,
                              child: Container(
                                width: 200,
                                child: Text(
                                  captions[index],
                                  style: TextStyle(
                                      fontSize: 20.0, color: Colors.white),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 20,
                              left: 30,
                              child: Row(
                                children: const [
                                  CircleAvatar(
                                    foregroundImage:
                                        AssetImage("images/flower.jpg"),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text("Kanchan",
                                      style: TextStyle(
                                          fontSize: 20.0, color: Colors.white)),
                                ],
                              ),
                            ),
                          ]),
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailPage(),
                            ));
                      },
                    );
                  },
                  options: CarouselOptions(
                      enlargeCenterPage: true,
                      height: 300,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                      aspectRatio: 7.0)),
            )
          ],
        ),
      ),
    );
  }
}
