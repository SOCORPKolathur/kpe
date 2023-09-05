import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kpe/marketing.dart';
import 'package:kpe/premium%20plans.dart';

class endowment extends StatefulWidget {
  const endowment({super.key});

  @override
  State<endowment> createState() => _endowmentState();
}

class _endowmentState extends State<endowment> {
  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xffF9F9F9),
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Color(0xffF9F9F9),
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
                    padding: EdgeInsets.only(top:height/33,left: width/26.13),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.of(context).pop(

                        );
                      },
                        child: Icon(Icons.arrow_back_ios_new_outlined,size: 25,color: Color(0xffffffff))),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: width/16.53,top: height/27.10),
                    child: Text(
                      'New Endowment',
                      style: GoogleFonts.poppins(fontWeight: FontWeight.w600,fontSize:22,color: Color(0xffFFFFFF)),
                    ),
                  ),
                ],
              ),
            ),
          ),
      body: Column(
          children: [
      Padding(
      padding: EdgeInsets.only(left:width/19.6,top:height/50.6),
      child: GestureDetector(
        onTap: ()
        {
          print(height);
          print(width);
        },
        child: Text(
          'Plan Details',
          style: GoogleFonts.amaranth(fontWeight: FontWeight.w500,fontSize:24,color: Color(0xff000000)),
        ),
      ),
    ),
            Padding(
              padding: EdgeInsets.only(left:width/78.4,top:height/94.87),
              child: Container(
                height:height/2.2,
                width:width/1.15,
                decoration: BoxDecoration(
                  color: Color(0xffffffff),
                  border: Border.all(color: Color(0xff0C9346)),
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: height/37.95,right: width/1.56),
                      child: Text(
                        'Name',
                        style: GoogleFonts.poppins(fontWeight: FontWeight.w600,fontSize:14,color: Color(0xff000000)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: width/39.2,top: height/75.9),
                      child: Container(
                        height:height/25.3,
                          width:width/1.4,
                        decoration: BoxDecoration(
                            color: Color(0xffffffff),
                            borderRadius: BorderRadius.circular(10),
                          border:Border.all(color: Color(0xffD1CDCD),

                        ),
                      ),
                        child:Padding(
                          padding: EdgeInsets.only(left: width/39.2,top: height/151.8),
                          child: Text(
                            'Toyota Yaris',
                            style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize:11,color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: height/37.95,right: 250),
                      child: Text(
                        'Age',
                        style: GoogleFonts.poppins(fontWeight: FontWeight.w600,fontSize:14,color: Color(0xff000000)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: width/39.2,top: height/75.9),
                      child: Container(
                        height:height/25.3,
                        width:width/1.4,
                        decoration: BoxDecoration(
                          color: Color(0xffffffff),
                          borderRadius: BorderRadius.circular(10),
                          border:Border.all(color: Color(0xffD1CDCD),

                          ),
                        ),
                        child:Padding(
                          padding: EdgeInsets.only(left: width/39.2,top:height/78.4),
                          child: Text(
                            'KSF102HS07',
                            style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize:11,color: Colors.grey),
                          ),
                        ),

                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top:height/50.6,right: width/2.305),
                      child: Text(
                        'Sums Assumed',
                        style: GoogleFonts.poppins(fontWeight: FontWeight.w600,fontSize:14,color: Color(0xff000000)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: width/39.2,top: height/75.9),
                      child: Container(
                        height:height/25.3,
                        width:width/1.4,
                        decoration: BoxDecoration(
                          color: Color(0xffffffff),
                          borderRadius: BorderRadius.circular(10),
                          border:Border.all(color: Color(0xffD1CDCD),

                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(top: height/151.8,left: width/32.66),
                          child: Text(
                            '25 - January - 1890',
                            style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize:11,color: Colors.grey),
                          ),
                        ),
                      ),
                      ),
                    Row(
                      children: [
                        Row(
                          children: [
                            Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(right: width/15.68,top: height/50.6),
                                  child: Text(
                                    'Term',
                                    style: GoogleFonts.poppins(fontWeight: FontWeight.w600,fontSize:13,color: Colors.black),
                                  ),
                                ),
                              Padding(
      padding: EdgeInsets.only(left: width/13.06,top:height/75.9),
      child: Container(
      height:height/20.06,
      width:width/4.59,
      decoration: BoxDecoration(
      color: Color(0xffffffff),
      borderRadius: BorderRadius.circular(10),
      border:Border.all(color: Color(0xffD1CDCD),

      ),
      ),
      child: Padding(
      padding: EdgeInsets.only(top: height/151.8,left: width/32.66),
      child: Text(
      '5 Y',
      style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize:11,color: Colors.grey),
      ),
      ),
      ),
    ),

                              ],
                            ),
                          ],
                        ),
                        Padding(
                          padding:  EdgeInsets.only(left: width/7.84),
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: width/392,top: height/50.6),
                                    child: Text(
                                      'Bonus',
                                      style: GoogleFonts.poppins(fontWeight: FontWeight.w600,fontSize:13,color: Colors.black),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: width/13.06,top: height/75.9),
                                    child: Container(
                                      height:height/25.3,
                                      width:width/3.92,
                                      decoration: BoxDecoration(
                                        color: Color(0xffffffff),
                                        borderRadius: BorderRadius.circular(10),
                                        border:Border.all(color: Color(0xffD1CDCD),

                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.only(top: height/151.8,left: width/32.66),
                                        child: Text(
                                          '5 Y',
                                          style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize:11,color: Colors.grey),
                                        ),
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


                  ],
                ),

              ),
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: width/13.06,top: height/37.95),
                  child: Text(
                    'AD AND DB',
                    style: GoogleFonts.poppins(fontWeight: FontWeight.w600,fontSize:15,color: Color(0xff000000)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: width/1.96,top:height/37.95),
                  child: Image.asset("assets/on.png"),
                )
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: width/13.06,top: height/75.9),
                  child: Text(
                    'Team Rider',
                    style: GoogleFonts.poppins(fontWeight: FontWeight.w600,fontSize:15,color: Color(0xff000000)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: width/2.06,top:height/75.9),
                  child: Image.asset("assets/off.png"),
                )
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: width/13.06,top: height/75.9),
                  child: Text(
                    'Age Extra',
                    style: GoogleFonts.poppins(fontWeight: FontWeight.w600,fontSize:15,color: Color(0xff000000)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: width/1.91,top:height/75.9),
                  child: Image.asset("assets/off.png"),
                )
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: width/13.06,top:height/151.8),
                  child: Text(
                    'Old Presentation',
                    style: GoogleFonts.poppins(fontWeight: FontWeight.w600,fontSize:15,color: Color(0xff000000)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: width/2.56,top:height/151.8),
                  child: Image.asset("assets/on.png"),
                )
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30.0,top: 5.0),
                  child: Text(
                    'Maturity Settlement',
                    style: GoogleFonts.poppins(fontWeight: FontWeight.w600,fontSize:15,color: Color(0xff000000)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: width/3.18,top:height/151.8),
                  child: Image.asset("assets/off.png"),
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left:width/10.68,top: height/50.6),
                      child: GestureDetector(
                        onTap: (){
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context)=>marketing())
                          );
                        },
                        child: Container(
                          height:height/19.97,
                          width:width/2.61,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(17),

                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Color(0xff0A904C),Color(0xff018266)],
                            ),
                          ),
                          child:Padding(
                            padding: EdgeInsets.only(top: height/120.8,left: width/10.04),
                            child: Text("Submit",style: GoogleFonts.openSans(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color:Color(0xffffffff),
                            ),),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: width/14.88,top: height/50.6),
                      child: Container(
                        height:height/19.97,
                        width:width/2.61,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(17),

                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Color(0xff0A904C),Color(0xff018266)],
                          ),
                        ),
                        child:Padding(
                          padding: EdgeInsets.only(top: height/120.8,left: width/7.04),
                          child: Text("PDF",style: GoogleFonts.openSans(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color:Color(0xffffffff),
                          ),),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),




    ]
      ),

    );
  }
}

