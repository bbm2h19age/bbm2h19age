import 'package:flutter/material.dart';


class Aufgaben with ChangeNotifier{

  List<String> _liste = <String>[
    "Verteile ein Schluck an die hübscheste Person des anderen Geschlechts",
    "Hattest du schonmal eine verfolgungsjagt?\nWenn ja dann trink 4 Schlücke,\nWenn nicht trink 1 Schluck",
    "Erzähle ein Witz und stimmt in der Gruppe ab ob der gut war oder nicht\nWenn er gut war verteile 2 Schlücke\nWenn nicht dann trink 2 Schlücke",
    "Mit wie vielen Personen hast du geschlafen, trinke pro Person 1 Schluck",
    "Trinke 2 Schlücke, Prost!",
    "Was ist dir allgemein bei dem anderen Geschlecht am wichtigsten?",
    "Trinke die Anzahl an Schlücken wie du Cannabis konsumiert hast",
    "Trinke die Anzahl an Schlücken wie oft du kontakt mit der Polizei hattest",
    
  ];

  int index = 0;

  String get aufgaben => _liste[index];


  int get count => _liste.length;

  void nextAufgabe(){
    if(index < _liste.length-1){
      index++;
    }else {
      index = 0;
    }
    notifyListeners();
  }

}