import 'package:flutter/material.dart';
import 'package:game_focus/Screen/LobbyGame.dart';
import 'package:game_focus/models/objectBoxModel.dart';


late ObjectBox objectBox;

Future<void> main() async {
  // This is required so ObjectBox can get the application directory
  // to store the database in.
  WidgetsFlutterBinding.ensureInitialized();

  objectBox = await ObjectBox.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'game',
      theme: ThemeData(
      ),
      home:  const LobbyGameScreen(),
    );
  }
}

