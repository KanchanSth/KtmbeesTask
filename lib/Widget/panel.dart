import 'package:flutter/material.dart';
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
        children: [buildText()],
      );

  Widget buildText() => Container(
        child: Column(
          children: [
            buildDragHandle(),
            SizedBox(
              height: 15,
            ),
            Stack(children: [
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: Text(
                  '''The quick, brown fox jumps over a lazy dog. DJs flock by when MTV ax quiz prog. Junk MTV quiz graced by fox whelps. Bawds jog, flick quartz, vex nymphs. Waltz, bad nymph, for quick jigs vex! Fox nymphs grab quick-jived waltz. Brick quiz whangs jumpy veldt fox. Bright vixens jump; dozy fowl quack. Quick wafting zephyrs vex bold Jim. Quick zephyrs blow, vexing daft Jim. Sex-charged fop blew my
                          The quick, brown fox jumps over a lazy dog. DJs flock by when MTV ax quiz prog. Junk MTV quiz graced by fox whelps. Bawds jog, flick quartz, vex nymphs. Waltz, bad nymph, for quick jigs vex! Fox nymphs grab quick-jived waltz. Brick quiz whangs jumpy veldt fox. Bright vixens jump; dozy fowl quack. Quick wafting zephyrs vex bold Jim. Quick zephyrs blow, vexing daft Jim. Sex-charged fop blew my junk TV quiz. How quickly daft jumping zebras vex. Two driven jocks help fax my big quiz. Quick, Baz, get my woven flax jodhpurs! "Now fax quiz Jack!" my brave ghost pled. Five quacking zephyrs jolt my wax bed. Flummoxed by job, kvetching W. zaps Iraq. Cozy sphinx waves quart jug of bad milk. A very bad quack might jinx zippy fowls. Few quips galvanized the mock jury box. Quick brown dogs jump over the lazy fox. The jay, pig,''',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
              Positioned(
                bottom: 50,
                right: 7,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      IconButton(
                          onPressed: () {
                            setState(() {
                              isPressed = !isPressed;
                            });
                          },
                          icon: Icon(
                            Icons.favorite,
                            color: isPressed ? Colors.grey : Colors.red,
                          )),
                      Text('200')
                    ],
                  ),
                ),
              )
            ]),
          ],
        ),
      );

  Widget buildDragHandle() => GestureDetector(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Container(
              width: 30,
              height: 7,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 166, 179, 192),
                  borderRadius: BorderRadius.circular(15)),
            ),
          ),
        ),
        onTap: togglePanel,
      );

  void togglePanel() => widget.panelController.isPanelOpen
      ? widget.panelController.close()
      : widget.panelController.open();
}
