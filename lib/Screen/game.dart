import 'package:flutter/material.dart';
import 'dart:math';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key , required this.pointsRequired}) : super(key: key);
  final int pointsRequired;

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {

  //int pointsRequired = widget.pointsRequired;
  int numberOfItem = 0;
  int numberOfScore = 0;
  bool endGame = false;
  DateTime? timeRunGame;
  Duration? chekGameTime;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    randomColor();
    timeRunGame = DateTime.now();
    print(timeRunGame);
  }

  void randomColor (){
    print(endGame);
    int rnd = Random().nextInt(20);
    while(numberOfItem == rnd){
      rnd = Random().nextInt(20);
    }
    numberOfItem = rnd;
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
      body: _buildBoody()
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
                  child: Container(
                    decoration: BoxDecoration(
                      color: numberOfItem == index? Color(0xff006D77) : Color(0xff83C5BE),
                      borderRadius: BorderRadius.all(Radius.circular(100)) ,
                    ),
                    height: double.infinity / 5,
                    width: double.infinity / 4,
                    child: Text(
                      '',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ),
                );
              }),
            ),
          )
      );
    }else{
      return Container(
        child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("End Game" , style: TextStyle(fontSize: 40.0)),
                SizedBox(height: 20.0),
                Text("$chekGameTime", style: TextStyle(fontSize: 36.0)),
              ],)),
      );
    }
  }
}
