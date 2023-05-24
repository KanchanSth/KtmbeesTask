import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotebookingui/Helper/helper.dart';
import 'package:hotebookingui/Screens/details.dart';
import 'package:hotebookingui/Widgets/hotelcard.dart';

import 'package:hotebookingui/Widgets/ctext.dart';

class Homepage extends StatefulWidget {
  Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 7, vsync: this);
    return DefaultTabController(
      length: 7,
      child: ScrollConfiguration(
        behavior: MyBehavior(),
        child: Scaffold(
          backgroundColor: Color.fromARGB(255, 243, 238, 238),
          appBar: null,
          body: Padding(
            padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        'images/search.svg',
                        width: 60,
                        // MediaQuery.of(context).size.width * 0.1,
                        height: 60,
                      ),
                      const Spacer(),
                      const Text(
                        "Explore",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Color.fromARGB(255, 51, 51, 51)),
                      ),
                      const Spacer(),
                      Image.asset('images/profile.png'),
                      SvgPicture.asset(
                        'images/more.svg',
                        width: 30,
                        height: 30,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Card(
                    elevation: 3,
                    child: ListTile(
                      title: const CustomText(
                        text: "Select location",
                        color: Color.fromARGB(255, 130, 130, 130),
                      ),
                      subtitle: const CustomText(
                        text: "Bali, Indonesia",
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 0, 0),
                        size: 17,
                      ),
                      trailing: Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset("images/dropdown.svg")),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TabBar(
                    controller: tabController,
                    indicator: BoxDecoration(),

                    // indicatorColor: Color.fromARGB(255, 91, 89, 226),
                    unselectedLabelColor: Color.fromARGB(255, 189, 189, 189),
                    labelColor: Color.fromARGB(255, 91, 89, 226),
                    isScrollable: true,
                    tabs: const [
                      Tab(
                        // text: "All",
                        child: CustomText(
                          text: "All",
                          fontWeight: FontWeight.bold,
                          size: 16,
                        ),
                      ),
                      Tab(
                        //text: 'Guest House',
                        child: CustomText(
                          text: "Guest House",
                          fontWeight: FontWeight.bold,
                          size: 16,
                        ),
                      ),
                      Tab(
                        child: CustomText(
                          text: "B&B",
                          fontWeight: FontWeight.bold,
                          size: 16,
                        ),
                      ),
                      Tab(
                        child: CustomText(
                          text: "Hotel",
                          fontWeight: FontWeight.bold,
                          size: 16,
                        ),
                      ),
                      Tab(
                        child: CustomText(
                          text: "Motel",
                          fontWeight: FontWeight.bold,
                          size: 16,
                        ),
                      ),
                      Tab(
                        child: CustomText(
                          text: "Hotel",
                          fontWeight: FontWeight.bold,
                          size: 16,
                        ),
                      ),
                      Tab(
                        child: CustomText(
                          text: "Guest House",
                          fontWeight: FontWeight.bold,
                          size: 16,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.45,
                    width: MediaQuery.of(context).size.width * 0.6,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      // color: Colors.red,
                    ),
                    child: TabBarView(controller: tabController, children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailPage(),
                              ));

                          print("test");
                        },
                        child: HotelCard(
                          image: "images/image1.png",
                          title: "Blue Yoga Motel, Bali",
                          subtitle: "Legian Nort St, Kuta, Bali",
                          desc:
                              "The motel is located in the most popular tourist area in Bali, perfect for those of you who like backpackers.",
                          rate: "images/price15.svg",
                          rating: "images/rating4.svg",
                        ),
                      ),
                      HotelCard(
                        image: "images/image2.png",
                        title: "Mongkey Forest House",
                        subtitle: "Mongkey forest st, Ubud, Balli",
                        desc:
                            "A comfortable and quiet house located near the monkey forest Ubud, you will have the best holiday ever...",
                        rate: "images/rate20.svg",
                        rating: "images/rating4.svg",
                      ),
                      HotelCard(
                        image: "images/image1.png",
                        title: "Blue Yoga Motel, Bali",
                        subtitle: "Legian Nort St, Kuta, Bali",
                        desc:
                            "The motel is located in the most popular tourist area in Bali, perfect for those of you who like backpackers.",
                        rate: "images/price15.svg",
                        rating: "images/rating4.svg",
                      ),
                      HotelCard(
                        image: "images/image1.png",
                        title: "Blue Yoga Motel, Bali",
                        subtitle: "Legian Nort St, Kuta, Bali",
                        desc:
                            "The motel is located in the most popular tourist area in Bali, perfect for those of you who like backpackers.",
                        rate: "images/price15.svg",
                        rating: "images/rating4.svg",
                      ),
                      HotelCard(
                        image: "images/image1.png",
                        title: "Blue Yoga Motel, Bali",
                        subtitle: "Legian Nort St, Kuta, Bali",
                        desc:
                            "The motel is located in the most popular tourist area in Bali, perfect for those of you who like backpackers.",
                        rate: "images/price15.svg",
                        rating: "images/rating4.svg",
                      ),
                      HotelCard(
                        image: "images/image1.png",
                        title: "Blue Yoga Motel, Bali",
                        subtitle: "Legian Nort St, Kuta, Bali",
                        desc:
                            "The motel is located in the most popular tourist area in Bali, perfect for those of you who like backpackers.",
                        rate: "images/price15.svg",
                        rating: "images/rating4.svg",
                      ),
                      HotelCard(
                        image: "images/image1.png",
                        title: "Blue Yoga Motel, Bali",
                        subtitle: "Legian Nort St, Kuta, Bali",
                        desc:
                            "The motel is located in the most popular tourist area in Bali, perfect for those of you who like backpackers.",
                        rate: "images/price15.svg",
                        rating: "images/rating4.svg",
                      ),
                    ]),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10, right: 5, bottom: 10),
                    child: Row(
                      children: [
                        CustomText(
                          text: "Recommended",
                          color: Color.fromARGB(255, 51, 51, 51),
                        ),
                        Spacer(),
                        CustomText(
                          text: "See All",
                          color: Color.fromARGB(255, 235, 115, 4),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        SvgPicture.asset("images/next.svg")
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.45,
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: HotelCard(
                            image: "images/outdoor1.png",
                            title: "Blue Yoga Motel, Bali",
                            subtitle: "Legian Nort St, Kuta, Bali",
                            desc:
                                "The motel is located in the most popular tourist area in Bali, perfect for those of you who like backpackers.",
                            rate: "images/price15.svg",
                            rating: "images/rating4.svg",
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.45,
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: HotelCard(
                            image: "images/outdoor2.png",
                            title: "Blue Yoga Motel, Bali",
                            subtitle: "Legian Nort St, Kuta, Bali",
                            desc:
                                "The motel is located in the most popular tourist area in Bali, perfect for those of you who like backpackers.",
                            rate: "images/price15.svg",
                            rating: "images/rating4.svg",
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: ClipRRect(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(35),
              topLeft: Radius.circular(35),
            ),
            child: BottomNavigationBar(items: [
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    "images/home.svg",
                  ),
                  label: ""),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset("images/bookmark.svg"), label: ""),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset("images/list.svg"), label: ""),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset("images/save.svg"), label: "")
            ]),
          ),
        ),
      ),
    );
  }
}
