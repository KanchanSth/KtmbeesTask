import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotebookingui/Widgets/ctext.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class PanelWidget extends StatefulWidget {
  final ScrollController controller;
  final PanelController panelController;

  PanelWidget(
      {Key? key, required this.controller, required this.panelController});

  @override
  State<PanelWidget> createState() => _PanelWidgetState();
}

class _PanelWidgetState extends State<PanelWidget> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) => ListView(
        controller: widget.controller,
        padding: EdgeInsets.zero,
        children: [buildView()],
      );

  Widget buildView() => Material(
        color: Colors.transparent,
        child: Column(
          children: [
            GestureDetector(
              onTap: togglePanel,
              child: buildDragHandle(),
            ),
            Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Column(
                          children: [
                            const CustomText(
                              text: "Blue Yoga Motel, Bali",
                              size: 20,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 51, 51, 51),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const CustomText(
                              text: "Legian Nort St, Kuta, Bali",
                              size: 17,
                              color: Color.fromARGB(255, 189, 189, 189),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                SvgPicture.asset("images/label.svg"),
                                const SizedBox(
                                  width: 20,
                                ),
                                SvgPicture.asset("images/rating4.svg"),
                                const CustomText(
                                  text: "729 Reviews",
                                  color: Color.fromARGB(255, 130, 130, 130),
                                  size: 13,
                                )
                              ],
                            ),
                          ],
                        ),
                        const Spacer(),
                        SvgPicture.asset("images/pricenight.svg")
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const CustomText(
                      text: "Description",
                      size: 17,
                      color: Color.fromARGB(
                        255,
                        51,
                        51,
                        51,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const CustomText(
                      text: '''
The motel is located in the most popular tourist area in Bali, perfect for those of you who like backpackers. We’ll bring you through some of the most unique hotels that you never thought you’ll find in Bali. Let's find out!
            ''',
                      color: Color.fromARGB(255, 130, 130, 130),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const CustomText(
                      text: "Amenities",
                      size: 17,
                      color: Color.fromARGB(
                        255,
                        51,
                        51,
                        51,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset("images/parking.svg"),
                        SvgPicture.asset("images/wifi.svg"),
                        SvgPicture.asset("images/laundry.svg"),
                        SvgPicture.asset("images/ac.svg"),
                        SvgPicture.asset("images/bar.svg"),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          "images/bookmarkbg.svg",
                          width: 45,
                        ),
                        Spacer(),
                        SvgPicture.asset("images/booknow.svg"),
                      ],
                    )
                  ],
                )),
          ],
        ),
      );

  Widget buildDragHandle() => Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Container(
            width: 80,
            height: 5,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 130, 130, 130),
                borderRadius: BorderRadius.circular(15)),
          ),
        ),
      );

  void togglePanel() => widget.panelController.isPanelOpen
      ? widget.panelController.close()
      : widget.panelController.open();
}
