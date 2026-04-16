import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String? title;
  int counter = 0;
  TextEditingController number1 = TextEditingController();
  TextEditingController number2 = TextEditingController();
  double total = 0;

  void initState() {
    title = "Welcome to Homepage";
    number1.text = "0";
    number2.text = "0";
    super.initState();
  }

  void handleAddition() {
    setState(() {
      total = double.parse(number1.text) + double.parse(number2.text);
    });
  }

  void handleButtononClick() {
    setState(() {
      counter += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(child: Text(title!)),
          Center(child: Text('$counter')),
          ElevatedButton(
            onPressed: () {
              handleButtononClick();
            },
            child: Text("Counter"),
          ),
          SizedBox(height: 20),
          TextField(controller: number1),
          SizedBox(height: 20),
          TextField(controller: number2),
          ElevatedButton(
            onPressed: () {
              handleAddition();
            },
            child: Text("Addition"),
          ),
          SizedBox(height: 20),
          Text("$total"),
        ],
      ),
    );
  }
}
