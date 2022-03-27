import 'package:flutter/material.dart';

import 'game.dart';

class LobbyGameScreen extends StatefulWidget {
  const LobbyGameScreen({Key? key}) : super(key: key);

  @override
  State<LobbyGameScreen> createState() => _LobbyGameScreenState();
}

class _LobbyGameScreenState extends State<LobbyGameScreen> {
  
  final TextEditingController _controllerScoreNumber = TextEditingController();

//Version one

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffffddd2),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: 250.0,
                //color: Color(0xffE29578),
                decoration: BoxDecoration(
                  color: Color(0xffE29578),
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50) , bottomRight: Radius.circular(50)) ,
                ),
                child: Text("Game Focus" , style: TextStyle(fontSize: 50.0)),
              ),
              SizedBox(height: 70.0),
              Column(
                children: [
                  Container(
                      margin: EdgeInsets.only(top: 35.0 , left: 15.0, right: 15.0),
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        boxShadow: [BoxShadow(
                          color: Color(0xff303438),
                          blurRadius: 5,
                          offset: Offset(3, 10), // Shadow position
                        ),],
                        borderRadius: BorderRadius.all(Radius.circular(20)) ,
                        color: Color(0xff83c5be),
                      ),
                      child:Center(child: TextField(
                        keyboardType: TextInputType.number,
                        cursorColor: Colors.black,
                        controller: _controllerScoreNumber,
                        style: Theme.of(context).textTheme.headline5,
                        decoration: InputDecoration(
                            labelText: "number of Score",
                            labelStyle: TextStyle(color:  Colors.black)
                        ),
                      )
                      )
                  ),
                  GestureDetector(
                    onTap: (){
                      print(_controllerScoreNumber);
                      if(_controllerScoreNumber.text != ""){
                        print(_controllerScoreNumber.text.runtimeType);
                        int _scoreNumber =  int.parse(_controllerScoreNumber.text);
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return GameScreen(pointsRequired: _scoreNumber);
                        }));

                      }
                    },
                    child: Container(
                        margin: EdgeInsets.only(top: 35.0 , left: 15.0, right: 15.0),
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          boxShadow: [BoxShadow(
                            color: Color(0xff303438),
                            blurRadius: 5,
                            offset: Offset(3, 10), // Shadow position
                          ),],
                          borderRadius: BorderRadius.all(Radius.circular(20)) ,
                          color: Color(0xff483c5be),
                        ),
                        child: Center(child: Text("Start Game" , style: TextStyle(fontSize: 35.0)),)
                    ),
                  )
                ],
              )
            ],
          ),
        )
      ),
    );
  }
}
