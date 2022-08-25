import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:game_focus/models/models.dart';
import 'package:game_focus/main.dart';
class timesList extends StatefulWidget {
  const timesList({Key? key}) : super(key: key);

  @override
  State<timesList> createState() => _timesListState();
}

class _timesListState extends State<timesList> {
  bool loading = true;
  bool hasbininsert = false;
  bool noData = false;
  late List  dataList;


  void _ReadTimeistData(){
    print("i am Read odo List Data");
    dataList = objectBox.showDataList();
    setState(() {
      loading = false;
    });

  }


  @override
  void initState() {
    super.initState();
    _ReadTimeistData();

  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Color(0xffffddd2),

            appBar: AppBar(
              backgroundColor: Color(0xffE29578),
              centerTitle: true,
              title:  const Text("Times List"),
            ),

          body: _boodyBuilder()

        ));
  }

  Widget _boodyBuilder(){
    if (loading){
      return const SpinKitWave (
        color: Colors.indigo,
        size: 100.0,
      );
    }
    if(noData){
      return noDataScreen();
    }
    return _listBuilder();
  }

  Widget noDataScreen(){
    return Container(
      alignment: Alignment.center,
      child: const Text("No data Time" , style: TextStyle(
        fontSize: 40.0
      )),
    );
  }

  Widget _listBuilder(){
    return ListView.builder(
        itemCount: dataList.length,
        itemBuilder:(BuildContext context, int index){
          final DataTimeRecord item = dataList[index];
          //print(item);
          int? itemId = item.id;
          if (itemId == null){
            print("uuuuuuuuuuuuuuuu");
            print(item);
            itemId = 0;
          }
          return  Container(
            margin: const EdgeInsets.only(top: 35.0 , left: 15.0, right: 15.0),
            padding: const EdgeInsets.all(10.0),
            decoration: const BoxDecoration(
              boxShadow: [BoxShadow(
                color: Color(0xff303438),
                blurRadius: 5,
                offset: Offset(3, 10), // Shadow position
              ),],
              borderRadius: BorderRadius.all(Radius.circular(20)) ,
              color: Color(0xffE29578),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    padding: const EdgeInsets.all(20.0),
                    //alignment: Alignment.centerRight,
                    child: Text("${item.time}", style: const TextStyle(color: Colors.black , fontSize: 20),)),
                Container(
                    padding: const EdgeInsets.all(20.0),
                    //alignment: Alignment.centerLeft,
                    child: Text("${item.name}", style: const TextStyle(color: Colors.black , fontSize: 20),)),
              ],
            ),
          );
        }
    );
  }

}
