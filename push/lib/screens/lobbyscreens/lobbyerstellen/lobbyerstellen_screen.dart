import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:push/providers/lobbyeinstellungen.dart';
import 'package:http/http.dart' as http;
import 'package:push/providers/lobbyspieler.dart';
import 'package:push/screens/lobbyscreens/lobby_screen.dart';

class LobbyErstellenScreen extends StatelessWidget {
  final eigenernameController = TextEditingController();
  final lobbynameController = TextEditingController();
  final lobbypasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    lobbynameController.text =
        context.read<LobbyEinstellungen>().currentLobbyName;

    return Scaffold(
      appBar: null,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    "https://img.freepik.com/free-vector/hexagonal-technology-pattern-mesh-background-with-text-space_1017-26293.jpg?size=626&ext=jpg"),
                fit: BoxFit.cover),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 30, bottom: 60),
                child: Text(
                  "Lobbyeinstellungen",
                  style: TextStyle(
                      fontSize: 40,
                      fontFamily: "FrederickatheGreat",
                      color: Colors.white),
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(bottom: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 30),
                      child: Text(
                        "Eigener Name",
                        style: TextStyle(
                            fontSize: 24,
                            fontFamily: "FrederickatheGreat",
                            color: Colors.white),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 30),
                      width: 150,
                      color: Colors.white.withOpacity(0.3),
                      child: TextField(
                        controller: eigenernameController,
                        style: TextStyle(fontSize: 20, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(bottom: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 30),
                      child: Text(
                        "Lobbyname",
                        style: TextStyle(
                            fontSize: 24,
                            fontFamily: "FrederickatheGreat",
                            color: Colors.white),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 30),
                      width: 150,
                      color: Colors.white.withOpacity(0.3),
                      child: TextField(
                        controller: lobbynameController,
                        style: TextStyle(fontSize: 20, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 40),
                alignment: Alignment.center,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.only(left: 30),
                        child: Text(
                          "Spieleranzahl   ${context.watch<LobbyEinstellungen>().currentPlayer}",
                          style: TextStyle(
                              fontSize: 24,
                              fontFamily: "FrederickatheGreat",
                              color: Colors.white),
                          textAlign: TextAlign.center,
                        )),
                    Container(
                      child: ElevatedButton(
                        child: Text("+"),
                        onPressed: () {
                          if (context.read<LobbyEinstellungen>().currentPlayer <
                              8) {
                            context.read<LobbyEinstellungen>().increasePlayer();
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 30),
                      child: ElevatedButton(
                        child: Text("-"),
                        onPressed: () {
                          if (context.read<LobbyEinstellungen>().currentPlayer >
                              2) {
                            context.read<LobbyEinstellungen>().decreasePlayer();
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                alignment: Alignment.center,
                margin: EdgeInsets.only(bottom: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 30),
                      child: Text(
                        "Schwierigkeit ",
                        style: TextStyle(
                            fontSize: 24,
                            fontFamily: "FrederickatheGreat",
                            color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 30),
                      alignment: Alignment.center,
                      width: 150,
                      color: Colors.white.withOpacity(0.3),
                      child: DropdownButton<String>(
                        items: <String>['Einfach', 'Normal', 'Schwer']
                            .map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              textAlign: TextAlign.center,
                            ),
                          );
                        }).toList(),
                        hint: Text(
                          "${context.watch<LobbyEinstellungen>().currentDifficulty}",
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                        onChanged: (selection) {
                          //print(selection);
                          context
                              .read<LobbyEinstellungen>()
                              .setDifficulty(selection.toString());
                          print(context
                              .read<LobbyEinstellungen>()
                              .currentDifficulty);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(bottom: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 30),
                      child: Text(
                        "Passwort",
                        style: TextStyle(
                            fontSize: 24,
                            fontFamily: "FrederickatheGreat",
                            color: Colors.white),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 30),
                      width: 150,
                      color: Colors.white.withOpacity(0.3),
                      child: TextField(
                        controller: lobbypasswordController,
                        style: TextStyle(fontSize: 20, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: GestureDetector(
                  child: _lobbyerstellenButton,
                  onTap: () {
                    context.read<LobbyEinstellungen>().setPasswort(lobbypasswordController.text);
                    createLobby(
                        context.read<LobbyEinstellungen>().currentLobbyName,
                        context.read<LobbyEinstellungen>().currentPlayer,
                        context.read<LobbyEinstellungen>().currentDifficulty,
                        context.read<LobbyEinstellungen>().currentPasswort,);
                    createPlayer(lobbynameController.text, eigenernameController.text);
                    context.read<LobbySpieler>().addPlayer("OG");
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LobbyScreen()),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void createPlayer(String raumname,String username) async {
  final url =
      'https://vanqtestdb-d5845-default-rtdb.europe-west1.firebasedatabase.app/Game/' +
          raumname +
          '/Spieler.json';
  http.post(Uri.parse(url),
      body: json.encode({
        "Name": username,
      }));

}

void createLobby(String raumname, int spieleranzahl, String schwierigkeit,
    String passwort) async {
  final url =
      'https://vanqtestdb-d5845-default-rtdb.europe-west1.firebasedatabase.app/Game/' +
          raumname +
          '/Einstellungen.json';
  http.post(Uri.parse(url),
      body: json.encode({
        "Raumname": raumname,
        "Spieleranzahl": spieleranzahl,
        "Schwierigkeit": schwierigkeit,
        "Passwort": passwort
      }));
}

Widget get _lobbyerstellenButton => Container(
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
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'FrederickatheGreat',
              color: Colors.white),
        ),
      ),
    );
