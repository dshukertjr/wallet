import 'package:flutter/material.dart';
import "package:flare_flutter/flare_actor.dart";

// import 'page1.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool unlocked = false;
  List<int> enteredPassCodes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  Widget coolButton(String imageName, Function onTap, String toolTipMessage) {
    return Tooltip(
      message: toolTipMessage,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: Material(
            color: Color(0x55ffffff),
            shape: CircleBorder(),
            child: InkWell(
              onTap: onTap,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Image.asset(
                  imageName,
                  width: 44,
                  height: 44,
                ),
              ),
            )),
      ),
    );
  }

  Widget unlockButton(String text) {
    return Container(
      color: text == null ? Color(0x00000000) : Color(0x11ffffff),
      width: MediaQuery.of(context).size.width / 3.5,
      height: MediaQuery.of(context).size.height / 6,
      child: text == null
          ? Container()
          : InkWell(
              onTap: () {
                if (text == "delete") {
                  enteredPassCodes.removeLast();
                  setState(() {});
                } else {
                  if (enteredPassCodes.length <= 4)
                    enteredPassCodes.add(int.parse(text));
                    if(enteredPassCodes.length == 4) unlocked = true;
                  setState(() {});
                }
              },
              child: Center(
                child: Text(text),
              ),
            ),
    );
  }

  Widget _enteredTextDisplay(int index, bool error) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 5,
      child: Center(
        child: Container(
          decoration: BoxDecoration(
              border: Border(
            bottom: BorderSide(
              color: error == true ? Colors.red : Colors.white,
            ),
          )),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              enteredPassCodes.length <= index
                  ? ""
                  : enteredPassCodes[index].toString(),
              style: TextStyle(
                fontSize: 40,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _body() {
    if (unlocked != true) {
      return SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  4,
                  (int index) => _enteredTextDisplay(index, false),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Wrap(
                runSpacing: 1.0,
                spacing: 1.0,
                direction: Axis.horizontal,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: <Widget>[
                  unlockButton(("1")),
                  unlockButton(("2")),
                  unlockButton(("3")),
                  unlockButton(("4")),
                  unlockButton(("5")),
                  unlockButton(("6")),
                  unlockButton(("7")),
                  unlockButton(("8")),
                  unlockButton(("9")),
                  unlockButton(null),
                  unlockButton(("0")),
                  unlockButton(("delete")),
                ],
              ),
            ],
          ),
        ),
      );
    }
    return Stack(
      children: <Widget>[
        Positioned(
          width: 450,
          height: 450,
          left: -170,
          top: -40,
          child: FlareActor(
            "assets/objectFloat.flr",
            alignment: Alignment.center,
            fit: BoxFit.contain,
            // animation: "float",
          ),
        ),
        CustomPaint(
          size: Size(MediaQuery.of(context).size.width, 400),
          painter: BlackOverlayPainter(context),
        ),
        Positioned(
          top: 200,
          left: 0,
          right: 0,
          child: Column(
            children: <Widget>[
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 30,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                        text: "120,000",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                    TextSpan(
                      text: " DSHU",
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text("0xFaF77E4584fE0dF6e859eCC54648837267E50558"),
            ],
          ),
        ),
        SafeArea(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 100.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  coolButton("assets/get-money.png", () {}, "Claim Coin"),
                  coolButton("assets/qr-code.png", () {}, "Use Coin"),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 100,
          left: 0,
          right: 0,
          child: Row(
            children: <Widget>[],
          ),
        ),
      ],
    );
  }
}

class BlackOverlayPainter extends CustomPainter {
  BlackOverlayPainter(this.context);
  final BuildContext context;

  Color gradiant1 = Color(0xff960000);
  Color gradiant2 = Color(0xff800091);

  @override
  void paint(Canvas canvas, Size size) {
    double screenWidth = MediaQuery.of(context).size.width;
    final Path path = Path()
      ..moveTo(screenWidth, 50)
      ..relativeLineTo(-screenWidth + 20, 120)
      ..relativeLineTo(0, 120)
      ..relativeLineTo(screenWidth - 20, 0)
      ..close();

    Paint paint = Paint()
      ..color = Colors.black26
      ..strokeWidth = 0.0;
    canvas.drawPath(path, paint);

    paint.color = Colors.blue[600];
    // canvas.drawCircle(Offset(123.4, 56.7), 22.0, paint);
  }

  @override
  bool shouldRepaint(CustomPainter old) {
    return true;
  }
}
