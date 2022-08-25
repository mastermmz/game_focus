import 'package:flutter/material.dart';
import 'package:game_focus/Screen/timesList.dart';

import 'game.dart';

class LobbyGameScreen extends StatefulWidget {
  const LobbyGameScreen({Key? key}) : super(key: key);

  @override
  State<LobbyGameScreen> createState() => _LobbyGameScreenState();
}

class _LobbyGameScreenState extends State<LobbyGameScreen> {
  
  final TextEditingController _controllerScoreNumber = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffffddd2),
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
                decoration: const BoxDecoration(
                  color: Color(0xffE29578),
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50) , bottomRight: Radius.circular(50)) ,
                ),
                child: const Text("Game Focus" , style: TextStyle(fontSize: 50.0)),
              ),
              const SizedBox(height: 70.0),
              Column(
                children: [
                  GestureDetector(
                    onTap: () => showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('Number of points'),
                        content: const Text('The number of points you want to change in the game'),
                        actions: <Widget>[
                          TextField(
                            keyboardType: TextInputType.number,
                            cursorColor: Colors.black,
                            controller: _controllerScoreNumber,
                            style: Theme.of(context).textTheme.headline5,
                            decoration: const InputDecoration(
                                labelText: "number of Score",
                                labelStyle: TextStyle(color:  Colors.black ,fontSize: 20.0)
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'Cancel'),
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: (){
                                  Navigator.pop(context, 'Cancel');
                                  print(_controllerScoreNumber);
                                  if(_controllerScoreNumber.text != ""){
                                    print(_controllerScoreNumber.text.runtimeType);
                                    int _scoreNumber =  int.parse(_controllerScoreNumber.text);
                                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                                      return GameScreen(pointsRequired: _scoreNumber , gameMode: "unlimited",);
                                    }));
                                  }
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    child: Container(
                        margin: const EdgeInsets.only(top: 35.0 , left: 15.0, right: 15.0),
                        padding: const EdgeInsets.all(10.0),
                        decoration: const BoxDecoration(
                          boxShadow: [BoxShadow(
                            color: Color(0xff303438),
                            blurRadius: 5,
                            offset: Offset(3, 10), // Shadow position
                          ),],
                          borderRadius: BorderRadius.all(Radius.circular(20)) ,
                          color: Color(0xff483c5be),
                        ),
                        child: const Center(child: Text("unlimited Game" , style: TextStyle(fontSize: 35.0)),)
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return const GameScreen(pointsRequired: 30 , gameMode: "classic",); 
                      }));
                    },
                    child: Container(
                        margin: const EdgeInsets.only(top: 35.0 , left: 15.0, right: 15.0),
                        padding: const EdgeInsets.all(10.0),
                        decoration: const BoxDecoration(
                          boxShadow: [BoxShadow(
                            color: Color(0xff303438),
                            blurRadius: 5,
                            offset: Offset(3, 10), // Shadow position
                          ),],
                          borderRadius: BorderRadius.all(Radius.circular(20)) ,
                          color: Color(0xff483c5be),
                        ),
                        child: const Center(child: Text("classic Game" , style: TextStyle(fontSize: 35.0)),)
                    ),
                  ),
                  Container(
                    width: double.infinity - 20,
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return timesList();
                            }));
                          },
                          child: Container(
                              margin: const EdgeInsets.only(top: 35.0 , left: 15.0, right: 10.0),
                              padding: const EdgeInsets.all(10.0),
                              decoration: const BoxDecoration(
                                boxShadow: [BoxShadow(
                                  color: Color(0xff303438),
                                  blurRadius: 5,
                                  offset: Offset(3, 10), // Shadow position
                                ),],
                                borderRadius: BorderRadius.all(Radius.circular(20)) ,
                                color: Color(0xff483c5be),
                              ),
                              child: const Center(child: Text("List of times" , style: TextStyle(fontSize: 30.0)),)
                          ),
                        ),
                        GestureDetector(
                          onTap: (){

                          },
                          child: Container(
                              margin: const EdgeInsets.only(top: 35.0 , left: 10.0, right: 15.0),
                              padding: const EdgeInsets.all(10.0),
                              decoration: const BoxDecoration(
                                boxShadow: [BoxShadow(
                                  color: Color(0xff303438),
                                  blurRadius: 5,
                                  offset: Offset(3, 10), // Shadow position
                                ),],
                                borderRadius: BorderRadius.all(Radius.circular(20)) ,
                                color: Color(0xff483c5be),
                              ),
                              child: Center(child: Text("Setting" , style: TextStyle(fontSize: 30.0)),)
                          ),
                        )
                      ],
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
