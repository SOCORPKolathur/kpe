

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Calculator_Type_/BMI_Calcultaor.dart';
import '../Calculator_Type_/Calculator.dart';
import '../Translator_Module/Translator_Module_Page.dart';


class Calculator_Page extends StatefulWidget {
  const Calculator_Page({Key? key}) : super(key: key);

  @override
  State<Calculator_Page> createState() => _Calculator_PageState();
}

class _Calculator_PageState extends State<Calculator_Page> {
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
                height: height/30.062,
                width:width/1.418,
                child:
                const FittedBox(
                  fit: BoxFit.contain,
                  alignment: Alignment.centerLeft,

                  child: KText(
                   text: 'Calculators',
                    style: TextStyle(
                        fontFamily: "Davish",
                        color: Colors.white,
                        letterSpacing: 0.3),
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
        children:  [

          ///Bmi Calculator


         Padding(
           padding: const EdgeInsets.all(6.0),
           child: Material(
             elevation: 5,
             borderRadius: BorderRadius.circular(10),
             child: ListTile(
               onTap: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context) =>  const BMICalculator(),));
               },
               tileColor: Colors.white,
               shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(10),
               ),
               leading: const Icon(Icons.calculate,color: Color(0xff0C9346),size: 30,),
               title: SizedBox(
                 width:width/1.6457,
                 height: height/35.062,
                 child: const FittedBox(
                   alignment: Alignment.centerLeft,
                   fit: BoxFit.contain,
                   child: KText(
                   text:'Bmi Calculators',
                   style: TextStyle(
                       fontFamily: "Davish",
                       color: Colors.black,

                       letterSpacing: 0.3),
             ),
                 ),
               ),),
           ),
         ),

         Padding(
           padding: const EdgeInsets.all(6.0),
           child: Material(
             elevation: 5,
             borderRadius: BorderRadius.circular(10),
             child: ListTile(
               onTap: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context) =>  Calculator(),));
               },
               shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(10),
               ),
               tileColor: Colors.white,
               leading: const Icon(Icons.calculate,color: Color(0xff0C9346),size: 30,),
               title: SizedBox(
                 width:width/1.6457,
                 height: height/35.062,
                 child: FittedBox(
                   fit: BoxFit.contain,
                   alignment: Alignment.centerLeft,
                   child: KText(
                   text: 'Calculators',
                   style: TextStyle(
                       fontFamily: "Davish",
                       color: Colors.black,
                       fontSize: width / 13.714,
                       letterSpacing: 0.3),
             ),
                 ),
               ),),
           ),
         ),

        ],
      ),

    );
  }
}
