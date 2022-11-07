import 'dart:math';
import 'package:string_extensions/string_extensions.dart';
import 'package:animations/screens/Home/string_extensions.dart';
import 'package:animations/screens/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'string_extensions.dart';
import 'package:extension/extension.dart';
class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  TextEditingController  _questioncontroller = TextEditingController();
  String _answer ="";
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:() => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text( "Decider",
            style: GoogleFonts.aBeeZee(fontWeight: FontWeight.normal,color: Colors.white,fontSize: 30),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: GestureDetector(
                onTap: (){},
                child:Icon(Icons.shopping_bag),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: GestureDetector(
                onTap: (){},
                child:Icon(Icons.history),
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Decisions left: ##",style: GoogleFonts.roboto(fontSize: 30, fontWeight: FontWeight.bold,color: Colors.black)),
                ),
                Spacer(),
                _buildQuestionForm(),
                Spacer(flex: 3,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Account Type: Free",style: GoogleFonts.roboto(fontSize: 30, fontWeight: FontWeight.bold,color: Colors.black)),
                ),
                Text("${AuthService().currentUser?.uid}"),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget _buildQuestionForm(){
    return Column(
      children: [
        Text("Type your Question",style: Theme.of(context).textTheme.headline4,),
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0,left: 30.0,right: 30.0),
          child: TextField(
            decoration: InputDecoration(
              helperText: "Enter A Question",
            ),
            maxLines: null,
            keyboardType: TextInputType.multiline,
            controller: _questioncontroller,
          ),
        ),
        ElevatedButton(
            onPressed: (){
              setState(() {
                _answer = _getAnswer();
              });
              },
            child: Text("Ask")),
        _questionanswer(),
      ],
    );
  }
  String _getAnswer(){
    var answerOptions = ["yes","no","Infact","really"];
    return answerOptions[Random().nextInt(answerOptions.length)];
  }
  Widget _questionanswer() {
    if (_answer != "") {
      return Column(
        children: [
          Text("${_questioncontroller.text}"),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Answer: ${_answer.capitalize()}", style: Theme
                .of(context)
                .textTheme
                .headline5,),
          ),
        ],
      );
    }
    else{
      return Container();
    }
  }
}
