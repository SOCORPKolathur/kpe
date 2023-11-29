
import 'package:flutter/material.dart';

import '../Translator_Module/Translator_Module_Page.dart';

class BMICalculator extends StatefulWidget {
  const BMICalculator({Key? key}) : super(key: key);

  @override
  _BMICalculatorState createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {

  Color myColor = Colors.transparent;
  TextEditingController weight_Controller = TextEditingController();
  TextEditingController height_Controller = TextEditingController();
  var main_result = TextEditingController();

  CalCulate_BMI (String weight,String height) async{
    var myDouble_weight = double.parse(weight);

    var myDouble_height = double.parse(height);

    var res = (((myDouble_weight/(myDouble_height*myDouble_height))*100)*100);

    setState(() {
      main_result.text = res.toStringAsFixed(2);
      if(res<18.5){
        myColor = const Color(0xFF87B1D9);
      }
      else if(res>=18.5 && res<=24.9){
        myColor = const Color(0xFF3DD365);
      }
      else if(res>=25 && res<=29.9){
        myColor = const Color(0xFFEEE133);
      }
      else if(res>=30 && res<=34.9){
        myColor = const Color(0xFFFD802E);
      }
      else if(res>=35){
        myColor = const Color(0xFFF95353);
      }
    });

  }

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
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
                    child: KText(
                     text: 'BMI Calculators',
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
        backgroundColor: Colors.white,
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
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            height: height,
            decoration: const BoxDecoration(
                color: Colors.white
            ),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                   SizedBox(
                    height: height/87.657,
                  ),
                   SizedBox(
                    height: height/29.219,
                  ),

                  Padding(padding:  EdgeInsets.only(left: width/27.428,right: width/27.428,top:  height/87.657,),
                    child: Material(
                      elevation: 10,
                      child: Container(
                        decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Color(0xff0C9346), Color(0xff008069)],
                            ),
                            borderRadius: BorderRadius.circular(5)
                        ),
                        height:height/16.531,
                        child: TextField(
                          controller: weight_Controller,
                          keyboardType: const TextInputType.numberWithOptions(decimal: true),
                          style: const TextStyle(fontSize: 18,color: Colors.white),
                          decoration: const InputDecoration(
                            filled: true,
                            border: InputBorder.none,
                            hintText:"Enter your weight (kg)",
                            hintStyle: TextStyle(fontSize: 18,color: Colors.white),
                          ),
                        ),
                      ),
                    ),),

                  Padding(padding:  EdgeInsets.only(left: width/27.428,right: width/27.428,top:  height/87.657,),
                    child: Material(
                      elevation: 10,
                      child: Container(
                        height:height/16.531,
                        decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Color(0xff0C9346), Color(0xff008069)],
                            ),
                            borderRadius: BorderRadius.circular(5)
                        ),
                        child: TextField(
                          controller: height_Controller,
                          autofocus: false,
                          keyboardType: const TextInputType.numberWithOptions(decimal: true),
                          style: const TextStyle(fontSize: 18,color: Colors.white),
                          decoration: const InputDecoration(
                            filled: true,
                            border: InputBorder.none,
                            hintText: "Enter your height (m)",
                            hintStyle:TextStyle(fontSize: 18,color: Colors.white),
                          ),
                        ),
                      ),
                    ),),

                  GestureDetector(
                    onTap: (){

                      CalCulate_BMI(weight_Controller.text, height_Controller.text);

                    },
                    child: Padding(
                      padding:  EdgeInsets.only(top: height/17.531),
                      child: Material(
                        elevation: 10,
                        borderRadius: BorderRadius.circular(100),
                        child: Container(
                          height: height / 13.97,
                          width: width / 1.91,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Color(0xff0C9346), Color(0xff008069)],
                            ),
                            borderRadius: BorderRadius.circular(100),

                          ),
                          child:   Center(
                            child: SizedBox(
                              width:width/1.6457,
                              height: height/35.062,
                              child:  const FittedBox(
                                fit: BoxFit.contain,
                                alignment: Alignment.center,
                                child: KText(
                                  text:"Continue",
                                  style: TextStyle(
                                    letterSpacing: 0.5,
                                    fontFamily: "Davish",
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xffffffff),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                   SizedBox(
                    height: height/10.957,
                  ),
                  Center(
                    child: Container(
                      width: width/1.371,
                      height: height/8.7657,
                      decoration: BoxDecoration(
                          color: myColor,
                          borderRadius: const BorderRadius.all(Radius.circular(12))
                      ),
                      child: Center(child: SizedBox(
                        width:width/4.6457,
                        height: height/35.062,
                        child: FittedBox(
                          fit: BoxFit.contain,
                          alignment: Alignment.center,
                          child: KText(
                            text:"BMI: "+main_result.text,style:
                          const TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
                        ),
                      )),
                    ),
                  ),
                   SizedBox(
                    height: height/5.957,
                  ),
                  Center(child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Material(

                            borderRadius: const BorderRadius.all(Radius.circular(12)),
                            elevation: 20,
                            color:  const Color(0xFF87B1D9),

                            child: Container(
                              height:height/17.531,
                              width: width/8.228,
                              decoration: const BoxDecoration(
                                  color: Color(0xFF87B1D9),

                                  borderRadius: BorderRadius.all(Radius.circular(12))
                              ),
                            ),

                          ),
                           SizedBox(height: height/87.657,),
                          SizedBox(
                            width:width/4.0,
                            height: height/34.062,
                            child: const FittedBox(
                              alignment: Alignment.center,
                              fit: BoxFit.contain,
                              child:  KText(
                                text:"Underweight",style: TextStyle(),),
                            ),
                          )
                        ],
                      ),

                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Material(
                            borderRadius: const BorderRadius.all(Radius.circular(12)),
                            color: const Color(0xFF3DD365),
                            elevation: 20,
                            child: Container(
                              height:height/17.531,
                              width: width/8.228,
                              decoration: const BoxDecoration(
                                  color: Color(0xFF3DD365),
                                  borderRadius: BorderRadius.all(Radius.circular(12))
                              ),
                            ),
                          ),
                          SizedBox(height: height/87.657,),
                          SizedBox(
                            width:width/6.6457,
                            height: height/35.062,
                            child: const FittedBox(
                              fit: BoxFit.contain,
                              alignment: Alignment.center,
                              child: KText(
                                text:
                                "Normal",style: TextStyle(),),
                            ),
                          )
                        ],
                      ),

                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Material(
                            borderRadius: const BorderRadius.all(Radius.circular(12)),
                            color: const Color(0xFFEEE133),
                            elevation: 20,
                            child: Container(
                              height:height/17.531,
                              width: width/8.228,
                              decoration: const BoxDecoration(
                                  color: Color(0xFFEEE133),

                                  borderRadius: BorderRadius.all(Radius.circular(12))
                              ),
                            ),
                          ),
                          SizedBox(height: height/87.657,),
                          SizedBox(
                              width:width/6.0,
                              height: height/35.062,
                              child: const FittedBox(
                                  alignment: Alignment.center,
                                  fit: BoxFit.contain,
                                  child: KText(text: "Overweight",style: TextStyle(),)))
                        ],
                      ),

                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Material(
                            borderRadius: const BorderRadius.all(Radius.circular(12)),
                            color: const Color(0xFFFD802E),
                            elevation: 20,
                            child: Container(
                              height:height/17.531,
                              width: width/8.228,
                              decoration: const BoxDecoration(
                                  color: Color(0xFFFD802E),

                                  borderRadius: BorderRadius.all(Radius.circular(12))
                              ),
                            ),
                          ),
                          SizedBox(height: height/87.657,),
                          SizedBox(
                              width:width/6.0,
                              height: height/35.062,
                              child: const FittedBox(
                                  fit: BoxFit.contain,
                                  alignment: Alignment.center,
                                  child: KText( text: "obese",style: TextStyle(),)))
                        ],
                      ),

                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Material(
                            borderRadius: const BorderRadius.all(Radius.circular(12)),
                            color: const Color(0xFFF95353),
                            elevation: 20,
                            child: Container(
                              height:height/17.531,
                              width: width/8.228,
                              decoration: const BoxDecoration(
                                  color: Color(0xFFF95353),

                                  borderRadius: BorderRadius.all(Radius.circular(12))
                              ),
                            ),
                          ),
                           SizedBox(height: height/87.657,),

                          SizedBox(
                              width:width/7.0,
                              height: height/35.062,
                              child: const FittedBox(
                                  alignment: Alignment.center,
                                  fit: BoxFit.contain,
                                  child: KText(text: "Extreme",style: TextStyle(),)))
                        ],
                      )
                    ],
                  ),)

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
