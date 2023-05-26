import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotelbookingui/Widgets/ctext.dart';

class HotelCard extends StatelessWidget {
  String image;
  String title;
  String? subtitle;
  String? desc;
  String rate;
  String rating;
  Function()? fun;

  HotelCard(
      {super.key,
      required this.image,
      required this.title,
      this.subtitle,
      this.desc,
      this.fun,
      required this.rate,
      required this.rating});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: InkWell(
        onTap: fun,
        child: Card(
          elevation: 5,
          shadowColor: Color.fromARGB(160, 91, 89, 226),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    height: screenHeight * 0.2,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: screenHeight * 0.02,
                      left: screenWidth * 0.045,
                    ),
                    child: CustomText(
                      text: title,
                      size: 17,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 51, 51, 51),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: screenWidth * 0.04,
                      top: screenHeight * 0.005,
                    ),
                    child: CustomText(
                      text: subtitle,
                      size: 12,
                      color: Color.fromARGB(255, 189, 189, 189),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: screenWidth * 0.04,
                      top: screenHeight * 0.005,
                      right: screenWidth * 0.02,
                    ),
                    child: CustomText(
                      text: desc,
                      size: 14,
                      color: Color.fromARGB(255, 79, 79, 79),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: screenWidth * 0.04,
                      top: screenHeight * 0.01,
                      right: screenWidth * 0.03,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: "Start From",
                          color: Color.fromARGB(255, 189, 189, 189),
                          size: 15,
                        ),
                        SizedBox(
                          height: screenHeight * 0.009,
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(rate),
                            CustomText(
                              text: "/Night",
                              color: Color.fromARGB(255, 189, 189, 189),
                              size: 14,
                            ),
                            Spacer(),
                            SvgPicture.asset(rating),
                          ],
                        ),
                        SizedBox(
                          height: 12,
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                top: screenHeight * 0.0,
                right: screenWidth * 0.01,
                child: IconButton(
                  icon: SvgPicture.asset(
                    "images/bookmarkbg.svg",
                    width: screenWidth * 0.12,
                    height: screenWidth * 0.12,
                  ),
                  onPressed: () => {},
                ),
              ),
              Positioned(
                top: screenHeight * 0.19,
                left: screenWidth * 0.03,
                child: SvgPicture.asset("images/label.svg"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
