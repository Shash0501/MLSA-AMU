import 'package:flutter/material.dart';
import 'package:mlsa_amu/screens/navigation_drawer.dart';
import 'package:mlsa_amu/utils/size_config.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final globalKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      drawer: NavigationDrawer(),
      body: CustomPaint(
        painter: Painter(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: SizeConfig.safeBlockVertical * 3,
                  ),
                  child: IconButton(
                    onPressed: () {
                      globalKey.currentState!.openDrawer();
                    },
                    icon: Icon(
                      Icons.menu,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(300),
                    ),
                    child: Image.asset(
                      "assets/images/home.jpeg",
                      fit: BoxFit.cover,
                      width: SizeConfig.screenWidth * 0.8,
                      height: SizeConfig.screenHeight * 0.4,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.safeBlockHorizontal * 6,
              ),
              child: Text(
                'MLSA AMU',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: SizeConfig.baseFontSize * 9,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.safeBlockHorizontal * 6,
              ),
              child: Text(
                'A community by the students, for the students',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: SizeConfig.baseFontSize * 5,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.safeBlockHorizontal * 6,
                vertical: SizeConfig.safeBlockVertical * 2,
              ),
              child: Text(
                'A technical community that aims to get as many student developers together as possible in order to create a robust environment that fosters collaborative learning.',
                style: TextStyle(
                  height: 1.5,
                  color: Colors.white,
                  fontSize: SizeConfig.baseFontSize * 5.2,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Painter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final height = size.height;
    final width = size.width;
    Paint paint = Paint();

    Path mainBackground = Path();
    mainBackground.addRect(Rect.fromLTRB(0, 0, width, height));
    var rect = Rect.fromLTRB(0, 0, width, height);
    paint.shader = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Colors.blue,
        Color(0XFF792adc),
      ],
    ).createShader(rect);
    canvas.drawPath(mainBackground, paint);

    Path ovalPath = Path();
    ovalPath.moveTo(0, 0);
    // paint a curve from current position to middle of the screen
    ovalPath.quadraticBezierTo(
        -width * 0.5, height * 0.45, width, height * 0.2);

    // draw remaining line to bottom left side
    ovalPath.lineTo(width, 0);

    // Close line to reset it back
    ovalPath.close();
    paint.shader = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomLeft,
      colors: [
        Colors.blue.shade900,
        Color(0XFF792adc),
        Color(0XFF792adc),
      ],
    ).createShader(rect);
    canvas.drawPath(ovalPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
