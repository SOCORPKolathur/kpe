import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kpe/new%20endowment.dart';

class plans extends StatefulWidget {
  const plans({super.key});

  @override
  State<plans> createState() => _plansState();
}

class _plansState extends State<plans> {
  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xffF5F5F5),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xffffffff),
        flexibleSpace: Container(
          height: height/7.59,
          width: width/3.92,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(17),

            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xff0A904C),Color(0xff018266)],

            ),

          ),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: width/19.6,top:height/21.68),
                child: GestureDetector(
                    onTap: (){
                      Navigator.of(context).pop();
                    },
                    child: Icon(Icons.arrow_back_ios_new_outlined,size: 25,color: Color(0xffffffff),)),
              ),
              Padding(
                padding:EdgeInsets.only(left:width/13.06,top: height/21.68),
                child: GestureDetector(
                  onTap: (){
                    print(height);
                    print(width);
                  },
                  child: Text(
                    'Premium Plans',
                   style: TextStyle(
                     color: Color(0xffffffff),
                     fontSize: 32,
                     fontWeight: FontWeight.w500,
                     fontFamily: "Davish"
                   ),
                  ),
                ),
              ),

            ],
          ),

        ),
      ),
      body:Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: height/25.3,left:width/ 19.6),
            child: Text("Latest Plans",style: GoogleFonts.amaranth(
              fontSize: 25 ,
              fontWeight: FontWeight.w500,
            ),),
          ),
          Padding(
            padding: EdgeInsets.only(top: height/75.9,left: width/19.6),
            child: Material(
              elevation: 3,
              borderRadius: BorderRadius.circular(20),
              shadowColor: Colors.grey,
              child: Container(
                height: height/7.44,
                width: width/1.12,
                decoration: BoxDecoration(
                  color:Color(0xffffffff),
                  border: Border.all(
                    color: Color(0xffD1CDCD)
                  ),
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: height/50.6,left:width/19.6),
                          child: Text("NEW ENDOWMENT",style: TextStyle(
                              fontFamily: "Davish",fontSize: 25,
                          fontWeight:FontWeight.w600),),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: width/5.6,top: height/50.6),
                          child: GestureDetector(
                            onTap: ()
                            {
                              Navigator.of(context).push(
                                MaterialPageRoute(builder: (context)=>endowment())
                              );
                            },
                            child: Container(
                              height: height/30.36,
                              width: width/3.56,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                    color:  Color(0xff0a904c),
                                  ),
                                  gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Color(0xff0a904c),
                                        Color(0xff018266),
                                      ]
                                  ),
                                  color: Color(0xff0a904c)
                              ),
                              child: Center(
                                child: Text("View Plan",style: TextStyle(
                                    fontFamily: "Davish",
                                    color: Colors.white,
                                    fontSize: 18
                                )),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: height/25.3),
                      child: Container(
                        height: height/25.3,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0xffD1CDCD),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: width/8.53),
                              child: Text(
                                'Plan No: 914',
                                style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize:14,color: Color(0xff000000)),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left:width/4.35),
                              child: Text(
                                'Endowment Plan',
                                style: TextStyle(
                                  color: Color(0xff008069),
                                  fontSize: 14,
                                  fontFamily: "Segoe UI",
                                  fontWeight: FontWeight.w600
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
          ),
          Padding(
            padding:EdgeInsets.only(top: height/37.95,left:width/ 19.6),
            child: Material(
              elevation: 3,
              borderRadius: BorderRadius.circular(20),
              shadowColor: Colors.grey,
              child: Container(
                height: height/7.44,
                width: width/1.12,
                decoration: BoxDecoration(
                    color:Color(0xffffffff),
                    border: Border.all(
                        color: Color(0xffD1CDCD)
                    ),
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: height/50.6,left: width/19.6),
                          child: Text("NEW JEEVAN ANAND",style: TextStyle(
                              fontFamily: "Davish",fontSize: 25,
                              fontWeight:FontWeight.w600),),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: width/7.12,top: height/50.6),
                          child: Container(
                            height: height/30.36,
                            width: width/3.56,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  color:  Color(0xff0a904c),
                                ),
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color(0xff0a904c),
                                      Color(0xff018266),
                                    ]
                                ),
                                color: Color(0xff0a904c)
                            ),
                            child: Center(
                              child: Text("View Plan",style: TextStyle(
                                  fontFamily: "Davish",
                                  color: Colors.white,
                                  fontSize: 18
                              )),
                            ),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: height/25.3),
                      child: Container(
                        height: height/25.3,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0xffD1CDCD),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: width/8.53),
                              child: Text(
                                'Plan No: 914',
                                style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize:14,color: Color(0xff000000)),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left:width/4.35),
                              child: Text(
                                'Endowment Plan',
                                style: TextStyle(
                                    color: Color(0xff008069),
                                    fontSize: 14,
                                    fontFamily: "Segoe UI",
                                    fontWeight: FontWeight.w600
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
          ),
          Padding(
            padding:  EdgeInsets.only(top:height/37.95,left: width/19.6),
            child: Material(
              elevation: 3,
              borderRadius: BorderRadius.circular(20),
              shadowColor: Colors.grey,
              child: Container(
                height:height/7.44,
                width: width/1.12,
                decoration: BoxDecoration(
                    color:Color(0xffffffff),
                    border: Border.all(
                        color: Color(0xffD1CDCD)
                    ),
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding:  EdgeInsets.only(top:height/50.6,left:width/19.6),
                          child: Text("JEEVAN LAKSHYA",style: TextStyle(
                              fontFamily: "Davish",fontSize: 25,
                              fontWeight:FontWeight.w600),),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: width/4.78,top: height/50.6),
                          child: Container(
                            height: height/30.36,
                            width:width/3.56,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  color:  Color(0xff0a904c),
                                ),
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color(0xff0a904c),
                                      Color(0xff018266),
                                    ]
                                ),
                                color: Color(0xff0a904c)
                            ),
                            child: Center(
                              child: Text("View Plan",style: TextStyle(
                                  fontFamily: "Davish",
                                  color: Colors.white,
                                  fontSize: 18
                              )),
                            ),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: height/25.3),
                      child: Container(
                        height: height/25.3,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0xffD1CDCD),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: width/8.53),
                              child: Text(
                                'Plan No: 914',
                                style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize:14,color: Color(0xff000000)),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left:width/4.35),
                              child: Text(
                                'Money Back Plan',
                                style: TextStyle(
                                    color: Color(0xff008069),
                                    fontSize: 14,
                                    fontFamily: "Segoe UI",
                                    fontWeight: FontWeight.w600
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
          ),
          Padding(
            padding: EdgeInsets.only(top: height/37.95,left:width/19.6),
            child: Material(
              elevation: 3,
              borderRadius: BorderRadius.circular(20),
              shadowColor: Colors.grey,
              child: Container(
                height: height/7.15,
                width:width/1.12,
                decoration: BoxDecoration(
                    color:Color(0xffffffff),
                    border: Border.all(
                        color: Color(0xffD1CDCD)
                    ),
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding:  EdgeInsets.only(top:height/40.1,left:width/27.95),
                          child: Text("JEEVAN LABH",style: TextStyle(
                              fontFamily: "Davish",fontSize: 25,
                              fontWeight:FontWeight.w600),),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: width/3.62,top: height/50.6),
                          child: Container(
                            height: height/30.36,
                            width: width/3.56,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  color:  Color(0xff0a904c),
                                ),
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color(0xff0a904c),
                                      Color(0xff018266),
                                    ]
                                ),
                                color: Color(0xff0a904c)
                            ),
                            child: Center(
                              child: Text("View Plan",style: TextStyle(
                                  fontFamily: "Davish",
                                  color: Colors.white,
                                  fontSize: 18
                              )),
                            ),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding:  EdgeInsets.only(top:height/25.3),
                      child: Container(
                        height: height/25.3,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0xffD1CDCD),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: width/8.53),
                              child: Text(
                                'Plan No: 914',
                                style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize:14,color: Color(0xff000000)),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left:width/4.35),
                              child: Text(
                                'Money Back Plan',
                                style: TextStyle(
                                    color: Color(0xff008069),
                                    fontSize: 14,
                                    fontFamily: "Segoe UI",
                                    fontWeight: FontWeight.w600
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
          ),
          Padding(
            padding: EdgeInsets.only(top: height/37.95,left:width/19.6),
            child: Material(
              elevation: 3,
              borderRadius: BorderRadius.circular(20),
              shadowColor: Colors.grey,
              child: Container(
                height: height/7.15,
                width:width/1.12,
                decoration: BoxDecoration(
                    color:Color(0xffffffff),
                    border: Border.all(
                        color: Color(0xffD1CDCD)
                    ),
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding:  EdgeInsets.only(top:height/40.1,left:width/27.95),
                          child: Text("AADHAR STAMBH",style: TextStyle(
                              fontFamily: "Davish",fontSize: 25,
                              fontWeight:FontWeight.w600),),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: width/4.62,top: height/50.6),
                          child: Container(
                            height: height/30.36,
                            width: width/3.56,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  color:  Color(0xff0a904c),
                                ),
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color(0xff0a904c),
                                      Color(0xff018266),
                                    ]
                                ),
                                color: Color(0xff0a904c)
                            ),
                            child: Center(
                              child: Text("View Plan",style: TextStyle(
                                  fontFamily: "Davish",
                                  color: Colors.white,
                                  fontSize: 18
                              )),
                            ),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding:  EdgeInsets.only(top:height/25.3),
                      child: Container(
                        height: height/25.3,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0xffD1CDCD),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: width/8.53),
                              child: Text(
                                'Plan No: 914',
                                style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize:14,color: Color(0xff000000)),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left:width/4.35),
                              child: Text(
                                'Money Back Plan',
                                style: TextStyle(
                                    color: Color(0xff008069),
                                    fontSize: 14,
                                    fontFamily: "Segoe UI",
                                    fontWeight: FontWeight.w600
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
          ),
        ],
      ),

    );


  }
}

