import 'package:flutter/material.dart';

import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'package:task5/Widget/panel.dart';

class DetailPage extends StatefulWidget {
  DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final panelController = PanelController();

  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    final panelHeightClosed = MediaQuery.of(context).size.height * 0.1;
    return Material(
      color: Colors.transparent,
      child: SlidingUpPanel(
        parallaxEnabled: true,
        parallaxOffset: .6,
        controller: panelController,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        minHeight: panelHeightClosed,
        panelBuilder: (controller) => PanelWidget(
          controller: controller,
          panelController: panelController,
        ),
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/wallpaper.jpg'),
                  fit: BoxFit.cover,
                  opacity: 0.7)),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    size: 23,
                  )),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: IconButton(
                      onPressed: () {
                        setState(() {
                          isPressed = !isPressed;
                        });
                      },
                      icon: Icon(
                        Icons.bookmark_border,
                        size: 25,
                        color: isPressed ? Colors.white : null,
                      )),
                )
              ],
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Color in UI Design : A\n(Practical) Framework",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                      letterSpacing: 0.9,
                      height: 1.3),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CircleAvatar(
                      backgroundImage: AssetImage('images/flower.jpg'),
                      radius: 15,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Kanchan",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20.0, right: 5),
                      child: Icon(
                        Icons.timelapse_outlined,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "10 min",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
