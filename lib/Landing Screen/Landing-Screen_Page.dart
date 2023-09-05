
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../premium.dart';

class firstpage extends StatefulWidget {
  const firstpage({super.key});

  @override
  State<firstpage> createState() => _firstpageState();
}

class _firstpageState extends State<firstpage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffF5F5F5),
        elevation: 0,
        title: Row(

          children: [



            const Padding(
              padding:  EdgeInsets.only(left: 4.0),
              child: SizedBox(
                width:320,
                child: Text(
                  'KALAPANA ENTERPRISES',
                  style: TextStyle(
                      fontFamily: "Davish",
                      color: Colors.white,
                      fontSize: 30,
                      letterSpacing: 0.3
                  ),
                ),
              ),
            ),
            Container(
              height: height / 24.3,
              width: width / 12.06,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: const Color(0xffCFE8FF)),
              ),
              child: Image.asset("assets/pic.png"),
            ),
          ],
        ),
        automaticallyImplyLeading: false,
        toolbarHeight: height / 9.59,
        flexibleSpace: Container(
          height: height / 7.09,
          width: width / 3.92,
          decoration:  const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(23),
              bottomRight: Radius.circular(23),
            ),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xff0A904C), Color(0xff018266)],
            ),
          ),


        ),
      ),

      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: width / 26.1, top: height / 25.95),
              child: Text(
                'Latest Updates',
                style: GoogleFonts.amaranth(
                    fontWeight: FontWeight.w500,
                    fontSize: 26,
                    color: const Color(0xff000000)),
              ),
            ),

            Padding(
              padding:
              EdgeInsets.only(left: width / 26.13, top: height / 50.95),
              child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const plans()));
                  },
                  child: SizedBox(
                      height: height / 4.00,
                      width: width / 1.07,
                      child: Image.asset("assets/add.png"))),
            ),

            Padding(
              padding:
              EdgeInsets.only(top: height / 37.95, left: width / 26.1,bottom: height/37.95),
              child: Text(
                'Good morning',
                style: GoogleFonts.amaranth(
                    fontWeight: FontWeight.w500,
                    fontSize: 26,
                    color: const Color(0xff000000)),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Material(
                  elevation: 3,
                  borderRadius: BorderRadius.circular(10),
                  child: GestureDetector(
                    onTap: ()
                    {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context)=>const plans())
                      );
                    },
                    child: Container(
                      height:height/8.62,
                      width:width/2.15 ,
                      decoration: BoxDecoration(
                          color: const Color(0xffE1F1FF),
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: width / 39.2),
                            child: const Text(
                              'Premium\nPlans',
                              style:TextStyle(
                                  fontFamily: "Davish",
                                  fontWeight: FontWeight.w600,
                                  fontSize: 30,
                                  color: Color(0xff3F7AFC)),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: width / 19.6),
                            child: SizedBox(
                                height: height / 7.8,
                                width: width / 6.97,
                                child: Image.asset("assets/check.png")),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Material(
                  elevation: 3,
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    height:height/8.62,
                    width:width/2.15 ,
                    decoration: BoxDecoration(
                        color: const Color(0xffD1F3E0),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: width / 39.2),
                          child: const Text(
                            'Plan\nDetails',
                            style: TextStyle
                              (
                                fontFamily: "Davish",
                                fontWeight: FontWeight.w600,
                                fontSize: 30,
                                color: Color(0xff3CB878)),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: width / 9.8),
                          child: SizedBox(
                              height: height / 6.8,
                              width: width / 7.97,
                              child: Image.asset("assets/tick.png")),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

              children: [
                Material(
                  elevation: 3,
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    height:height/8.62,
                    width:width/2.15 ,
                    decoration: BoxDecoration(
                        color: const Color(0xffFFFF2D8),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: width / 34.2),
                          child: const Text(
                            'Plan\nCombs',
                            style: TextStyle(
                                fontFamily: "Davish",
                                fontWeight: FontWeight.w600,
                                fontSize: 30,
                                color: Color(0xffFFA104)),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: width / 8.8),
                          child: SizedBox(
                              height: height / 7.52,
                              width: width / 9.27,
                              child: Image.asset("assets/build.png")),
                        ),
                      ],
                    ),
                  ),
                ),
                Material(
                  elevation: 3,
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    height:height/8.62,
                    width:width/2.15 ,
                    decoration: BoxDecoration(
                        color: const Color(0xffE6D1F3),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: width / 33.2),
                          child: const Text(
                            'Plan\nCompare',
                            style: TextStyle(
                                fontFamily: "Davish",
                                fontWeight: FontWeight.w600,
                                fontSize: 30,
                                color: Color(0xff8B1ECD)),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: width / 14.13),
                          child: SizedBox(
                              height: height / 17.97,
                              width: width / 8.8,
                              child: Image.asset("assets/file.png")),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

              children: [
                Material(
                  elevation: 3,
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    height:height/8.62,
                    width:width/2.15 ,
                    decoration: BoxDecoration(
                        color: const Color(0xffC5FFF8),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: width / 36.2),
                          child: const Text(
                            'Marketing\nFlyers',
                            style: TextStyle(
                                fontFamily: "Davish",
                                fontWeight: FontWeight.w600,
                                fontSize: 30,
                                color: Color(0xff0B8D7E)),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: width / 20.13),
                          child: SizedBox(
                              height: height / 18.97,
                              width: width / 9.8,
                              child: Image.asset("assets/sound.png")),
                        ),
                      ],
                    ),
                  ),
                ),
                Material(
                  elevation: 3,
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    height:height/8.62,
                    width:width/2.15 ,
                    decoration: BoxDecoration(
                        color: const Color(0xffFFF495),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: width / 35.2),
                          child: const Text(
                            'Marketing\nVideos',
                            style: TextStyle(
                                fontFamily: "Davish",
                                fontWeight: FontWeight.w600,
                                fontSize: 30,
                                color: Color(0xffD29E00)),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: width / 15.2),
                          child: SizedBox(
                              height: height / 18.97,
                              width: width / 9.8,
                              child: Image.asset("assets/youtube.png")),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15,),
            Padding(
              padding:
              EdgeInsets.only(left: width / 26.1, top: height / 39.95),
              child: Text(
                'Agent Trainings',
                style: GoogleFonts.amaranth(
                    fontWeight: FontWeight.w500,
                    fontSize: 26,
                    color: const Color(0xff000000)),
              ),
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    height: height / 6.59,
                    width: width/1.07,
                    child: Image.asset("assets/76.png")),
              ],
            ),
            Padding(
              padding:
              EdgeInsets.only(left: width / 26.1, top: height / 36.95),
              child: Text(
                'Agent Utilities',
                style: GoogleFonts.amaranth(
                    fontWeight: FontWeight.w500,
                    fontSize: 26,
                    color: const Color(0xff000000)),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: width / 26.13, top: 20.0),
              child: Container(
                height: height / 2.53,
                width: width / 1.09,
                decoration: BoxDecoration(
                    color:  Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                                height: height / 14.88,
                                width: width / 7.68,
                                child: Image.asset("assets/notes.png")),
                            SizedBox(height: 5,),

                            Text(
                              'Polices Forms',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 11,
                                  color: const Color(0xff000000)),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(
                                height: height / 14.88,
                                width: width / 7.68,
                                child: Image.asset("assets/cal.png")),
                            SizedBox(height: 5,),

                            Text(
                              'Other Calculators',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 11,
                                  color: const Color(0xff000000)),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(
                                height: height / 14.88,
                                width: width / 7.68,
                                child: Image.asset("assets/tube.png")),
                            SizedBox(height: 5,),

                            Text(
                              'Agent Training',
                              style: GoogleFonts.amaranth(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 11,
                                  color: const Color(0xff000000)),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                      children: [
                        Column(
                          children: [
                            SizedBox(
                                height: height / 14.88,
                                width: width / 7.68,
                                child: Image.asset("assets/share.png")),
                            SizedBox(height: 5,),

                            Text(
                              'Share',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 11,
                                  color: const Color(0xff000000)),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(
                                height: height / 14.88,
                                width: width / 7.68,
                                child: Image.asset("assets/clock.png")),

                            SizedBox(height: 5,),
                            Text(
                              'Policy Remainder',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 11,
                                  color: const Color(0xff000000)),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(
                                height: height / 14.88,
                                width: width / 7.68,
                                child: Image.asset("assets/settings.png")),
                            SizedBox(height: 5,),
                            Text(
                              'Settings',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 11,
                                  color: const Color(0xff000000)),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                      children: [
                        Column(
                          children: [
                            SizedBox(
                                height: height / 14.88,
                                width: width / 7.68,
                                child: Image.asset("assets/phone.png")),

                            SizedBox(height: 5,),
                            Text(
                              'Contact Us',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 11,
                                  color: const Color(0xff000000)),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(
                                height: height / 14.88,
                                width: width / 7.68,
                                child: Image.asset("assets/onn.png")),
                            SizedBox(height: 5,),
                            Text(
                              'Log out',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 11,
                                  color: const Color(0xff000000)),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(
                                height: height / 14.88,
                                width: width / 7.68,
                            ),
                            SizedBox(height: 5,),

                          ],
                        ),
                      ],
                    ),
                  ],
                ),

              ),
            ),
            SizedBox(height: 20,)

          ],
        ),
      ),
    );
  }
}
