import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:push/providers/playercounter.dart';
import 'package:push/screens/singlescreens/spielmodus_screen.dart';

class SpielerAuswahlScreen extends StatelessWidget {
  final List<String> playerlist = <String>[];
  final List<TextEditingController> _controllers = <TextEditingController>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    "https://img.freepik.com/free-vector/hexagonal-technology-pattern-mesh-background-with-text-space_1017-26293.jpg?size=626&ext=jpg"),
                fit: BoxFit.cover)),
        alignment: Alignment.topCenter,
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Center(
              child: Container(
                alignment: Alignment.center,
                width: 200,
                height: 50.0,
                margin: EdgeInsets.only(top: 30),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Container(
                      child: GestureDetector(
                        child: _plusButton,
                        onTap: () {
                          if(context.read<PlayerCounter>().count < 8){
                            context.read<PlayerCounter>().incrementCount();
                          }else {
                            return null;
                          }
                        },
                      ),
                    ),
                    Container(
                      child: GestureDetector(
                        child: _minusButton,
                        onTap: () {
                          if(context.read<PlayerCounter>().count > 1){
                            context.read<PlayerCounter>().decrementCount();
                          }else {
                            return null;
                          }
                          
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 20),
                width: 300,
                height: 500,
                alignment: Alignment.center,
                child: ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: context.watch<PlayerCounter>().count,
                    itemBuilder: (BuildContext context, int index) {
                      _controllers.add(new TextEditingController());
                      return Container(
                        height: 50,
                        margin: EdgeInsets.only(bottom: 10),
                        color: Colors.white.withOpacity(0.3),
                        child: TextField(
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 26,fontFamily:'FrederickatheGreat', color: Colors.white),
                            keyboardType: TextInputType.name,
                            autocorrect: false,
                            controller: _controllers[index]),
                      );
                    } //Text("${context.watch<PlayerCounter>().player[index]} " + (index+1).toString())
                    ),
              ),
            ),
            Container(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    child: Center(
                      child: GestureDetector(
                        child: _nextButton,
                        onTap: () {
                          for (int i = 0;i < context.read<PlayerCounter>().count;i++) {
                            context.read<PlayerCounter>().addPlayer(_controllers[i].text);
                          }
                          context.read<PlayerCounter>().getRandomPlayer();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SpielmodusScreen()),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
/* Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SpielmodusScreen()),
                      ); */

Widget get _plusButton => Container(
      height: 70,
      width: 100,
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
          '+',
          style: TextStyle(
              fontSize: 34.0, fontWeight: FontWeight.bold,fontFamily:'FrederickatheGreat', color: Colors.white),
        ),
      ),
    );

Widget get _minusButton => Container(
      height: 70,
      width: 100,
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
          '-',
          style: TextStyle(
              fontSize: 34.0, fontWeight: FontWeight.bold,fontFamily:'FrederickatheGreat', color: Colors.white),
        ),
      ),
    );
Widget get _nextButton => Container(
      height: 50,
      width: 200,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0),
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
          'Weiter',
          style: TextStyle(
              fontSize: 24.0, fontWeight: FontWeight.bold, fontFamily:'FrederickatheGreat', color: Colors.white),
        ),
      ),
    );
