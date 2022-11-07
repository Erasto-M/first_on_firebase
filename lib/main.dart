import 'package:animations/screens/services/auth.dart';
import 'package:animations/screens/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
void main()async{
  WidgetsFlutterBinding.ensureInitialized();
   FirebaseApp App = await  Firebase.initializeApp(
     options: DefaultFirebaseOptions.currentPlatform,
   );
   await  AuthService().getOrCreateUser();
  runApp( MyApp());
}
class MyApp extends StatelessWidget {
  //const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Wrapper(),
    );
  }
}

