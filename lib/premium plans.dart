import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Translator_Module/Translator_Module_Page.dart';

class premium extends StatefulWidget {
  const premium({super.key});

  @override
  State<premium> createState() => _premiumState();
}

class _premiumState extends State<premium> {
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
                  child: KText(
                    text: 'Premium Plans',
                    style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize:22,color: Color(0xffFFFFFF)),
                  ),
                ),
              ),

            ],
          ),

        ),
      ),
      body:
    /*  Column(
        children: [

          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left:width/8.71,top:height/25.3),
                child: Text(
                  'Latest Plans',
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize:24,color: Color(0xff000000)),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: width/19.6,top: height/37.95),
                child: Material(
                  elevation: 3,
                  borderRadius: BorderRadius.circular(17),
                  child: GestureDetector(
                    onTap: ()
                    {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context)=>new endowment())
                      );
                    },
                    child: Container(
                      height:height/7.59,
                      width:width/1.12,
                      decoration: BoxDecoration(

                        color: Color(0xffFFFFFF),

                        borderRadius: BorderRadius.circular(17),


                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(bottom: height/21.68,left: width/19.6),
                                child: Text(
                                  'NEW ENDOWMENT',
                                  style: GoogleFonts.poppins(fontWeight: FontWeight.w600,fontSize:22,color: Color(0xff000000)),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: width/13.06,bottom:height/21.68),
                                child: Container(
                                  height: height/37.95,
                                  width: width/4.9,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),

                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [Color(0xff0A904C),Color(0xff018266)],

                                    ),

                                  ),
                                  child:Padding(
                                    padding: EdgeInsets.only(left:width/39.2),
                                    child: Text(
                                      'View Plan',
                                      style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize:12,color: Color(0xffffffff)),
                                    ),
                                  ),
                                ),
                              )

                            ],
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: height/446470.58),
                                child: Container(
                                  height:height/24.48,
                                  width:width/1.12,
                                  decoration: BoxDecoration(
                                    color: Color(0xffF0EFEF),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child:Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(left: width/6.53),
                                        child: Text(
                                          'Plan No: 914',
                                          style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize:14,color: Color(0xff000000)),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left:width/4.35),
                                        child: Text(
                                          'Endowment Plan',
                                          style: GoogleFonts.poppins(fontWeight: FontWeight.w600,fontSize:12,color: Color(0xff008069)),
                                        ),
                                      ),
                                    ],
                                  ),

                                ),
                              ),
                            ],
                          )
                        ],

                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: width/19.6,top: height/37.95),
                child: Material(
                  elevation: 3,
                  borderRadius: BorderRadius.circular(17),
                  child: Container(
                    height:height/7.59,
                    width:width/1.12,
                    decoration: BoxDecoration(

                      color: Color(0xffFFFFFF),

                      borderRadius: BorderRadius.circular(17),


                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding:  EdgeInsets.only(bottom: height/21.68,left: width/19.6),
                              child: Text(
                                'NEW JEEVAN ANAND',
                                style: GoogleFonts.poppins(fontWeight: FontWeight.w600,fontSize:21,color: Color(0xff000000)),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: width/19.6,bottom:height/21.68),
                              child: Container(
                                height: height/37.95,
                                width: width/4.9,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),

                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [Color(0xff0A904C),Color(0xff018266)],

                                  ),

                                ),
                                child:Padding(
                                  padding: EdgeInsets.only(left: width/39.2),
                                  child: Text(
                                    'View Plan',
                                    style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize:12,color: Color(0xffffffff)),
                                  ),
                                ),
                              ),
                            )

                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding:  EdgeInsets.only(top: height/446470.58),
                              child: Container(
                                height:height/24.48,
                                width:width/1.12,
                                decoration: BoxDecoration(
                                  color: Color(0xffF0EFEF),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child:Row(
                                  children: [
                                    Padding(
                                      padding:  EdgeInsets.only(left: width/6.53),
                                      child: Text(
                                        'Plan No: 914',
                                        style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize:14,color: Color(0xff000000)),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: width/4.35),
                                      child: Text(
                                        'Endowment Plan',
                                        style: GoogleFonts.poppins(fontWeight: FontWeight.w600,fontSize:12,color: Color(0xff008069)),
                                      ),
                                    ),
                                  ],
                                ),

                              ),
                            ),
                          ],
                        )
                      ],

                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: width/19.6,top: height/37.95),
                child: Material(
                  elevation: 3,
                  borderRadius: BorderRadius.circular(17),
                  child: Container(
                    height:height/7.59,
                    width:width/1.12,
                    decoration: BoxDecoration(

                      color: Color(0xffFFFFFF),

                      borderRadius: BorderRadius.circular(17),


                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding:EdgeInsets.only(bottom: height/21.68,left: width/19.6),
                              child: Text(
                                'JEEVAN LAKSHYA',
                                style: GoogleFonts.poppins(fontWeight: FontWeight.w600,fontSize:22,color: Color(0xff000000)),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: width/9.33,bottom:height/21.68),
                              child: Container(
                                height: height/37.95,
                                width: width/4.9,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),

                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [Color(0xff0A904C),Color(0xff018266)],

                                  ),

                                ),
                                child:Padding(
                                  padding: EdgeInsets.only(left: width/30.25),
                                  child: Text(
                                    'View Plan',
                                    style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize:12,color: Color(0xffffffff)),
                                  ),
                                ),
                              ),
                            )

                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: height/446470.58),
                              child: Container(
                                height:height/24.48,
                                width:width/1.12,
                                decoration: BoxDecoration(
                                  color: Color(0xffF0EFEF),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child:Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left: width/6.53),
                                      child: Text(
                                        'Plan No: 914',
                                        style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize:14,color: Color(0xff000000)),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left:width/4.35),
                                      child: Text(
                                        'Money Back Plan',
                                        style: GoogleFonts.poppins(fontWeight: FontWeight.w600,fontSize:12,color: Color(0xff008069)),
                                      ),
                                    ),
                                  ],
                                ),

                              ),
                            ),
                          ],
                        )
                      ],

                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: width/19.6,top: height/37.95),
                child: Material(
                  elevation: 3,
                  borderRadius: BorderRadius.circular(17),
                  child: Container(
                    height:height/7.59,
                    width:width/1.12,
                    decoration: BoxDecoration(
                      color: Color(0xffFFFFFF),
                      borderRadius: BorderRadius.circular(17),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(bottom: height/21.68,left: width/19.6),
                              child: Text(
                                'JEEVAN LABH',
                                style: GoogleFonts.poppins(fontWeight: FontWeight.w600,fontSize:22,color: Color(0xff000000)),
                              ),
                            ),
                            Padding(
                              padding:  EdgeInsets.only(left: width/4.9,bottom:height/21.68),
                              child: Container(
                                height: height/37.95,
                                width: width/4.9,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),

                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [Color(0xff0A904C),Color(0xff018266)],

                                  ),

                                ),
                                child:Padding(
                                  padding: EdgeInsets.only(left: width/39.2),
                                  child: Text(
                                    'View Plan',
                                    style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize:12,color: Color(0xffffffff)),
                                  ),
                                ),
                              ),
                            )

                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: height/446470.58),
                              child: Container(
                                height:height/24.48,
                                width:width/1.12,
                                decoration: BoxDecoration(
                                  color: Color(0xffF0EFEF),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child:Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left: width/6.53),
                                      child: Text(
                                        'Plan No: 914',
                                        style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize:14,color: Color(0xff000000)),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: width/4.35),
                                      child: Text(
                                        'Money Back Plan',
                                        style: GoogleFonts.poppins(fontWeight: FontWeight.w600,fontSize:12,color: Color(0xff008069)),
                                      ),
                                    ),
                                  ],
                                ),

                              ),
                            ),
                          ],
                        )
                      ],

                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: width/19.6,top: height/37.95),
                child: Material(
                  elevation: 3,
                  borderRadius: BorderRadius.circular(17),
                  child: Container(
                    height:height/7.59,
                    width:width/1.12,
                    decoration: BoxDecoration(
                      color: Color(0xffFFFFFF),
                      borderRadius: BorderRadius.circular(17),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(bottom: height/21.68,left: width/19.6),
                              child: Text(
                                'AADHAR STAMBH',
                                style: GoogleFonts.poppins(fontWeight: FontWeight.w600,fontSize:22,color: Color(0xff000000)),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: width/10.88,bottom:height/21.68),
                              child: Container(
                                height: height/37.95,
                                width: width/4.9,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),

                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [Color(0xff0A904C),Color(0xff018266)],

                                  ),

                                ),
                                child:Padding(
                                  padding: EdgeInsets.only(left: width/39.2),
                                  child: Text(
                                    'View Plan',
                                    style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize:12,color: Color(0xffffffff)),
                                  ),
                                ),
                              ),
                            )

                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: height/446470.56),
                              child: Container(
                                height:height/24.48,
                                width:width/1.12,
                                decoration: BoxDecoration(
                                  color: Color(0xffF0EFEF),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child:Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left: width/6.53),
                                      child: Text(
                                        'Plan No: 914',
                                        style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize:14,color: Color(0xff000000)),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: width/4.35),
                                      child: Text(
                                        'Money Back Plan',
                                        style: GoogleFonts.poppins(fontWeight: FontWeight.w600,fontSize:12,color: Color(0xff008069)),
                                      ),
                                    ),
                                  ],
                                ),

                              ),
                            ),
                          ],
                        )
                      ],

                    ),
                  ),
                ),
              ),
            ],
          ),

          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [


                Material(
                  elevation: 20,
                  shadowColor: Colors.black12,
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    height: 140,
                    width: 330,
                    decoration: BoxDecoration(
                        color: Color(0xffFFFFFF),
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                            color: Colors.grey.shade300,
                            width: 0.6
                        )

                    ),
                    child: Column(

                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [

                              Text("New Appointment",
                                style: TextStyle(fontFamily: "Davish",
                                    fontSize: 20
                                ),),
                              SizedBox(width: 80,),

                              Container(
                                height: 30,
                                width: 100,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
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
                              )


                            ],
                          ),
                        ),
                        SizedBox(height: 40.5,),

                        Padding(
                          padding: const EdgeInsets.only(top: 28.0),
                          child: Container(

                            height: 40,
                            width: 330,
                            decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(25),
                                  bottomRight: Radius.circular(25),
                                )

                            ),
                          ),
                        )

                      ],
                    ),
                  ),
                ),



              ],
            ),
          )
        ],
      ),*/



      Material(
        elevation: 20,
        shadowColor: Colors.blue,
        borderRadius: BorderRadius.circular(10),

        child: Container(
          height: 100,
          width:350,
    decoration: BoxDecoration(
    color: Colors.grey.shade200,
    borderRadius: BorderRadius.only(
    bottomLeft: Radius.circular(25),
    bottomRight: Radius.circular(25),
    )




        ),
      )
      )
    );
  }
}



