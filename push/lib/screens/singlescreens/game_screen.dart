import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:push/providers/aufgaben.dart';
import 'package:push/providers/playercounter.dart';

class GameScreen extends StatelessWidget {
  bool _isButtonEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    "https://img.freepik.com/free-vector/hexagonal-technology-pattern-mesh-background-with-text-space_1017-26293.jpg?size=626&ext=jpg"),
                fit: BoxFit.cover),
          ),
          height: 250,
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(top: 30),
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    GestureDetector(
                      child: _erledigtButton,
                      onTap: () {
                        if (_isButtonEnabled) {
                          context.read<PlayerCounter>().increaseEledigt();
                          _isButtonEnabled = false;
                        } else {
                          return null;
                        }
                      },
                    ),
                    GestureDetector(
                      child: _nichtErledigtButton,
                      onTap: () {
                        if (_isButtonEnabled) {
                          context.read<PlayerCounter>().increaseNichtEledigt();
                          _isButtonEnabled = false;
                        } else {
                          return null;
                        }
                      },
                    ),
                  ],
                ),
              ),
              Container(
                height: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      width: 150,
                      child: Text(
                        context
                            .watch<PlayerCounter>()
                            .erledigt[
                                context.read<PlayerCounter>().currentIndex]
                            .toString(),
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.green),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      width: 150,
                      child: Text(
                        context
                            .watch<PlayerCounter>()
                            .nichterledigt[
                                context.read<PlayerCounter>().currentIndex]
                            .toString(),
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.red),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  child: GestureDetector(
                    child: _nextButton,
                    onTap: () {
                      _isButtonEnabled = true;
                      context.read<Aufgaben>().nextAufgabe();
                      context.read<PlayerCounter>().getRandomPlayer();
                    },
                  )),
            ],
          ),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  "https://img.freepik.com/free-vector/hexagonal-technology-pattern-mesh-background-with-text-space_1017-26293.jpg?size=626&ext=jpg"),
              fit: BoxFit.cover),
        ),
        child: ListView(
          children: <Widget>[
            Container(
              alignment: Alignment.topCenter,
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: 60),
                    child: Text(
                      context.read<PlayerCounter>().currentPlayer,
                      style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold, fontFamily:'FrederickatheGreat',color: Colors.white),textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: 30),
                    child: Text(
                      "${context.watch<Aufgaben>().aufgaben}",
                      style: TextStyle(fontSize: 30, color: Colors.white),textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget get _nextButton => Container(
      height: 150,
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
          'Nächste Frage',
          style: TextStyle(
              fontSize: 42.0,
              fontWeight: FontWeight.bold,
              fontFamily: "FrederickatheGreat",
              color: Colors.white),
        ),
      ),
    );
Widget get _erledigtButton => Container(
      width: 150,
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
          'Erledigt',
          style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              fontFamily: "FrederickatheGreat",
              color: Colors.white),
        ),
      ),
    );
Widget get _nichtErledigtButton => Container(
      width: 150,
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
          'Nicht Erledigt',
          style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              fontFamily: "FrederickatheGreat",
              color: Colors.white),
        ),
      ),
    );
