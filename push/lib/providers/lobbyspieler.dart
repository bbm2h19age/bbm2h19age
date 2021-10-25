import 'package:flutter/material.dart';

class LobbySpieler with ChangeNotifier {
  List<String> _spielerliste = [];
  List<String> get spielerliste => _spielerliste;

  int _spieleranzahl = 0;
  
  int get spieleranzahl => _spieleranzahl;

  void addPlayer(String username) {
    _spielerliste.add(username);
    _spieleranzahl++;
    notifyListeners();
  }

  void clearSpielerListe(){
    _spielerliste = [];
    _spieleranzahl = 0;
    notifyListeners();
  }

  
}
