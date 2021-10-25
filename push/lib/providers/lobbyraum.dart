import 'package:flutter/material.dart';

class LobbyRaum with ChangeNotifier{

  String _currentRaumname = "";
  String get currentRaumname => _currentRaumname;

  String _currentPasswort = "";
  String get currentPasswort => _currentPasswort;

  String _currentSchwierigkeit = "";
  String get currentSchwierigkeit => _currentSchwierigkeit;

  int _currentSpieleranzahl = 0;
  int get currentSpieleranzahl => _currentSpieleranzahl;


  void setCurrentRaumName(String name){
    _currentRaumname = name;
    notifyListeners();
  }
  void setCurrentPasswort(String passwort){
    _currentPasswort = passwort;
    notifyListeners();
  }
  void setCurrentSchwierigkeit(String schwierigkeit){
    _currentSchwierigkeit = schwierigkeit;
    notifyListeners();
  }
  void setCurrentSpieleranzahl(int anzahl){
    _currentSpieleranzahl = anzahl;
    notifyListeners();
  }
}