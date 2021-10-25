import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:push/providers/aufgaben.dart';
import 'package:push/providers/lobbyeinstellungen.dart';
import 'package:push/providers/lobbyraum.dart';
import 'package:push/providers/lobbyspieler.dart';
import 'package:push/providers/playercounter.dart';
import 'package:push/screens/home_screen.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => LobbyEinstellungen(),),
    ChangeNotifierProvider(create: (_) => PlayerCounter(),),
    ChangeNotifierProvider(create: (_) => Aufgaben(),),
    ChangeNotifierProvider(create: (_) => LobbyRaum(),),
    ChangeNotifierProvider(create: (_) => LobbySpieler(),),
  ],child: MyApp(),));
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
         "/":(context) => HomeScreen(),
      },
    );
  }
}