import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:week2_assginment/chatting/chat/chat_bubble.dart';
import 'package:week2_assginment/screens/main_screen.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Chatting App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ChatScreen()
    );
  }
}