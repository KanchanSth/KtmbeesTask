import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tasks2/MovieApi/Data/Model/moviemodel.dart';
import 'package:tasks2/MovieApi/Data/Repository/movierepo.dart';
import 'package:tasks2/MovieApi/Screen/homepage.dart';
import 'package:tasks2/MovieApi/Widget/customcolumn.dart';
import 'package:tasks2/MovieApi/Widget/customtext.dart';

class MovieDetailsDisplay extends StatefulWidget {
  MovieModel movieModel;
  MovieDetailsDisplay({super.key, required this.movieModel});

  @override
  State<MovieDetailsDisplay> createState() => _MovieDetailsDisplayState();
}

class _MovieDetailsDisplayState extends State<MovieDetailsDisplay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black87,
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                )),
            child: IconButton(
              icon: Image.asset(
                'images/logo.jpeg',
              ),
              onPressed: () {},
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
            const Padding(
              padding: EdgeInsets.only(top: 16),
              child: Text(
                "4K",
                style: TextStyle(
                    color: Color.fromARGB(137, 8, 249, 3),
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.bar_chart),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.library_books),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.person),
              onPressed: () {},
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
              // color: Color(0xFFADD8E6),
              child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              children: [
                CustomColumn(
                  text: "${widget.movieModel.title}",
                  size: 20,
                  size1: 20,
                  color1: Colors.white,
                  color: Colors.white,
                  fontWeight1: FontWeight.bold,
                  fontWeight: FontWeight.bold,
                  text1: "${widget.movieModel.year}",
                  imagePath: "${widget.movieModel.mediumCoverImage}",
                ),
                SizedBox(
                  height: 15,
                ),
                const CustomText(
                  text: "Summary",
                  size: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 15, right: 15, bottom: 15),
                  child: CustomText(
                    text: "${widget.movieModel.summary}",
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          )),
        ));
  }
}
