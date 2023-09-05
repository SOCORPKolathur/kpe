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
        toolbarHeight: height/9.59,
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Color(0xffF5F5F5),

        flexibleSpace: Container(
          height: height/7.09,
          width: width/3.92,
          decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),

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
            padding: EdgeInsets.only(top: height/35.3,left:width/ 19.6),
            child: Text("Latest Plans",style: GoogleFonts.amaranth(
              fontSize: 26,
              fontWeight: FontWeight.w500,
            ),),
          ),
          Padding(
            padding: EdgeInsets.only(top: height/65.9,left: width/19.6,bottom: height/105.9,),
            child: Material(
              elevation: 3,
              borderRadius: BorderRadius.circular(20),
              shadowColor: Colors.grey,
              child: Container(
                height: height/8,
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
                          letterSpacing: 1,
                          fontWeight:FontWeight.w500),),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: width/7.0,top: height/50.6),
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
                                        Color(0xff0C9346),
                                        Color(0xff008069),
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
                      padding: EdgeInsets.only(top: height/33.3),
                      child: Container(
                        height: height/25.3,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0xffD1CDCD).withOpacity(0.32),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: width/20.53),
                              child: Text(
                                'Plan No: 914',
                                style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize:14,color: Color(0xff000000)),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left:width/3.6),
                              child: Text(
                                'Endowment Plan',
                                style: GoogleFonts.poppins(fontWeight: FontWeight.w600,fontSize:14,color: Color(0xff0C9346)),

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
            padding: EdgeInsets.only(top: height/65.9,left: width/19.6,bottom: height/105.9,),
            child: Material(
              elevation: 3,
              borderRadius: BorderRadius.circular(20),
              shadowColor: Colors.grey,
              child: Container(
                height: height/8,
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
                              letterSpacing: 1,
                              fontWeight:FontWeight.w500),),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: width/7.0,top: height/50.6),
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
                                        Color(0xff0C9346),
                                        Color(0xff008069),
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
                      padding: EdgeInsets.only(top: height/33.3),
                      child: Container(
                        height: height/25.3,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0xffD1CDCD).withOpacity(0.32),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: width/20.53),
                              child: Text(
                                'Plan No: 914',
                                style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize:14,color: Color(0xff000000)),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left:width/3.6),
                              child: Text(
                                'Endowment Plan',
                                style: GoogleFonts.poppins(fontWeight: FontWeight.w600,fontSize:14,color: Color(0xff0C9346)),

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
            padding: EdgeInsets.only(top: height/65.9,left: width/19.6,bottom: height/105.9,),
            child: Material(
              elevation: 3,
              borderRadius: BorderRadius.circular(20),
              shadowColor: Colors.grey,
              child: Container(
                height: height/8,
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
                              letterSpacing: 1,
                              fontWeight:FontWeight.w500),),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: width/7.0,top: height/50.6),
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
                                        Color(0xff0C9346),
                                        Color(0xff008069),
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
                      padding: EdgeInsets.only(top: height/33.3),
                      child: Container(
                        height: height/25.3,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0xffD1CDCD).withOpacity(0.32),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: width/20.53),
                              child: Text(
                                'Plan No: 914',
                                style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize:14,color: Color(0xff000000)),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left:width/3.6),
                              child: Text(
                                'Endowment Plan',
                                style: GoogleFonts.poppins(fontWeight: FontWeight.w600,fontSize:14,color: Color(0xff0C9346)),

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
            padding: EdgeInsets.only(top: height/65.9,left: width/19.6,bottom: height/105.9,),
            child: Material(
              elevation: 3,
              borderRadius: BorderRadius.circular(20),
              shadowColor: Colors.grey,
              child: Container(
                height: height/8,
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
                              letterSpacing: 1,
                              fontWeight:FontWeight.w500),),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: width/7.0,top: height/50.6),
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
                                        Color(0xff0C9346),
                                        Color(0xff008069),
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
                      padding: EdgeInsets.only(top: height/33.3),
                      child: Container(
                        height: height/25.3,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0xffD1CDCD).withOpacity(0.32),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: width/20.53),
                              child: Text(
                                'Plan No: 914',
                                style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize:14,color: Color(0xff000000)),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left:width/3.6),
                              child: Text(
                                'Endowment Plan',
                                style: GoogleFonts.poppins(fontWeight: FontWeight.w600,fontSize:14,color: Color(0xff0C9346)),

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
            padding: EdgeInsets.only(top: height/65.9,left: width/19.6,bottom: height/105.9,),
            child: Material(
              elevation: 3,
              borderRadius: BorderRadius.circular(20),
              shadowColor: Colors.grey,
              child: Container(
                height: height/8,
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
                              letterSpacing: 1,
                              fontWeight:FontWeight.w500),),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: width/7.0,top: height/50.6),
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
                                        Color(0xff0C9346),
                                        Color(0xff008069),
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
                      padding: EdgeInsets.only(top: height/33.3),
                      child: Container(
                        height: height/25.3,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0xffD1CDCD).withOpacity(0.32),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: width/20.53),
                              child: Text(
                                'Plan No: 914',
                                style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize:14,color: Color(0xff000000)),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left:width/3.6),
                              child: Text(
                                'Endowment Plan',
                                style: GoogleFonts.poppins(fontWeight: FontWeight.w600,fontSize:14,color: Color(0xff0C9346)),

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

