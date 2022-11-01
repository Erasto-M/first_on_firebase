import 'package:flutter/material.dart';
class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Home"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: const[
              Text("Welcome"),
            ],
          ),
        ),
      ),
    );
  }
}