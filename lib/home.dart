import 'package:flutter/material.dart';
import "package:flare_flutter/flare_actor.dart";

// import 'page1.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Home"),
      // ),
      body: _body(),
      // drawer: _drawer(),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.edit),
      //   onPressed: () {
      //     Navigator.push(
      //       context,
      //       MaterialPageRoute(builder: (context) => Page1()),
      //     );
      //   },
      // ),
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

  Widget _body() {
    return Stack(
      children: <Widget>[
        Positioned(
          width: 500,
          height: 500,
          left: -170,
          top: -70,
          child: FlareActor(
            "assets/Coin.flr",
            alignment: Alignment.center,
            fit: BoxFit.contain,
            animation: "float",
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

  Drawer _drawer() {
    return Drawer(
      child: Column(
        children: <Widget>[
          DrawerHeader(
            child: Text("User Name"),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text("Profile"),
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text("Setting"),
                ),
              ],
            ),
          ),
          ListTile(
            title: Text("Terms & Conditions"),
          )
        ],
      ),
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
