import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotebookingui/Widgets/panel.dart';

import 'package:sliding_up_panel/sliding_up_panel.dart';

class DetailPage extends StatefulWidget {
  DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final panelController = PanelController();

  @override
  Widget build(BuildContext context) {
    final panelHeightClosed = MediaQuery.of(context).size.height * 0.1;
    return Scaffold(
      appBar: null,
      body: Stack(
        children: [
          SlidingUpPanel(
              parallaxEnabled: true,
              parallaxOffset: .6,
              controller: panelController,
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(30)),
              minHeight: panelHeightClosed,
              panelBuilder: (controller) => PanelWidget(
                    controller: controller,
                    panelController: panelController,
                  ),
              body: Container(
                  child: Image.asset(
                "images/bgimage.png",
                fit: BoxFit.cover,
              ))),
          Positioned(
              top: 55,
              left: 7,
              child: IconButton(
                icon: SvgPicture.asset("images/icon_back.svg"),
                onPressed: () => Navigator.pop(context),
              ))
        ],
      ),
    );
  }
}
