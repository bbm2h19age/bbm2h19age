import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LobbyEinstellungen with ChangeNotifier{

  String _currentDifficulty = "Einfach";
  String get currentDifficulty => _currentDifficulty;

  int _currentPlayer = 2;
  int get currentPlayer => _currentPlayer;

  String _currentLobbyName = "";
  String get currentLobbyName => _currentLobbyName;

  String _currentPasswort = "";
  String get currentPasswort => _currentPasswort;

  void setPasswort(String pw){
    _currentPasswort = pw;
  }

  void setDifficulty(String auswahl){
    _currentDifficulty = auswahl;
    notifyListeners();
  }

  void setLobbyName(String lobbyname){
    _currentLobbyName = lobbyname;
    notifyListeners();
  }
  void setCurrentPlayer(int spieleranzahl){
    _currentPlayer = spieleranzahl;
    notifyListeners();
  }

  void setRandomLobbyName(){
    var rnd = new Random();
    var randomzahl = rnd.nextInt(1000000).toString();
    _currentLobbyName = "Raum"+randomzahl;
    notifyListeners();
  }

  void increasePlayer(){
    _currentPlayer++;
    notifyListeners();
  }

  void decreasePlayer(){
      _currentPlayer--;
    notifyListeners();
  }
}