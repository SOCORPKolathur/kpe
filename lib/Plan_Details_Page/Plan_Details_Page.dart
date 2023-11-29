import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Translator_Module/Translator_Module_Page.dart';

class Plan_Details_Page extends StatefulWidget {
  const Plan_Details_Page({Key? key}) : super(key: key);

  @override
  State<Plan_Details_Page> createState() => _Plan_Details_PageState();
}

class _Plan_Details_PageState extends State<Plan_Details_Page> {
  bool endowmentview_bool = false;
  int val=0;

  List<String> PlanList=[
    "LIC Bima Ratna Plan",
    "LIC Dhan Sanchay Plan",
    "LIC Jeevan Azad Plan",
    "LIC Dhan Vriddhi Plan",
    "LIC New Pension Plus",
    "LIC Saral Pension Plan",
    "LIC Jeevan Kiran Term Life Insurance Plan"
  ];

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
                setState(() {
                  endowmentview_bool=false;
                });
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
                    text: 'Plan Details',
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

      body: Stack(
        children: [
          Padding(
            padding:  EdgeInsets.symmetric(vertical: height/109.57,horizontal: width/51.428),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                   SizedBox(
                    height: height/58.438,
                  ),

                  ///plan dropdown container
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        endowmentview_bool = !endowmentview_bool;
                        val=0;
                      });
                    },
                    child: Material(
                      color: const Color(0xffffffff),
                      shadowColor: Colors.black12,
                      borderRadius: BorderRadius.circular(10),
                      elevation: 10,
                      child: Container(
                        height: height/17.531,
                        decoration: BoxDecoration(
                            color: const Color(0xffffffff),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                             Padding(
                              padding: EdgeInsets.only(left: width/41.143),
                              child: SizedBox(
                                width:width/8.0,
                                height: height/35.062,
                                child: const FittedBox(
                                  fit: BoxFit.contain,
                                  child: KText(
                                    text: 'Plan',
                                    style: TextStyle(
                                        fontFamily: "Davish",
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff3CB878)),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: width/41.143),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width:width/2.5,
                                    height: height/40.062,
                                    child: const FittedBox(
                                      fit: BoxFit.contain,
                                      child: KText(
                                        text: '914-NEW ENDOWNMENT',
                                        style: TextStyle(
                                            fontFamily: "Davish",
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xff3CB878)),
                                      ),
                                    ),
                                  ),
                                  Transform.rotate(
                                    angle:
                                        endowmentview_bool == true ? 3.15 : 0,
                                    child: Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.grey.shade500,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  ///endowment plan details container
                SizedBox(
                    height: height/58.438,
                  ),
                  Material(
                    color: const Color(0xffffffff),
                    shadowColor: Colors.black12,
                    borderRadius: BorderRadius.circular(10),
                    elevation: 10,
                    child: Container(
                      height:height/3.8,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: const Color(0xffffffff),
                          borderRadius: BorderRadius.circular(10)),
                      child:  Padding(
                        padding: EdgeInsets.symmetric(vertical: height/58.438,horizontal: width/27.428),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ///new endowmnet text
                            SizedBox(
                              width:width/2.9,
                              height: height/35.062,
                              child: const FittedBox(
                                fit:BoxFit.contain,
                                child: KText(
                                  text: 'NEW ENDOWNMENT',
                                  style: TextStyle(
                                      fontFamily: "Davish",
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff3CB878)),
                                ),
                              ),
                            ),

                            SizedBox(
                              height: height/57.438,
                            ),

                            ///UIN  Text
                            Row(
                              children: [
                                SizedBox(
                                  width: width/8.0,
                                  height: height/40.438,
                                  child: FittedBox(
                                    fit:BoxFit.contain,
                                    child: const Text(
                                      'UIN         :',
                                      style: TextStyle(
                                          fontFamily: "Davish",
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: width/4.1,
                                  height: height/40.438,
                                  child: FittedBox(
                                    fit:BoxFit.contain,
                                    child: const Text(
                                      '512N27702',
                                      style: TextStyle(
                                          fontFamily: "Davish",
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xff3CB878)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                             height: height/87.657,
                            ),

                            ///Plan no  Text
                            Row(
                              children: [
                                SizedBox(
                                  width: width/6.8,
                                  height: height/40.0,
                                  child: FittedBox(
                                    fit:BoxFit.contain,
                                    child: const Text(
                                      'Plan no :',
                                      style: TextStyle(
                                          fontFamily: "Davish",
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: width/4.1,
                                  height: height/40.438,
                                  child: FittedBox(
                                    fit:BoxFit.contain,
                                    child: const Text(
                                      '914',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontFamily: "Davish",
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xff3CB878)),
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(
                             height: height/87.657,
                            ),

                            ///Type  Text
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: width/7.0,
                                  height: height/40.438,
                                  child: FittedBox(
                                    fit:BoxFit.contain,
                                    child: const KText(
                                      text: 'Type       :',
                                      style: TextStyle(
                                          fontFamily: "Davish",
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black),
                                    ),
                                  ),
                                ),

                                Padding(
                                  padding:  EdgeInsets.only(left:width/81.143),
                                  child: SizedBox(
                                    width: width/1.37,
                                    height: height/10.219,
                                    child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        FittedBox(
                                          fit:BoxFit.contain,
                                          child:  Text(
                                            'Non-LInkEd ,participating,indivual,\nlife Assurance,Saving Plan,indivual,\nlife Assurance,Saving Plan',
                                            style: TextStyle(
                                                fontFamily: "Davish",
                                                overflow: TextOverflow.ellipsis,
                                                fontWeight: FontWeight.w500,
                                                fontSize: width/18.654,
                                                color: Color(0xff3CB878)),
                                          ),
                                        ),
                                      ],
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

                SizedBox(
                    height: height/58.438,
                  ),

                  ///Benefits  and more container

                  Material(
                    color: const Color(0xffffffff),
                    shadowColor: Colors.black12,
                    borderRadius: BorderRadius.circular(10),
                    elevation: 10,
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color(0xffffffff),
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding:  EdgeInsets.symmetric(horizontal: width/27.428,vertical: height/58.438),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ///Benefits text
                            SizedBox(
                              width:width/5.3,
                              height: height/35.062,
                              child:  Row(
                                children: [
                                  FittedBox(
                                    fit:BoxFit.contain,
                                    child: KText(
                                      text: 'BENEFITS',
                                      align: TextAlign.start,
                                      style: TextStyle(
                                          fontFamily: "Davish",
                                          fontWeight: FontWeight.w500,
                                          fontSize: width/16.28,
                                          color: Color(0xff3CB878)),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                             SizedBox(
                              height: height/57.438,
                            ),

                             SizedBox(
                              height:height/13.914,
                              width: double.infinity,
                              child: KText(
                                text:
                                    "On Death : Sum Asssured +Simple Reversionary Bonuses till the them of dfeath+ finakl Addditinal Bonus shall be payable ",
                                style: TextStyle(
                                    fontSize: width/28.402, color: Colors.black),
                              ),
                            ),
                             SizedBox(
                              height:height/13.8,
                              width: double.infinity,
                              child: KText(
                                text:
                                    "On maturity : Sum Asssured +Simple Reversionary Bonuses till the them of dfeath+ finakl Addditinal Bonus shall be payable ",
                                style: TextStyle(
                                    fontSize: width/28.402, color: Colors.black,

                                ),
                              ),
                            ),

                             SizedBox(
                              height: height/57.438,
                            ),

                            ///optional Benefits

                            SizedBox(
                              width:width/2.8,
                              height: height/35.062,
                              child:  Row(
                                children: [
                                  FittedBox(
                                    fit:BoxFit.contain,
                                    child: KText(
                                      text: 'OPTIONAL BENEFITS',
                                      style: TextStyle(
                                          fontFamily: "Davish",
                                          fontWeight: FontWeight.w500,
                                          fontSize: width/16.28,
                                          color: Color(0xff3CB878)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                             SizedBox(
                              height: height/57.438,
                            ),

                             SizedBox(
                              height:height/13.9140,
                              width: double.infinity,
                              child: KText(
                                text:
                                    "On Death : Sum Asssured +Simple Reversionary Bonuses till the them of dfeath+ finakl Addditinal Bonus shall be payable ",
                                style: TextStyle(
                                    fontSize: width/28.402, color: Colors.black),
                              ),
                            ),

                             SizedBox(
                              height: height/57.438,
                            ),

                            SizedBox(
                              height: height/3.9,
                              child: Column(
                                children: [
                                  Container(
                                    height:height/14.914,
                                    decoration: const BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          Color(0xff0C9346),
                                          Color(0xff008069)
                                        ],
                                      ),
                                    ),
                                    padding:  EdgeInsets.only(
                                        left: width/13.714, right: width/13.714),
                                    child:  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        KText(
                                          text: 'Mode OF Installment\nPayment',
                                          align: TextAlign.center,
                                          style: TextStyle(
                                              fontFamily: "Davish",
                                              fontSize: width/19.28,
                                              color: Colors.white),
                                        ),
                                        KText(
                                          text: 'Minium   Installment\nAmount',
                                          align: TextAlign.center,
                                          style: TextStyle(
                                              fontFamily: "Davish",
                                              fontSize: width/19.28,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: height/25.062,
                                       width: width/2.256,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.grey.shade400,
                                                width: 0.6)),
                                        padding:  EdgeInsets.only(left: width/82.286),
                                        child:  Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            KText(
                                              text: 'Monthly',
                                              align: TextAlign.justify,
                                              style: TextStyle(
                                                  fontFamily: "Davish",
                                                  fontSize: width/18.28,
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height: height/25.062,
                                       width: width/2.256,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.grey.shade400,
                                                width: 0.6)),
                                        padding:  EdgeInsets.only(left: width/82.286),
                                        child:  Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            KText(
                                              text: '₹ 5000',
                                              align: TextAlign.justify,
                                              style: TextStyle(
                                                  fontFamily: "Davish",
                                                  fontSize: width/18.28,
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: height/25.062,
                                       width: width/2.256,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.grey.shade400,
                                                width: 0.6)),
                                        padding:  EdgeInsets.only(left: width/82.286),
                                        child:  Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            KText(
                                              text: 'Quaterly',
                                              align: TextAlign.justify,
                                              style: TextStyle(
                                                  fontFamily: "Davish",
                                                  fontSize: width/18.28,
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height: height/25.062,
                                       width: width/2.256,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.grey.shade400,
                                                width: 0.6)),
                                        padding:  EdgeInsets.only(left: width/82.286),
                                        child:  Center(
                                          child: KText(
                                            text: '₹ 15000',
                                            align: TextAlign.justify,
                                            style: TextStyle(
                                                fontFamily: "Davish",
                                                fontSize: width/18.28,
                                                color: Colors.black),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: height/25.062,
                                       width: width/2.256,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.grey.shade400,
                                                width: 0.6)),
                                        padding:  EdgeInsets.only(left: width/82.286),
                                        child:  Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            KText(
                                              text: 'Half-Yearly',
                                              align: TextAlign.justify,
                                              style: TextStyle(
                                                  fontFamily: "Davish",
                                                  fontSize: width/18.28,
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height: height/25.062,
                                       width: width/2.256,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.grey.shade400,
                                                width: 0.6)),
                                        padding:  EdgeInsets.only(left: width/82.286),
                                        child:  Center(
                                          child: KText(
                                            text: '₹ 25000',
                                            align: TextAlign.justify,
                                            style: TextStyle(
                                                fontFamily: "Davish",
                                                fontSize: width/18.28,
                                                color: Colors.black),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: height/25.062,
                                       width: width/2.256,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.grey.shade400,
                                                width: 0.6)),
                                        padding:  EdgeInsets.only(left: width/82.286),
                                        child:  Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            KText(
                                              text: 'Yearly',
                                              align: TextAlign.justify,
                                              style: TextStyle(
                                                  fontFamily: "Davish",
                                                  fontSize: width/18.28,
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height: height/25.062,
                                       width: width/2.256,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.grey.shade400,
                                                width: 0.6)),
                                        padding:  EdgeInsets.only(left: width/82.286),
                                        child:  Center(
                                          child: KText(
                                            text: '₹ 5000',
                                            align: TextAlign.justify,
                                            style: TextStyle(
                                                fontFamily: "Davish",
                                                fontSize: width/18.28,
                                                color: Colors.black),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(
                              height: height/1.6,
                              child: Column(
                                children: [
                                  Container(
                                   height: height/23.119,
                                    decoration: const BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          Color(0xff0C9346),
                                          Color(0xff008069)
                                        ],
                                      ),
                                    ),
                                    child:  Center(
                                      child: KText(
                                        text: 'CRITICAL ILLNESS',
                                        align: TextAlign.center,
                                        style: TextStyle(
                                            fontFamily: "Davish",
                                            fontSize: width/19.28,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: height/15.062,
                                       width: width/2.256,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.grey.shade400,
                                                width: 0.6)),
                                        padding:  EdgeInsets.only(left: width/82.286),
                                        child:  Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            KText(
                                              text:
                                                  '1. Cancel Of Specified\nSeverity',
                                              align: TextAlign.justify,
                                              style: TextStyle(
                                                  fontFamily: "Davish",
                                                  fontSize: width/18.28,
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height: height/15.062,
                                       width: width/2.256,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.grey.shade400,
                                                width: 0.6)),
                                        padding:  EdgeInsets.only(left: width/82.286),
                                        child:  Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            KText(
                                              text: "9. Aortic Surgery",
                                              align: TextAlign.justify,
                                              style: TextStyle(
                                                  fontFamily: "Davish",
                                                  fontSize: width/18.28,
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: height/15.062,
                                       width: width/2.256,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.grey.shade400,
                                                width: 0.6)),
                                        padding:  EdgeInsets.only(left: width/82.286),
                                        child:  Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            KText(
                                              text: '2. Open Chest CABG',
                                              align: TextAlign.justify,
                                              style: TextStyle(
                                                  fontFamily: "Davish",
                                                  fontSize: width/18.28,
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height: height/15.062,
                                       width: width/2.256,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.grey.shade400,
                                                width: 0.6)),
                                        padding:  EdgeInsets.only(left: width/82.286),
                                        child:  Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            KText(
                                              text:
                                                  "10. Alzheimer's \nDisease/Dementia",
                                              align: TextAlign.justify,
                                              style: TextStyle(
                                                  fontFamily: "Davish",
                                                  fontSize: width/18.28,
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: height/15.062,
                                       width: width/2.256,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.grey.shade400,
                                                width: 0.6)),
                                        padding:  EdgeInsets.only(left: width/82.286),
                                        child:  Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            KText(
                                              text: '3. Myocardial Infraction',
                                              align: TextAlign.justify,
                                              style: TextStyle(
                                                  fontFamily: "Davish",
                                                  fontSize: width/18.28,
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height: height/15.062,
                                       width: width/2.256,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.grey.shade400,
                                                width: 0.6)),
                                        padding:  EdgeInsets.only(left: width/82.286),
                                        child:  Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            KText(
                                              text: "11. Blindness",
                                              align: TextAlign.justify,
                                              style: TextStyle(
                                                  fontFamily: "Davish",
                                                  fontSize: width/18.28,
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: height/15.062,
                                       width: width/2.256,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.grey.shade400,
                                                width: 0.6)),
                                        padding:  EdgeInsets.only(left: width/82.286),
                                        child:  Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            KText(
                                              text: '4. Myocardial Infraction',
                                              align: TextAlign.justify,
                                              style: TextStyle(
                                                  fontFamily: "Davish",
                                                  fontSize: width/18.28,
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height: height/15.062,
                                       width: width/2.256,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.grey.shade400,
                                                width: 0.6)),
                                        padding:  EdgeInsets.only(left: width/82.286),
                                        child:  Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            KText(
                                              text: "11. Blindness",
                                              align: TextAlign.justify,
                                              style: TextStyle(
                                                  fontFamily: "Davish",
                                                  fontSize: width/18.28,
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: height/15.062,
                                       width: width/2.256,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.grey.shade400,
                                                width: 0.6)),
                                        padding:  EdgeInsets.only(left: width/82.286),
                                        child:  Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            KText(
                                              text: '5. Myocardial Infraction',
                                              align: TextAlign.justify,
                                              style: TextStyle(
                                                  fontFamily: "Davish",
                                                  fontSize: width/18.28,
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height: height/15.062,
                                       width: width/2.256,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.grey.shade400,
                                                width: 0.6)),
                                        padding:  EdgeInsets.only(left: width/82.286),
                                        child:  Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            KText(
                                              text: "12. Blindness",
                                              align: TextAlign.justify,
                                              style: TextStyle(
                                                  fontFamily: "Davish",
                                                  fontSize: width/18.28,
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: height/15.062,
                                       width: width/2.256,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.grey.shade400,
                                                width: 0.6)),
                                        padding:  EdgeInsets.only(left: width/82.286),
                                        child:  Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            KText(
                                              text: '6. Myocardial Infraction',
                                              align: TextAlign.justify,
                                              style: TextStyle(
                                                  fontFamily: "Davish",
                                                  fontSize: width/18.28,
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height: height/15.062,
                                       width: width/2.256,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.grey.shade400,
                                                width: 0.6)),
                                        padding:  EdgeInsets.only(left: width/82.286),
                                        child:  Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            KText(
                                              text: "13. Blindness",
                                              align: TextAlign.justify,
                                              style: TextStyle(
                                                  fontFamily: "Davish",
                                                  fontSize: width/18.28,
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: height/15.062,
                                       width: width/2.256,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.grey.shade400,
                                                width: 0.6)),
                                        padding:  EdgeInsets.only(left: width/82.286),
                                        child:  Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            KText(
                                              text: '7. Myocardial Infraction',
                                              align: TextAlign.justify,
                                              style: TextStyle(
                                                  fontFamily: "Davish",
                                                  fontSize: width/18.28,
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height: height/15.062,
                                       width: width/2.256,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.grey.shade400,
                                                width: 0.6)),
                                        padding:  EdgeInsets.only(left: width/82.286),
                                        child:  Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            KText(
                                              text: "14. Blindness",
                                              align: TextAlign.justify,
                                              style: TextStyle(
                                                  fontFamily: "Davish",
                                                  fontSize: width/18.28,
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    height: height/15.062,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.grey.shade400,
                                            width: 0.6)),
                                    padding:  EdgeInsets.only(left: width/82.286),
                                    child:  Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        KText(
                                          text: '8. Myocardial Infraction',
                                          align: TextAlign.justify,
                                          style: TextStyle(
                                              fontFamily: "Davish",
                                              fontSize: width/18.28,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                SizedBox(
                    height: height/58.438,
                  ),

                  ///eligibility container
                  Material(
                    color: const Color(0xffffffff),
                    shadowColor: Colors.black12,
                    borderRadius: BorderRadius.circular(10),
                    elevation: 10,
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color(0xffffffff),
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                     padding:  EdgeInsets.symmetric(horizontal: width/27.428,vertical: height/58.438),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ///ELIGIBILITY text
                            SizedBox(
                              width:width/2.1,
                              height: height/35.062,
                              child:  Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  FittedBox(
                                    fit: BoxFit.contain,
                                    child: KText(
                                      text: 'ELIGIBILITY CONDITIONS',
                                      style: TextStyle(
                                          fontFamily: "Davish",
                                          fontWeight: FontWeight.w500,
                                          fontSize: width/16.28,
                                          color: Color(0xff3CB878)),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                             SizedBox(
                              height: height/57.438,
                            ),

                             SizedBox(
                              height: height/5.3,
                              width: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  KText(
                                    text: "Minimum Age: 8 Years",
                                    style: TextStyle(
                                        fontSize: width/28.402, color: Colors.black),
                                  ),
                                  KText(
                                    text: "Minimum Term: 12 Years",
                                    style: TextStyle(
                                        fontSize: width/28.402, color: Colors.black),
                                  ),
                                  KText(
                                    text: "Minimum Sum Assured:₹ 100000",
                                    style: TextStyle(
                                        fontSize: width/28.402, color: Colors.black),
                                  ),
                                  KText(
                                    text:
                                        "Basic Sum Assured in multiples of ₹ 100000\nMaximum Age: 55 Years",
                                    style: TextStyle(
                                        fontSize: width/28.402, color: Colors.black),
                                  ),
                                  KText(
                                    text: "Maximum Term: 35 Years",
                                    style: TextStyle(
                                        fontSize: width/28.402, color: Colors.black),
                                  ),
                                  KText(
                                    text: "Maximum Sum Assured: No Limit",
                                    style: TextStyle(
                                        fontSize: width/28.402, color: Colors.black),
                                  ),
                                  KText(
                                    text: "Maximum Matirity Age: 75 Years",
                                    style: TextStyle(
                                        fontSize: width/28.402, color: Colors.black),
                                  ),
                                ],
                              ),
                            ),

                             SizedBox(
                              height: height/57.438,
                            ),



                            SizedBox(
                              width:width/3.0,
                              height: height/35.062,
                              child: const FittedBox(
                                fit: BoxFit.contain,
                                child: KText(
                                  text: 'MODE OF PREMIUM',
                                  style: TextStyle(
                                      fontFamily: "Davish",
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff3CB878)),
                                ),
                              ),
                            ),
                             SizedBox(
                              height: height/57.438,
                            ),

                             SizedBox(
                             height: height/29.119,
                              width: double.infinity,
                              child: KText(
                                text: "Yearly,Half Yearly,Quarterly,Monthly",
                                style: TextStyle(
                                    fontSize: width/28.402, color: Colors.black),
                              ),
                            ),

                             SizedBox(
                              height: height/57.438,
                            ),
                            SizedBox(
                              width:width/7.6,
                              height: height/30.062,
                              child: const FittedBox(
                                fit: BoxFit.contain,
                                child: KText(
                                  text: 'REBATE',
                                  style: TextStyle(
                                      fontFamily: "Davish",
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff3CB878)),
                                ),
                              ),
                            ),

                             SizedBox(
                              height: height/57.438,
                            ),

                            SizedBox(
                              height:height/4.261,
                              child: Column(
                                children: [
                                  Container(
                                    height: height/20.062,
                                    decoration: const BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          Color(0xff0C9346),
                                          Color(0xff008069)
                                        ],
                                      ),
                                    ),
                                    padding:  EdgeInsets.only(left: width/82.286),
                                    child:  Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        KText(
                                          text: 'Mode',
                                          align: TextAlign.center,
                                          style: TextStyle(
                                              fontFamily: "Davish",
                                              fontSize: width/18.28,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: height/25.062,
                                       width: width/2.256,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.grey.shade400,
                                                width: 0.6)),
                                        padding:  EdgeInsets.only(left: width/82.286),
                                        child:  Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            KText(
                                              text: 'Monthly',
                                              align: TextAlign.justify,
                                              style: TextStyle(
                                                  fontFamily: "Davish",
                                                  fontSize: width/18.28,
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height: height/25.062,
                                       width: width/2.256,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.grey.shade400,
                                                width: 0.6)),
                                        padding:  EdgeInsets.only(left: width/82.286),
                                        child:  Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            KText(
                                              text: '₹ 5000',
                                              align: TextAlign.justify,
                                              style: TextStyle(
                                                  fontFamily: "Davish",
                                                  fontSize: width/16.28,
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: height/25.062,
                                       width: width/2.256,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.grey.shade400,
                                                width: 0.6)),
                                        padding:  EdgeInsets.only(left: width/82.286),
                                        child:  Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            KText(
                                              text: 'Quaterly',
                                              align: TextAlign.justify,
                                              style: TextStyle(
                                                  fontFamily: "Davish",
                                                  fontSize: width/16.28,
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height: height/25.062,
                                       width: width/2.256,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.grey.shade400,
                                                width: 0.6)),
                                        padding:  EdgeInsets.only(left: width/82.286),
                                        child:  Center(
                                          child: KText(
                                            text: '₹ 15000',
                                            align: TextAlign.justify,
                                            style: TextStyle(
                                                fontFamily: "Davish",
                                                fontSize: width/16.28,
                                                color: Colors.black),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: height/25.062,
                                       width: width/2.256,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.grey.shade400,
                                                width: 0.6)),
                                        padding:  EdgeInsets.only(left: width/82.286),
                                        child:  Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            KText(
                                              text: 'Half-Yearly',
                                              align: TextAlign.justify,
                                              style: TextStyle(
                                                  fontFamily: "Davish",
                                                  fontSize: width/16.28,
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height: height/25.062,
                                       width: width/2.256,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.grey.shade400,
                                                width: 0.6)),
                                        padding:  EdgeInsets.only(left: width/82.286),
                                        child:  Center(
                                          child: KText(
                                            text: '₹ 25000',
                                            align: TextAlign.justify,
                                            style: TextStyle(
                                                fontFamily: "Davish",
                                                fontSize: width/16.28,
                                                color: Colors.black),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: height/25.062,
                                       width: width/2.256,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.grey.shade400,
                                                width: 0.6)),
                                        padding:  EdgeInsets.only(left: width/82.286),
                                        child:  Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            KText(
                                              text: 'Yearly',
                                              align: TextAlign.justify,
                                              style: TextStyle(
                                                  fontFamily: "Davish",
                                                  fontSize: width/16.28,
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height: height/25.062,
                                       width: width/2.256,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.grey.shade400,
                                                width: 0.6)),
                                        padding:  EdgeInsets.only(left: width/82.286),
                                        child:  Center(
                                          child: KText(
                                            text: '₹ 5000',
                                            align: TextAlign.justify,
                                            style: TextStyle(
                                                fontFamily: "Davish",
                                                fontSize: width/16.28,
                                                color: Colors.black),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(
                              height: height/4.304,
                              child: Column(
                                children: [
                                  Container(
                                    height: height/13.349,
                                    decoration: const BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          Color(0xff0C9346),
                                          Color(0xff008069)
                                        ],
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                         height: height/15.119,
                                         width: width/2.256,
                                          padding:
                                           EdgeInsets.only(left: width/82.286),
                                          child:  Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              KText(
                                                text:
                                                    'HIGH SUM ASSURED\nREBATE',
                                                align: TextAlign.justify,
                                                style: TextStyle(
                                                    fontFamily: "Davish",
                                                    fontSize: width/18.28,
                                                    color: Colors.white),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                         height: height/15.119,
                                         width: width/2.256,
                                          padding:
                                               EdgeInsets.only(left: width/82.286),
                                          child:  Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              KText(
                                                text:
                                                    'REBATE PER ₹ 1000 \nBASIC SUM ASSURED',
                                                align: TextAlign.center,
                                                style: TextStyle(
                                                    fontFamily: "Davish",
                                                    fontSize: width/16.28,
                                                    color: Colors.white),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: height/25.062,
                                       width: width/2.256,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.grey.shade400,
                                                width: 0.6)),
                                        padding:  EdgeInsets.only(left: width/82.286),
                                        child:  Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            KText(
                                              text: '₹ 100000 to 195000',
                                              align: TextAlign.justify,
                                              style: TextStyle(
                                                  fontFamily: "Davish",
                                                  fontSize: width/16.28,
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height: height/25.062,
                                       width: width/2.256,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.grey.shade400,
                                                width: 0.6)),
                                        padding:  EdgeInsets.only(left: width/82.286),
                                        child:  Center(
                                          child: KText(
                                            text: "Nil",
                                            align: TextAlign.justify,
                                            style: TextStyle(
                                                fontFamily: "Davish",
                                                fontSize: width/16.28,
                                                color: Colors.black),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: height/25.062,
                                       width: width/2.256,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.grey.shade400,
                                                width: 0.6)),
                                        padding:  EdgeInsets.only(left: width/82.286),
                                        child:  Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            KText(
                                              text: '₹ 200000 to 495000',
                                              align: TextAlign.justify,
                                              style: TextStyle(
                                                  fontFamily: "Davish",
                                                  fontSize: width/16.28,
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height: height/25.062,
                                       width: width/2.256,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.grey.shade400,
                                                width: 0.6)),
                                        padding:  EdgeInsets.only(left: width/82.286),
                                        child:  Center(
                                          child: KText(
                                            text: "2",
                                            align: TextAlign.justify,
                                            style: TextStyle(
                                                fontFamily: "Davish",
                                                fontSize: width/16.28,
                                                color: Colors.black),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: height/25.062,
                                       width: width/2.256,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.grey.shade400,
                                                width: 0.6)),
                                        padding:  EdgeInsets.only(left: width/82.286),
                                        child:  Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            KText(
                                              text: '₹ 500000 to Above',
                                              align: TextAlign.justify,
                                              style: TextStyle(
                                                  fontFamily: "Davish",
                                                  fontSize: width/16.28,
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height: height/25.062,
                                       width: width/2.256,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.grey.shade400,
                                                width: 0.6)),
                                        padding:  EdgeInsets.only(left: width/82.286),
                                        child:  Center(
                                          child: KText(
                                            text: "3",
                                            align: TextAlign.justify,
                                            style: TextStyle(
                                                fontFamily: "Davish",
                                                fontSize: width/16.28,
                                                color: Colors.black),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  ///Surrender container
                  Material(
                    color: const Color(0xffffffff),
                    shadowColor: Colors.black12,
                    borderRadius: BorderRadius.circular(10),
                    elevation: 10,
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color(0xffffffff),
                          borderRadius: BorderRadius.circular(10)),
                      child:  Padding(
                         padding: EdgeInsets.symmetric(vertical: height/58.438,horizontal: width/27.428),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ///Surrender text
                            SizedBox(
                              width:width/4.0,
                              height: height/35.062,
                              child:  Row(
                                children: [
                                  FittedBox(
                                    fit:BoxFit.contain,
                                    child: KText(
                                      text: 'SURRENDER',
                                      style: TextStyle(
                                          fontFamily: "Davish",
                                          fontWeight: FontWeight.w500,
                                          fontSize: width/16.28,
                                          color: Color(0xff3CB878)),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(
                              height: height/57.438,
                            ),

                            SizedBox(
                              height: height/2.6,
                              width: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  KText(
                                    text:
                                        "Policy Van be surrendered at any time during the policy term provided at least two full years premium hav ebeen paid",
                                    style: TextStyle(
                                        fontSize: width/28.143, color: Colors.black),
                                  ),
                                  KText(
                                    text:
                                        "Policy Van be surrendered at any time during the policy term provided at least two full years premium hav ebeen paid",
                                    style: TextStyle(
                                        fontSize: width/28.143, color: Colors.black),
                                  ),
                                  KText(
                                    text:
                                        "Policy Van be surrendered at any time during the policy term provided at least two full years premium hav ebeen paid",
                                    style: TextStyle(
                                        fontSize: width/28.143, color: Colors.black),
                                  ),
                                  KText(
                                    text:
                                        "Policy Van be surrendered at any time during the policy term provided at least two full years premium hav ebeen paid",
                                    style: TextStyle(
                                        fontSize: width/28.143, color: Colors.black),
                                  ),
                                  KText(
                                    text:
                                        "Policy Van be surrendered at any time during the policy term provided at least two full years premium hav ebeen paid",
                                    style: TextStyle(
                                        fontSize: width/28.143, color: Colors.black),
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(
                              height: height/57.438,
                            ),

                            SizedBox(
                              width:width/10.5,
                              height: height/30.062,
                              child:  Row(
                                children: [
                                  FittedBox(
                                    fit: BoxFit.contain,
                                    child: KText(
                                      text: 'LOAN',
                                      style: TextStyle(
                                          fontFamily: "Davish",
                                          fontWeight: FontWeight.w500,
                                          fontSize: width/16.28,
                                          color: Color(0xff3CB878)),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(
                              height: height/57.438,
                            ),

                            SizedBox(
                              height: height/4.968,
                              width: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  KText(
                                    text:
                                        "At least two full years of premium payment to apply for loan facility ",
                                    style: TextStyle(
                                        fontSize: width/28.143,
                                        color: Colors.black),
                                  ),
                                  KText(
                                    text:
                                        "Loan is a Percentage of Surrender Value",
                                    style: TextStyle(
                                        fontSize: width/28.143, color: Colors.black),
                                  ),
                                  KText(
                                    text:
                                        "For in force policies :Upto 90 % of surrender Value",
                                    style: TextStyle(
                                        fontSize: width/28.143, color: Colors.black),
                                  ),
                                  KText(
                                    text:
                                        "For in force policies :Upto 80 % of surrender Value",
                                    style: TextStyle(
                                        fontSize: width/28.143, color: Colors.black),
                                  ),
                                  KText(
                                    text:
                                        "At least two full years of premium payment to apply for loan For in force policies :Upto 80 % of surrender Value",
                                    style: TextStyle(
                                        fontSize: width/28.143, color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                SizedBox(
                    height: height/58.438,
                  ),
                ],
              ),
            ),
          ),
          endowmentview_bool == true&&val==0
              ?
          SlideInUp(
            animate:endowmentview_bool ,
                from: endowmentview_bool==true?800:-800,
                child: Material(
                    color: const Color(0xffffffff),
                    shadowColor: Colors.black12,
                    borderRadius: BorderRadius.circular(10),
                    elevation: 10,
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color(0xffffffff),
                          borderRadius: BorderRadius.circular(10)),
                      child:Padding(
                        padding:  EdgeInsets.only(left:width/20.571,right:width/20.571),
                        child: SingleChildScrollView(
                          physics: const NeverScrollableScrollPhysics(),
                          child: Column(
                            children: [

                              SizedBox(
                                height:height/1.2609,
                                child: SingleChildScrollView(
                                  physics: const BouncingScrollPhysics(),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height:height/58.438),
                                      SizedBox(
                                        width:width/11.5,
                                        height: height/25.062,
                                        child:  Row(
                                          children: [
                                            FittedBox(
                                              fit:BoxFit.contain,
                                              child: KText(
                                                text: 'Plan',
                                                style: TextStyle(
                                                    fontFamily: "Davish",
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: width/16.28,
                                                    color: Color(0xff3CB878)),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height:height/58.438),
                                      ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: PlanList.length,
                                        physics: const BouncingScrollPhysics(),
                                        itemBuilder: (context, index) {
                                        return Padding(
                                          padding:  EdgeInsets.only(top: height/58.438),
                                          child:  Text(PlanList[index].toString(),style: TextStyle(
                                              fontSize: width/26.143, color: Colors.black),),
                                        );
                                      },),
                                      SizedBox(height:height/58.438),

                                    ],
                                  ),
                                ),
                              ),
                              const Divider(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap:(){
                                      setState(() {
                                        endowmentview_bool=false;
                                        val=1;
                                      });
                                    },
                                    child: SizedBox(
                                      width:width/8.5,
                                      height: height/35.062,
                                      child: const FittedBox(
                                        fit:BoxFit.contain,
                                        child:  KText(
                                          text: 'Cancel',
                                          style: TextStyle(
                                              fontFamily: "Davish",
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xff3CB878)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height:height/58.438),

                            ],
                          ),
                        ),
                      )
                    )),
              ):

              const SizedBox()
        ],
      ),
    );
  }
}
