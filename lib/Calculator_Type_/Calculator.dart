import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Translator_Module/Translator_Module_Page.dart';

class Calculator extends StatefulWidget {

  @override
  _CalculatorState createState() => _CalculatorState();
}
class _CalculatorState extends State<Calculator> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffF5F5F5),
        elevation: 0,
        title: Row(
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Padding(
                padding: EdgeInsets.only(left: width / 102.857),
                child: const Icon(Icons.arrow_back_ios_new_rounded),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: width / 27.428),
              child: SizedBox(
                width: width / 1.645,
                child:
                SizedBox(
                  height: height/30.062,
                  width:width/1.418,
                  child: const FittedBox(
                    alignment: Alignment.centerLeft,
                    fit: BoxFit.contain,
                    child: KText(text:
                      'Calculators',
                      style: TextStyle(
                          fontFamily: "Davish",
                          color: Colors.white,
                          letterSpacing: 0.3),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        automaticallyImplyLeading: false,
        toolbarHeight: height / 9.59,
        flexibleSpace: Container(
          height: height / 7.09,
          width: width / 3.92,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(23),
              bottomRight: Radius.circular(23),
            ),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xff0C9346), Color(0xff008069)],
            ),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10.0),
              alignment: Alignment.bottomRight,
              child: KText(
                text:
                text!,
                style: const TextStyle(
                    fontSize: 60.0,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff0C9346)),
              ),
            ),
          ),
          const SizedBox(height: 200,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              customOutlineButton("9"),
              customOutlineButton("8"),
              customOutlineButton("7"),
              customOutlineButton("+"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              customOutlineButton("6"),
              customOutlineButton("5"),
              customOutlineButton("4"),
              customOutlineButton("-"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              customOutlineButton("3"),
              customOutlineButton("2"),
              customOutlineButton("1"),
              customOutlineButton("x"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              customOutlineButton("C"),
              customOutlineButton("0"),
              customOutlineButton("="),
              customOutlineButton("/"),
            ],
          ),
        ],
      ),
    );
  }
  Widget customOutlineButton(String val) {
    return GestureDetector(
      onTap: (){
        btnClicked(val);
      },
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Material(
          elevation: 2,
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(100),
          child: Container(
            height: 85,
            width: 85,
            decoration: BoxDecoration(
               color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
              child: Text(
                val,
                style: const TextStyle(fontSize: 35.0, color: Color(0xff0C9346),fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }
   int ?first;
    int ? second;
  String ?res="";
   String ?   text = "";
  String ?opp;
  void btnClicked(String btnText) {
    if (btnText == "C") {
      res = "";
      text = "";
      first = 0;
      second = 0;
    } else if (btnText == "+" ||
        btnText == "-" ||
        btnText == "x" ||
        btnText == "/") {
      first = int.parse(text!);
      res = "";
      opp = btnText;
    } else if (btnText == "=") {
      second = int.parse(text!);
      if (opp == "+") {
        res = (first! + second!).toString();
      }
      if (opp == "-") {
        res = (first! - second!).toString();
      }
      if (opp == "x") {
        res = (first! * second!).toString();
      }
      if (opp == "/") {
        res = (first! ~/ second!).toString();
      }
    } else {
      res = int.parse(text! + btnText).toString();
    }
    setState(() {
      text = res;
    });
  }
}