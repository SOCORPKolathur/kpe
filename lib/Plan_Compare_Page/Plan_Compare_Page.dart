
import 'package:age_calculator/age_calculator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../Translator_Module/Translator_Module_Page.dart';


class Plan_Compare_Page extends StatefulWidget {
  const Plan_Compare_Page({Key? key}) : super(key: key);

  @override
  State<Plan_Compare_Page> createState() => _Plan_Compare_PageState();
}

class _Plan_Compare_PageState extends State<Plan_Compare_Page> {


  String dropdownValue="Select Plan";

  List <String> planlist=[
    "Select Plan",
    "Plan-1",
    "Plan-2",
    "Plan-3",
    "Plan-4",
    "Plan-5",
  ];

  TextEditingController Termcontroller=TextEditingController();
  TextEditingController Agecontroller=TextEditingController();
  TextEditingController Sumassuredcontroller=TextEditingController();

int year=0;
int month=0;
int day=0;


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
                child: const FittedBox(
                  alignment: Alignment.centerLeft,
                  fit: BoxFit.contain,
                  child: KText(
                    text: 'Plans Compare',
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
        children: [
          Padding(
            padding:  EdgeInsets.symmetric(vertical: height/109.57,horizontal: width/51.428),
            child: Material(
              color: const Color(0xffffffff),
              shadowColor: Colors.black12,
              borderRadius: BorderRadius.circular(10),
              elevation: 15,
              child: Container(
                height: height/5.0,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: const Color(0xffffffff),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [

                    //age controller
                    SizedBox(height: height/87.657,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Padding(
                          padding:  EdgeInsets.only(left: width/22.857),
                          child: SizedBox(
                        //    height: height/35.062,
                            width:width/13.0,
                            height: height/40.062,
                            child: const FittedBox(
                              fit: BoxFit.contain,
                              child: KText(text: "Age",
                                style: TextStyle(
                                  fontFamily: "Davish",
                                  color: Colors.black,
                                  letterSpacing: 0.3),),
                            ),
                          ),
                        ),
                        Padding(
                          padding:  EdgeInsets.only(left: width/2.1),
                          child: Container(
                            width:width/5.1143,
                            height: height/26.062,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: Colors.black,)),
                            child: Center(
                              child: Padding(
                                padding:  EdgeInsets.only(left: width/41.143),
                                child: TextField(
                                  style: TextStyle(
                                      color: Colors.black,
                                      letterSpacing: 0.3,
                                      fontSize: width/31.648
                                  ),
                                  maxLines: 1,
                                  maxLength: 2,
                                  controller: Agecontroller,
                                  keyboardType: TextInputType.number,
                                  decoration:  const InputDecoration(
                                      isDense: true,
                                      counterText: "",
                                      contentPadding: EdgeInsets.zero,
                                      border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: width/41.143,),
                        GestureDetector(
                            onTap: () async {

                              DateTime? pickedDate = await showDatePicker(
                                  context: context, initialDate: DateTime.now(),
                                  firstDate: DateTime(1980), //DateTime.now() - not to allow to choose before today.
                                  lastDate: DateTime.now()
                              );

                              if(pickedDate != null ){
                                //pickedDate output format => 2021-03-10 00:00:00.000
                                String formattedDate = DateFormat('dd / M / yyyy').format(pickedDate);
                                //formatted date output using intl package =>  2021-03-16
                                //you can implement different kind of Date Format here according to your requirement

                                setState(() {
                                  year= pickedDate.year;
                                  day= pickedDate.day;
                                  month= pickedDate.month;
                                  //set output date to TextField value.
                                });

                                DateTime birthday = DateTime(year, month, day);

                                DateDuration duration;

                                // Find out your age as of today's date 2021-03-08
                                duration = AgeCalculator.age(birthday);
                                print('Your age is $duration');// Your age is Years: 24, Months: 0, Days: 3
                                setState(() {
                                  Agecontroller.text=duration.years.toString();
                                });

                              }
                              else{
                              }
                            },
                            child: const Icon(Icons.calendar_month,color: Color(0xff0C9346),))

                      ],
                    ),
                    const Divider(),

                    //Term controller
                      SizedBox(height: height/87.657,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 18),
                          child: SizedBox(
                            width:width/12.0,
                            height: height/40.062,
                            child: const FittedBox(
                              fit: BoxFit.contain,
                              child: KText(text: "Term", style: TextStyle(
                                  fontFamily: "Davish",
                                  color: Colors.black,

                                  letterSpacing: 0.3),),
                            ),
                          ),
                        ),
                        Padding(
                          padding:  EdgeInsets.only(left: width/2.15),
                          child: Container(
                            width:width/5.1143,
                            height: height/26.062,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: Colors.black,)),
                            child: Center(
                              child: Padding(
                                padding:  EdgeInsets.only(left: width/41.143),
                                child: TextField(
                                  style: TextStyle(
                                      color: Colors.black,
                                      letterSpacing: 0.3,
                                      fontSize: width/31.648
                                  ),
                                  maxLines: 1,
                                  controller: Termcontroller,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                      isDense: true,
                                      contentPadding: EdgeInsets.zero,
                                      border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                    const Divider(),

                    //Sum Assured controller
                      SizedBox(height: height/87.657,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:  EdgeInsets.only(left: width/20.857),
                          child: SizedBox(
                            width:width/4.6,
                            height: height/40.062,
                            child: const FittedBox(
                              fit: BoxFit.contain,
                              child: KText(text: "Sum Assured",
                                style: TextStyle(
                                  fontFamily: "Davish",
                                  color: Colors.black,
                                  letterSpacing: 0.3),),
                            ),
                          ),
                        ),
                        Padding(
                          padding:  EdgeInsets.only(left: width/3.0),
                          child: Container(
                            width:width/5.1143,
                            height: height/26.062,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: Colors.black,)),
                            child: Center(
                              child: Padding(
                                padding:  EdgeInsets.only(left:width/41.143),
                                child: TextField(
                                  style: TextStyle(
                                      color: Colors.black,
                                      letterSpacing: 0.3,
                                  fontSize: width/31.648
                                  ),
                                  maxLines: 1,
                                  controller: Sumassuredcontroller,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                      isDense: true,
                                      contentPadding: EdgeInsets.zero,
                                      border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),


                  ],
                ),
              ),
            ),

          ),

          Padding(
            padding:  EdgeInsets.symmetric(vertical: height/109.57,horizontal: width/51.428),
            child: Material(
              color: const Color(0xffffffff),
              shadowColor: Colors.black12,
              borderRadius: BorderRadius.circular(10),
              elevation: 15,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: const Color(0xffffffff),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding:  EdgeInsets.symmetric(vertical: height/109.57,horizontal: width/51.428),
                  child: Column(
                    children: [


                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height:height/18.479,
                            width: width/8.142,
                            decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius:  BorderRadius.circular(8)
                            ),
                            child: Center(
                              child:
                              KText(text:"R", style: GoogleFonts.poppins(
                                  color: const Color(0xff008069),
                                  fontSize: width/16.457,
                                  fontWeight: FontWeight.w600
                              ),
                              ),
                            ),
                          ),
                          SizedBox(width: width/26.428,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                               KText(
                                text: 'Raja',
                                style: TextStyle(
                                    fontFamily: "Davish",
                                    fontWeight: FontWeight.w500,
                                    fontSize: width/18.28,
                                    color: Colors.black),
                              ),
                              SizedBox(height: height/175.314,),
                               KText(
                                text: 'Plan No: 93',
                                style: TextStyle(
                                    fontFamily: "Davish",
                                    fontWeight: FontWeight.w500,
                                    fontSize: width/18.28,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Divider(),

                      Container(
                        height: height/20.828,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Color(0xff0C9346), Color(0xff008069)],
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "PREMIUM WITH GST",
                           style: TextStyle(
                               fontFamily: "Davish",
                               fontSize: width/16.28,
                               color: Colors.white
                           ),

                          ),
                        ),


                      ),

                      ///yearly and half text container and so on.......
                      Container(
                        height: height/25.828,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Color(0xff0C9346), Color(0xff008069)],
                          ),

                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children:  [
                            ///Yearly text
                            SizedBox(
                              height: height/40.828,
                              width: width/6.857,
                              child:
                              Center(
                                child: Text(
                                  "YLY",
                                  style: TextStyle(
                                    fontFamily: "Davish",
                                    color: Colors.white,
                                    fontSize: width/19.402,
                                  ),
                                ),
                              ),
                            ),

                            ///halfly text
                            SizedBox(
                              height: height/40.828,
                              width: width/6.857,
                              child:
                              Center(
                                child: Text(
                                  "HLY",
                                  style: TextStyle(
                                    fontFamily: "Davish",
                                    color: Colors.white,
                                    fontSize: width/19.402,
                                  ),
                                ),
                              ),
                            ),

                            ///Quvanterly text
                            SizedBox(
                              height: height/40.828,
                              width: width/6.857,
                              child:
                              Center(
                                child: Text(
                                  "QLY",
                                  style: TextStyle(
                                    fontFamily: "Davish",
                                    color: Colors.white,
                                    fontSize: width/19.402,
                                  ),
                                ),
                              ),
                            ),


                            ///monthly text
                            SizedBox(
                              height: height/40.828,
                              width: width/6.857,
                              child:
                               Center(
                                 child: Text(
                                   "MLY",
                                   style: TextStyle(
                                     fontFamily: "Davish",
                                     color: Colors.white,
                                     fontSize: width/19.402,
                                   ),
                                 ),
                               ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(
                        height: height/25.828,
                        child: Row(
                          children:  [

                            ///Yearly text
                            Container(
                              height: height/20.828,
                              width: width/4.338,
                              decoration:  BoxDecoration(
                                border: Border.all(color: Colors.grey.shade300)
                              ),
                              child:
                              Center(
                                child: Text(
                                  "200000",
                                  style: TextStyle(
                                      fontFamily: "Davish",
                                      fontSize: width/18.28,
                                      color: Colors.black
                                  ),
                                ),
                              ),
                            ),

                            ///halfly text
                            Container(
                              height: height/20.828,
                              width: width/4.338,
                              decoration:  BoxDecoration(
                                  border: Border.all(color: Colors.grey.shade300)
                              ),
                              child: Center(
                                child: Text(
                                  "200000",
                                  style: TextStyle(
                                      fontFamily: "Davish",
                                      fontSize: width/18.28,
                                      color: Colors.black
                                  ),
                                ),
                              ),
                            ),

                            ///Quvanterly text
                            Container(
                              height: height/20.828,
                              width: width/4.338,
                              decoration:  BoxDecoration(
                                  border: Border.all(color: Colors.grey.shade300)
                              ),
                              child: Center(
                                child: Text(
                                  "200000",
                                  style: TextStyle(
                                      fontFamily: "Davish",
                                      fontSize: width/18.28,
                                      color: Colors.black
                                  ),
                                ),
                              ),
                            ),

                            ///monthly text
                            Container(
                              height: height/20.828,
                              width: width/4.338,
                              decoration:  BoxDecoration(
                                  border: Border.all(color: Colors.grey.shade300)
                              ),
                              child:
                               Center(
                                 child: Text(
                                   "200000",
                                   style: TextStyle(
                                       fontFamily: "Davish",
                                       fontSize: width/18.28,
                                       color: Colors.black
                                   ),
                                 ),
                               ),
                            ),


                          ],
                        ),
                      ),

                      SizedBox(height:height/87.657),

                      ///Marutity Benefits
                      Container(
                        height: height/25.828,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Color(0xff0C9346), Color(0xff008069)],
                          ),
                        ),
                        padding: EdgeInsets.only(left:width/82.286),
                        child:
                        Row(
                          children: [
                            SizedBox(
                              width: 220,
                              child: Text(
                                "MATURITY BEBEFIT",
                                style: TextStyle(
                                    fontFamily: "Davish",
                                    fontSize: width/16.28,
                                    color: Colors.white
                                ),
                              ),
                            ),

                            SizedBox(
                              width:width/4.1143,

                              child: Text(
                                "RS",
                                style: TextStyle(
                                    fontFamily: "Davish",
                                    fontSize: width/16.28,
                                    color: Colors.white
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            height: height/20.828,
                            width: width/1.61,
                            decoration:  BoxDecoration(
                                border: Border.all(color: Colors.grey.shade300)
                            ),
                            padding: EdgeInsets.only(left:width/82.286),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "SUMASSURED BENEFITS",
                                  style: TextStyle(
                                      fontFamily: "Davish",
                                      fontSize: width/18.28,
                                      color: Colors.black
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Container(
                            height: height/20.828,
                            width: width/3.322,
                            decoration:  BoxDecoration(
                                border: Border.all(color: Colors.grey.shade300)
                            ),
                            padding: EdgeInsets.only(left:width/82.286),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "200000",
                                  style: TextStyle(
                                      fontFamily: "Davish",
                                      fontSize: width/18.28,
                                      color: Colors.black
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),


                      SizedBox(height:height/87.657),




                    ],
                  ),
                ),
              ),
            ),

          ),
        ],
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding:  EdgeInsets.symmetric(
              horizontal: width/27.428,
              vertical: height/58.438
            ),
            child: GestureDetector(
              onTap: (){

              },
              child: Container(
                height: height / 20.97,
                width: width / 4.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xff0C9346), Color(0xff008069)],
                  ),
                ),
                child: Center(
                  child: SizedBox(
                    width: width / 1.0,
                    height: height / 35.062,
                    child:  const FittedBox(
                      fit: BoxFit.contain,
                      child: KText(
                          text: "Compare",
                          style: TextStyle(
                            fontFamily: "Davish",
                            fontWeight: FontWeight.w500,
                            color: Color(0xffffffff),
                          )
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),

    );
  }








}
