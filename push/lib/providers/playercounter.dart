import 'package:flutter/material.dart';
import 'dart:math';


class PlayerCounter with ChangeNotifier{

  List<String> _liste = <String>[];

  List<String> get player => _liste;

  List<int> _erledigt = <int>[];

  List<int> get erledigt => _erledigt;

  List<int> _nichterledigt = <int>[];

  List<int> get nichterledigt => _nichterledigt;

  String _currentPlayer = "Spieler";

  String get currentPlayer => _currentPlayer;

  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  int _count = 1;

  int get count => _count;

  void addPlayer(String name){
    _liste.add(name);
    _erledigt.add(0);
    _nichterledigt.add(0);
    notifyListeners();
  }
  void incrementCount(){
    _count++;
    notifyListeners();
  }

  void decrementCount(){
    _count--;
    notifyListeners();
  }

  void removePlayer(){
    _liste.removeLast();
    notifyListeners();
  }

  void increaseEledigt(){
    _erledigt[_currentIndex]++;
    notifyListeners();
  }
  void increaseNichtEledigt(){
    _nichterledigt[_currentIndex]++;
    notifyListeners();
  }

  void getRandomPlayer(){
    var rnd = new Random();
    _currentIndex = rnd.nextInt(_liste.length);
    _currentPlayer = _liste[_currentIndex];
    notifyListeners();
  }
}