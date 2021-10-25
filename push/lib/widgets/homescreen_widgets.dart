import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/src/provider.dart';
import 'package:push/providers/lobbyeinstellungen.dart';
import 'package:push/screens/lobbyscreens/lobbybeitreten/lobbybeitreten_screen.dart';
import 'package:push/screens/lobbyscreens/lobbyerstellen/lobbyerstellen_screen.dart';
import 'package:push/screens/singlescreens/spielerauswahl_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class HomeScreenWidgets extends StatelessWidget {
  final colorizeColors = [
    Colors.blue.shade100,
    Colors.blue.shade300,
    Colors.blue.shade600,
    Colors.red.shade100,
    Colors.red.shade300,
    Colors.red.shade600,

  ];

  final colorizeTextStyle = TextStyle(
      fontSize: 70.0,
      fontFamily: 'FrederickatheGreat',
      fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  "https://img.freepik.com/free-vector/hexagonal-technology-pattern-mesh-background-with-text-space_1017-26293.jpg?size=626&ext=jpg"),
              fit: BoxFit.cover)),
      alignment: Alignment.topCenter,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 100),
            child: AnimatedTextKit(
              animatedTexts: [
                ColorizeAnimatedText(
                  'Push',
                  textStyle: colorizeTextStyle,
                  colors: colorizeColors,
                ),
              ],
              totalRepeatCount: 20,
              isRepeatingAnimation: true,
            ),
          ),
          Container(
            margin: EdgeInsets.all(20),
            child: GestureDetector(
              child: _firstButton,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SpielerAuswahlScreen()),
                );
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(20),
            child: GestureDetector(child: _secondButton,onTap: () {
              context.read<LobbyEinstellungen>().setRandomLobbyName();
              Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LobbyErstellenScreen()),
                          );
            },),
          ),
          Container(
            margin: EdgeInsets.all(20),
            child: GestureDetector(
              child: _thirdButton,
              onTap: () {Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LobbyBeitretenScreen()),
                          );},
            ),
          ),
        ],
      ),
    );
  }
}

Widget get _firstButton => Container(
      height: 70,
      width: 350,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          boxShadow: [
            BoxShadow(
              color: Color(0x80000000),
              blurRadius: 30.0,
              offset: Offset(0.0, 5.0),
            ),
          ],
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF0000FF),
              Color(0xFFFF3500),
            ],
          )),
      child: Center(
        child: Text(
          'Mit einem Bildschirm spielen',
          style: TextStyle(
              fontSize: 22.0, fontWeight: FontWeight.bold,fontFamily:'FrederickatheGreat', color: Colors.white),
        ),
      ),
    );
Widget get _secondButton => Container(
      height: 70,
      width: 350,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          boxShadow: [
            BoxShadow(
              color: Color(0x80000000),
              blurRadius: 30.0,
              offset: Offset(0.0, 5.0),
            ),
          ],
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF0000FF),
              Color(0xFFFF3500),
            ],
          )),
      child: Center(
        child: Text(
          'Lobby erstellen',
          style: TextStyle(
              fontSize: 24.0, fontWeight: FontWeight.bold, fontFamily:'FrederickatheGreat', color: Colors.white),
        ),
      ),
    );
Widget get _thirdButton => Container(
      height: 70,
      width: 350,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          boxShadow: [
            BoxShadow(
              color: Color(0x80000000),
              blurRadius: 30.0,
              offset: Offset(0.0, 5.0),
            ),
          ],
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF0000FF),
              Color(0xFFFF3500),
            ],
          )),
      child: Center(
        child: Text(
          'Lobby beitreten',
          style: TextStyle(
              fontSize: 24.0, fontWeight: FontWeight.bold,fontFamily:'FrederickatheGreat',color: Colors.white),
        ),
      ),
    );
