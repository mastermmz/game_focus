import 'package:flutter/material.dart';
import 'dart:math';
import 'package:game_focus/models/models.dart';
import '../main.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key , required this.pointsRequired, required this.gameMode}) : super(key: key);
  final int pointsRequired;
  final String gameMode;

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {

  //int pointsRequired = widget.pointsRequired;
  final TextEditingController _controllerName = TextEditingController();
  int numberOfItem = 0;
  int numberOfScore = 0;
  bool endGame = false;
  bool saveData = false;
  DateTime? timeRunGame;
  Duration? chekGameTime;

  bool hasbininsert = false;


  @override
  void initState() {
    super.initState();
    timeRunGame = DateTime.now();
    randomColor();
  }

  void randomColor (){
    print(endGame);
    int rnd = Random().nextInt(20);
    while(numberOfItem == rnd){
      rnd = Random().nextInt(20);
    }
    numberOfItem = rnd;
  }

  void _SaveNumeData({required Duration? timer ,required String userName}){
    DataTimeRecord dataTimeRecord = DataTimeRecord(name: userName, time: timer.toString());
    objectBox.saveDataRecord(dataTimeRecord);
  }


  void loadTeameGame(){
    chekGameTime =  DateTime.now().difference(timeRunGame!);
    print(chekGameTime);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFDDD2),
      appBar: AppBar(
        backgroundColor: Color(0xffE29578),
        centerTitle: true,
        title:  Text("Score: $numberOfScore / ${widget.pointsRequired}"),
      ),
      body: _buildBoody(),
    );



  }

  Widget _buildBoody(){
    if(endGame == false){
      return Container(
          padding: EdgeInsets.symmetric(vertical: 60.0 , horizontal: 10.0),
          alignment: Alignment.center,
          height: double.infinity,
          width: double.infinity,
          //color: Colors.amberAccent,
          child: Center(
            child: GridView.count(
              mainAxisSpacing: 20.0,
              crossAxisSpacing: 20.0,
              crossAxisCount: 4,
              children: List.generate(20, (index) {
                return GestureDetector(
                  onTap: (){
                    setState(() {
                      if (numberOfItem == index){
                        randomColor();
                        print("hhhhhhhhhhh");
                        numberOfScore++;
                        if(numberOfScore == widget.pointsRequired){
                          endGame = true;
                          loadTeameGame();
                        }
                      }
                    });
                  },
                  child: CircleAvatar(
                    backgroundColor: numberOfItem == index? Color(0xff006D77) : Color(0xff83C5BE),
                  ),
                );
              }),
            ),
          )
      );
    }else{
      return _endGamebuildBoody();
    }
  }
//color: numberOfItem == index? Color(0xff006D77) : Color(0xff83C5BE),

  Widget _endGamebuildBoody(){
    if(widget.gameMode == "classic"){
      if(saveData){
        return Container(
          alignment: Alignment.center,
          child: const Text("Data has been saved" , style: TextStyle(
            fontSize: 35.0,
            fontWeight: FontWeight.w500
          )),
        );
      }
      return Container(
        child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("classic Mode End Game" , style: TextStyle(fontSize: 40.0)),
                const SizedBox(height: 20.0),
                Text("$chekGameTime", style: TextStyle(fontSize: 36.0)),
                Container(
                    margin: const EdgeInsets.only(top: 35.0 , left: 15.0, right: 15.0),
                    padding: const EdgeInsets.all(10.0),
                    decoration: const BoxDecoration(
                      boxShadow: [BoxShadow(
                        color: Color(0xff303438),
                        blurRadius: 5,
                        offset: Offset(3, 10), // Shadow position
                      ),],
                      borderRadius: BorderRadius.all(Radius.circular(20)) ,
                      color: Color(0xff4895ef),
                    ),
                    child:Center(child: TextField(
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      cursorColor: Colors.black,
                      controller: _controllerName,
                      //style: Theme.of(context).textTheme.headline5,
                      decoration: const InputDecoration(
                          labelText: "Doto Description",
                          labelStyle: TextStyle(color:  Colors.black)
                      ),
                    )
                    )
                ),
                GestureDetector(
                  onTap: (){
                    if(_controllerName.text != ""){
                      _SaveNumeData(timer: chekGameTime ,userName: _controllerName.text );
                      setState(() {
                        saveData = true;
                      });
                    }else{
                      print("else");
                    }
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
                      color: Color(0xff4895ef),
                    ),
                    child: const Text("SAVE" , style: TextStyle(
                        fontSize: 35.0
                    )),
                  ),
                )
              ],)),
      );
    }else{
      return Container(
        child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("unlimited Mode End Game" , style: TextStyle(fontSize: 40.0)),
                const SizedBox(height: 20.0),
                Text("$chekGameTime", style: const TextStyle(fontSize: 36.0)),
              ],)),
      );
    }
  }

}
