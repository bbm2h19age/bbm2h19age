import 'package:flutter/material.dart';
import 'package:push/screens/singlescreens/game_screen.dart';

class SpielmodusScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    "https://img.freepik.com/free-vector/hexagonal-technology-pattern-mesh-background-with-text-space_1017-26293.jpg?size=626&ext=jpg"),
                fit: BoxFit.cover)),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              child: _easyButton,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GameScreen()),
                );
              },
            ),
            GestureDetector(
              child: _normalButton,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GameScreen()),
                );
              },
            ),
            GestureDetector(
              child: _schwerButton,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GameScreen()),
                );
              },
            ),
            
          ],
        ),
      ),
    );
  }
}

Widget get _easyButton => Container(
      height: 100,
      width: 300,
      margin: EdgeInsets.all(20),
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
          'Einfach',
          style: TextStyle(
              fontSize: 42.0,
              fontWeight: FontWeight.bold,
              fontFamily: "FrederickatheGreat",
              color: Colors.white),
        ),
      ),
    );

Widget get _normalButton => Container(
      height: 100,
      width: 300,
      margin: EdgeInsets.all(20),
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
          'Normal',
          style: TextStyle(
              fontSize: 42.0,
              fontWeight: FontWeight.bold,
              fontFamily: "FrederickatheGreat",
              color: Colors.white),
        ),
      ),
    );

Widget get _schwerButton => Container(
      height: 100,
      width: 300,
      margin: EdgeInsets.all(20),
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
          'Schwer',
          style: TextStyle(
              fontSize: 42.0,
              fontWeight: FontWeight.bold,
              fontFamily: "FrederickatheGreat",
              color: Colors.white),
        ),
      ),
    );
