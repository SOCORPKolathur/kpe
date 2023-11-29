import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Translator_Module/Translator_Module_Page.dart';
import 'Plan_Combo_details_Page.dart';

class Plan_Comb_Page extends StatefulWidget {

  const Plan_Comb_Page({Key? key}) : super(key: key);

  @override
  State<Plan_Comb_Page> createState() => _Plan_Comb_PageState();
}

class _Plan_Comb_PageState extends State<Plan_Comb_Page> {
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
                  fit: BoxFit.contain,
                  alignment: Alignment.centerLeft,
                  child: KText(
                    text: 'Plans Combo',
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
            padding: EdgeInsets.only(top: height/65.9,
                bottom: height/105.9,left: width/41.143,right: width/41.143),
            child: Material(
              elevation: 3,
              borderRadius: BorderRadius.circular(20),
              shadowColor: Colors.grey,
              child: Container(
                height: height/8,
                width: width/1.0,
                decoration: BoxDecoration(
                    color:const Color(0xffffffff),
                    border: Border.all(
                        color: const Color(0xffD1CDCD)
                    ),
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Column(
                  children: [

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        Padding(
                          padding: EdgeInsets.only(top: height/50.6,
                              left:width/25.6),
                          child: SizedBox(
                            width: width/1.80,
                            height: height/35.062,
                            child:   FittedBox(
                              fit: BoxFit.contain,
                              alignment: Alignment.centerLeft,
                              child: KText(text:"planname ",
                                style: TextStyle(
                                    fontFamily: "Davish",
                                    letterSpacing: 1,
                                    fontSize: width/16.28,
                                    fontWeight:FontWeight.w500),),
                            ),
                          ),
                        ),

                        SizedBox(width: width/29.387,),

                        Padding(
                          padding:  EdgeInsets.only(top: height/50.6,),
                          child: GestureDetector(
                            onTap: ()
                            {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const Plan_Combo_details_Page(),));
                            },
                            child: Container(
                              height: height/30.36,
                              width: width/3.56,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                    color:  const Color(0xff0a904c),
                                  ),
                                  gradient: const LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Color(0xff0C9346),
                                        Color(0xff008069),
                                      ]
                                  ),
                                  color: const Color(0xff0a904c)
                              ),
                              child:  SizedBox(
                                height: height/58.438,
                                width: width/5.142,
                                child: Padding(
                                  padding:  EdgeInsets.symmetric(
                                      vertical: height/175.31,
                                      horizontal: width/82.286
                                  ),
                                  child: FittedBox(
                                    fit: BoxFit.contain,
                                    alignment: Alignment.center,
                                    child: KText(text: "View Plan",style: TextStyle(
                                        fontFamily: "Davish",
                                        color: Colors.white,
                                        fontSize: width/20.571


                                    )),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),

                    Padding(
                      padding: EdgeInsets.only(top: height/33.3),
                      child: Container(
                        height: height/25.3,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: const Color(0xffD1CDCD).withOpacity(0.32),
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: width/20.53),
                              child: SizedBox(
                                height: height/37.298,
                                width: width/3.740,
                                child: FittedBox(
                                  fit: BoxFit.contain,
                                  alignment: Alignment.centerLeft,
                                  child: KText(
                                    text: 'Plan No: 999',
                                    style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                        color: const Color(0xff000000)),
                                  ),
                                ),
                              ),
                            ),

                            Padding(
                              padding: EdgeInsets.only(left:width/3.5),
                              child: SizedBox(
                                width: width/3.291,
                                height: height/37.298,
                                child: Center(
                                  child: FittedBox(
                                    fit: BoxFit.contain,
                                    alignment: Alignment.center,
                                    child: KText(
                                      text: "Type",
                                      style: GoogleFonts.poppins(fontWeight: FontWeight.w600,
                                          fontSize: width/29.387,color: const Color(0xff0C9346)),

                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),

    );
  }
}
