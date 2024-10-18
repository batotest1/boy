import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: TasbeehCounter()));
}

class TasbeehCounter extends StatefulWidget {
  @override
  _TasbeehCounterState createState() => _TasbeehCounterState();
}

class _TasbeehCounterState extends State<TasbeehCounter> {
  int raqam = 0;
  String matn = "Dushanba";
  Color selectedColor = Colors.black;

  void nonf() {
    setState(() {
      if (raqam == 1) {
        matn = "Dushanba";
        selectedColor = Colors.yellow;
      } else if (raqam == 2) {
        matn = "Seshanba";
        selectedColor = Colors.red;
      } else if (raqam == 3) {
        matn = "Chorshanba";
        selectedColor = Colors.blue;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tasbeeh Counter'),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.teal, Colors.green],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.lightBlueAccent, Colors.purpleAccent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Tanlangan kun: $matn',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 30),
              buildButton("1", Colors.yellow),
              SizedBox(height: 15),
              buildButton("2", Colors.red),
              SizedBox(height: 15),
              buildButton("3", Colors.blue),
              SizedBox(height: 50),
              AnimatedContainer(
                duration: Duration(milliseconds: 300),
                width: 300,
                height: 200,
                decoration: BoxDecoration(
                  color: selectedColor,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildButton(String text, Color color) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          raqam = int.parse(text);
          nonf();
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        elevation: 10,
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
      ),
    );
  }
}
