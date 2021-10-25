import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:push/providers/lobbyeinstellungen.dart';
import 'package:push/providers/lobbyspieler.dart';

class LobbyScreen extends StatelessWidget {
  late Timer mytimer;

  int playercount = 1;
  int oldPlayerCount = 1;

  void startRefreshing(BuildContext context) {
    mytimer = Timer.periodic(Duration(seconds: 5), (timer) {
      checkPlayerCount(context, context.read<LobbyEinstellungen>().currentLobbyName);
      if(checkNewPlayer()){
        loadPlayer(context, context.read<LobbyEinstellungen>().currentLobbyName);
      }
      
    });
  }

  bool checkNewPlayer(){
    if(playercount > oldPlayerCount){
      oldPlayerCount = playercount;
      return true;
    }else{
      return false;
    }

  }

  Future<void> checkPlayerCount(BuildContext context, String raumname) async {
    int i = 0;
    final response = await http.get(Uri.parse(
        'https://vanqtestdb-d5845-default-rtdb.europe-west1.firebasedatabase.app/Game/' +
            raumname +
            "/Spieler.json"));
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    extractedData.forEach((id, data) {
      i++;
    });
    playercount = i;
  }

  Future<void> loadPlayer(BuildContext context, String raumname) async {
    final response = await http.get(Uri.parse(
        'https://vanqtestdb-d5845-default-rtdb.europe-west1.firebasedatabase.app/Game/' +
            raumname +
            "/Spieler.json"));
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    context.read<LobbySpieler>().clearSpielerListe();
    extractedData.forEach((id, data) {
      context.read<LobbySpieler>().addPlayer(data["Name"]);
    });
  }

  @override
  Widget build(BuildContext context) {
    startRefreshing(context);
    return Scaffold(
      appBar: null,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  "https://img.freepik.com/free-vector/hexagonal-technology-pattern-mesh-background-with-text-space_1017-26293.jpg?size=626&ext=jpg"),
              fit: BoxFit.cover),
        ),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 50),
              alignment: Alignment.center,
              child: Text(
                "${context.watch<LobbyEinstellungen>().currentLobbyName}",
                style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                    fontFamily: "FrederickatheGreat"),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              height: 400,
              width: 300,
              child: ListView.builder(
                  itemCount: context.watch<LobbySpieler>().spieleranzahl,
                  itemBuilder: (BuildContext context, int index) {
                    //_controllers.add(new TextEditingController());
                    return Container(
                      height: 40,
                      margin: EdgeInsets.only(bottom: 5),
                      color: Colors.white.withOpacity(0.3),
                      child: Text(
                        context.read<LobbySpieler>().spielerliste[index],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 26,
                            fontFamily: 'FrederickatheGreat',
                            color: Colors.white),
                        //controller: _controllers[index]),
                      ),
                    );
                  }),
            ),
            GestureDetector(child: _startGameButton,onTap: (){
                //context.read<LobbySpieler>().addPlayer("OG");
                //print(context.read<LobbySpieler>().spielerliste[1]);
                //context.read<LobbySpieler>().clearSpielerListe();
                //createPlayer(context.read<LobbyEinstellungen>().currentLobbyName, "username");
                //context.read<LobbySpieler>().addPlayer("username");
                //loadPlayer(context,raumname);
                //print(context.read<LobbySpieler>().spieleranzahl.toString());
                mytimer.cancel();
            },),
            
          ],
        ),
      ),
    );
  }
}

void createPlayer(String raumname, String username) async {
  final url =
      'https://vanqtestdb-d5845-default-rtdb.europe-west1.firebasedatabase.app/Game/' +
          raumname +
          '/Spieler.json';
  http.post(Uri.parse(url),
      body: json.encode({
        "Name": username,
      }));
}

Widget get _startGameButton => Container(
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
          'Spiel beginnen',
          style: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'FrederickatheGreat',
              color: Colors.white),
        ),
      ),
    );