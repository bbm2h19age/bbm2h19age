import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/src/provider.dart';
import 'package:push/providers/lobbyeinstellungen.dart';
import '../lobby_screen.dart';


class LobbyBeitretenScreen extends StatelessWidget {
  final spielernameController = TextEditingController();
  final raumnameController = TextEditingController();
  final passwortController = TextEditingController();

  bool dataIsCorrect = false;

  Future<void> searchForExistingRoom(BuildContext context) async {
    try {
      final response = await http.get(Uri.parse(
          'https://vanqtestdb-d5845-default-rtdb.europe-west1.firebasedatabase.app/Game/'+ raumnameController.text +'/Einstellungen.json'));
      final extractedData = json.decode(response.body) as Map<String, dynamic>;

      extractedData.forEach((id, data) {
        print("name : " + raumnameController.text);
        print("Passwort : " + data["Passwort"]);
        if (data["Raumname"] == raumnameController.text &&
            data["Passwort"] == passwortController.text) {
              print("drinn");
          dataIsCorrect = true;
          context.read<LobbyEinstellungen>().setLobbyName(data["Raumname"]);
          context.read<LobbyEinstellungen>().setPasswort(data["Passwort"]);
          context.read<LobbyEinstellungen>().setDifficulty(data["Schwierigkeit"]);
          context.read<LobbyEinstellungen>().setDifficulty(data["Spieleranzahl"]);
          
        }
      });
    } catch (err) {
    }
    print("test2: " + dataIsCorrect.toString());
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
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
                  "Lobby beitreten",
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
                        "Spielername",
                        style: TextStyle(
                            fontSize: 24,
                            fontFamily: "FrederickatheGreat",
                            color: Colors.white),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 30),
                      width: 200,
                      color: Colors.white.withOpacity(0.3),
                      child: TextField(
                        controller: spielernameController,
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
                        "Raumname",
                        style: TextStyle(
                            fontSize: 24,
                            fontFamily: "FrederickatheGreat",
                            color: Colors.white),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 30),
                      width: 200,
                      color: Colors.white.withOpacity(0.3),
                      child: TextField(
                        controller: raumnameController,
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
                        "Passwort",
                        style: TextStyle(
                            fontSize: 24,
                            fontFamily: "FrederickatheGreat",
                            color: Colors.white),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 30),
                      width: 200,
                      color: Colors.white.withOpacity(0.3),
                      child: TextField(
                        controller: passwortController,
                        style: TextStyle(fontSize: 20, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                child: _lobbybeitretenButton,
                onTap: () {
                  searchForExistingRoom(context);
                  //createPlayer(context.read<LobbyEinstellungen>().currentLobbyName, "username");
                  Future.delayed(const Duration(milliseconds: 1000), () {
                    if (dataIsCorrect) {
                      print("Joined!");
                      //dataIsCorrect = false;
                      createPlayer(context.read<LobbyEinstellungen>().currentLobbyName, spielernameController.text);
                      Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LobbyScreen()),
                    );
                    } else {
                      print(
                          "Daten waren inkorrekt oder der Raum existiert nicht");
                    }
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget get _lobbybeitretenButton => Container(
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
          'Beitreten',
          style: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'FrederickatheGreat',
              color: Colors.white),
        ),
      ),
    );
