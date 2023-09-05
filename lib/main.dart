import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kpe/marketing.dart';
import 'package:kpe/premium%20plans.dart';
import 'package:kpe/premium.dart';

import 'Birthday.dart';
import 'new endowment.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: homepage(),
    );
  }
}

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: Column(
        children: [
          Center(
            child: Container(
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => loginpage()));
                },
                child: Padding(
                  padding:
                      EdgeInsets.only(left: width / 19.6, top: height/4.74),
                  child: Container(
                    child: Image.asset("assets/tree.png"),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: height / 5.10),
            child: const Text(
              'Your life insurance partner',
              style:TextStyle(
                fontFamily: "Davish",
                fontWeight: FontWeight.w500,
                fontSize: 37
              )
              // color: Color(0xff000000)
            ),
          )
        ],
      ),
    );
  }
}

class loginpage extends StatefulWidget {
  const loginpage({super.key});

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xffFffffff),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: height / 1.89,
                width: width / 1,
                color: Color(0xffffffff),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: height / 30.36),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => firstpage()));
                        },
                        child: Padding(
                          padding: EdgeInsets.only(top: height / 42.16),
                          child: GestureDetector(
                            onTap: () {
                              print(height);
                              print(width);
                            },
                            child: Text(
                              "KALAPANA\nENTERPRISES",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: "Davish",
                                fontWeight: FontWeight.w600,
                                fontSize: 35,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: width / 10.2, top: height / 41.6),
                          child: Text(
                            "Enter Phone Number",
                            style: TextStyle(
                              fontFamily: "Davish",
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: height / 30.37),
                      child: Container(
                        height: height / 18.97,
                        width: width / 1.22,
                        decoration: BoxDecoration(
                            color: Color(0xffffffff),
                            border: Border.all(color: Colors.black12),
                            borderRadius: BorderRadius.circular(3)),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: width / 21.81),
                              child: Container(
                                  height: height / 30.36,
                                  width: width / 15.68,
                                  child: Image.asset("assets/flag2.png")),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: width / 30.20),
                              child: Text(
                                "India",
                                style: GoogleFonts.openSans(
                                  fontSize: 15,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: width / 11.01),
                          child: Container(
                            height: height / 19.97,
                            width: width / 7.84,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black12),
                                color: Color(0xffffffff),
                                borderRadius: BorderRadius.circular(3)),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: height / 94.87, left: width / 30.15),
                              child: Text(
                                "+91",
                                style: GoogleFonts.openSans(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: height / 18.97,
                          width: width / 1.46,
                          decoration: BoxDecoration(
                              color: Color(0xffffffff),
                              border: Border.all(color: Colors.black12),
                              borderRadius: BorderRadius.circular(3)),
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: height / 75.9, left: width / 30.1),
                            child: Text(
                              "9876543210",
                              style: GoogleFonts.openSans(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: height / 37.98, left: width / 20.64),
                      child: Text(
                        "We’ll Send you a code by SMS to confirm your phone number.",
                        style: GoogleFonts.openSans(
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff222B45)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: height / 37.95, left: width / 19.6),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => firstpage()));
                        },
                        child: Padding(
                          padding: EdgeInsets.only(top:height/30.36),
                          child: Container(
                            height: height / 18.97,
                            width: width / 2.61,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(17),
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [Color(0xff0A904C), Color(0xff018266)],
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: height / 140.8, left: width / 10.04),
                              child: Text(
                                "Continue",
                                style: TextStyle(
                                  fontSize: 28,
                                  fontFamily: "Davish",
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xffffffff),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

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
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          height: height / 7.59,
          width: width / 3.92,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xff0A904C), Color(0xff018266)],
            ),
          ),
          child: Row(
            children: [
              Padding(
                padding:
                    EdgeInsets.only(top: height / 25.3, left: width / 39.2),
                child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(
                      Icons.arrow_back_ios_new_outlined,
                      size: 25.0,
                      color: Color(0xffffffff),
                    )),
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: width / 75.9, top: height / 25.06),
                child: Text(
                  'KALAPANA ENTERPRISES',
                  style: GoogleFonts.amaranth(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: Color(0xffFFFFFF)),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: width / 7.530, top: height / 25.3),
                child: Container(
                  height: height / 25.3,
                  width: width / 13.06,
                  child: Image.asset("assets/pic.png"),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Color(0xffCFE8FF)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: width / 26.1, top: height / 37.95),
              child: Text(
                'Latest Updates',
                style: GoogleFonts.amaranth(
                    fontWeight: FontWeight.w500,
                    fontSize: 24,
                    color: Color(0xff000000)),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(left: width / 26.13, top: height / 37.95),
              child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => plans()));
                  },
                  child: Container(
                      height: height / 4.00,
                      width: width / 1.07,
                      child: Image.asset("assets/add.png"))),
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: height / 37.95, left: width / 15.13),
              child: Text(
                'Good morning',
                style: GoogleFonts.amaranth(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: Color(0xff000000)),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(left: width / 26.1, top: height / 37.95),
                  child: Material(
                    elevation: 3,
                    borderRadius: BorderRadius.circular(10),
                    child: GestureDetector(
                      onTap: ()
                      {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context)=>plans())
                        );
                      },
                      child: Container(
                        height:height/8.62,
                        width:width/2.15 ,
                        decoration: BoxDecoration(
                            color: Color(0xffE1F1FF),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: width / 39.2),
                              child: Text(
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
                              child: Container(
                                  height: height / 7.8,
                                  width: width / 6.97,
                                  child: Image.asset("assets/check.png")),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: width / 40.4, top: height / 37.95),
                  child: Material(
                    elevation: 3,
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      height:height/8.62,
                      width:width/2.15 ,
                      decoration: BoxDecoration(
                          color: Color(0xffD1F3E0),
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: width / 39.2),
                            child: Text(
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
                            child: Container(
                                height: height / 6.8,
                                width: width / 7.97,
                                child: Image.asset("assets/tick.png")),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(left: width / 26.13, top: height / 37.95),
                  child: Material(
                    elevation: 3,
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      height:height/8.62,
                      width:width/2.15 ,
                      decoration: BoxDecoration(
                          color: Color(0xffFFFF2D8),
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: width / 34.2),
                            child: Text(
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
                            child: Container(
                                height: height / 7.52,
                                width: width / 9.27,
                                child: Image.asset("assets/build.png")),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: width / 50.13, top: height / 37.95),
                  child: Material(
                    elevation: 3,
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      height:height/8.62,
                      width:width/2.15 ,
                      decoration: BoxDecoration(
                          color: Color(0xffE6D1F3),
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: width / 33.2),
                            child: Text(
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
                            child: Container(
                                height: height / 17.97,
                                width: width / 8.8,
                                child: Image.asset("assets/file.png")),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(left: width / 26.13, top: height / 37.95),
                  child: Material(
                    elevation: 3,
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      height:height/8.62,
                      width:width/2.15 ,
                      decoration: BoxDecoration(
                          color: Color(0xffC5FFF8),
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: width / 36.2),
                            child: Text(
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
                            child: Container(
                                height: height / 18.97,
                                width: width / 9.8,
                                child: Image.asset("assets/sound.png")),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: width /50.1, top: height / 37.95),
                  child: Material(
                    elevation: 3,
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      height:height/8.62,
                      width:width/2.15 ,
                      decoration: BoxDecoration(
                          color: Color(0xffFFF495),
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: width / 35.2),
                            child: Text(
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
                            child: Container(
                                height: height / 18.97,
                                width: width / 9.8,
                                child: Image.asset("assets/youtube.png")),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding:
                  EdgeInsets.only(left: width / 40.13, top: height / 39.95),
              child: Text(
                'Agent Trainings',
                style: GoogleFonts.amaranth(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Color(0xff000000)),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: width / 40.4, top: height / 37.95),
              child: Container(
                  height: height / 6.59,
                  width: width/0.07,
                  child: Image.asset("assets/76.png")),
            ),
            Padding(
              padding:
                  EdgeInsets.only(left: width / 40.13, top: height / 36.95),
              child: Text(
                'Agent Utilities',
                style: GoogleFonts.amaranth(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Color(0xff000000)),
              ),
            ),
            Material(
              elevation: 3,
              borderRadius: BorderRadius.circular(10),
              child: Padding(
                padding: EdgeInsets.only(left: width / 26.13, top: 20.0),
                child: Container(
                  height: height / 2.53,
                  width: width / 0.12,
                  decoration: BoxDecoration(
                      color: Color(0xffffffff),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    left: width / 13.06, top: height / 37.95),
                                child: Container(
                                    height: height / 14.88,
                                    width: width / 7.68,
                                    child: Image.asset("assets/notes.png")),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: width / 19.6,
                                ),
                                child: Text(
                                  'Polices Forms',
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 11,
                                      color: Color(0xff000000)),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    left: width / 13.06, top: height / 37.95),
                                child: Container(
                                    height: height / 14.88,
                                    width: width / 7.68,
                                    child: Image.asset("assets/cal.png")),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: width / 19.6,
                                ),
                                child: Text(
                                  'Other Calculators',
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 11,
                                      color: Color(0xff000000)),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    left: width / 13.06, top: height / 37.95),
                                child: Container(
                                    height: height / 14.88,
                                    width: width / 7.68,
                                    child: Image.asset("assets/tube.png")),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: width / 19.6,
                                ),
                                child: Text(
                                  'Agent Training',
                                  style: GoogleFonts.amaranth(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 11,
                                      color: Color(0xff000000)),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    left: width / 13.06, top: height / 22.95),
                                child: Container(
                                    height: height / 14.88,
                                    width: width / 7.68,
                                    child: Image.asset("assets/share.png")),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: width / 14.51, top: 5.0),
                                child: Text(
                                  'Share',
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 11,
                                      color: Color(0xff000000)),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    left: width / 12.3, top: height / 19.6),
                                child: Container(
                                    height: height / 14.88,
                                    width: width / 7.68,
                                    child: Image.asset("assets/clock.png")),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: width / 7.84,
                                ),
                                child: Text(
                                  'Policy Remainder',
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 11,
                                      color: Color(0xff000000)),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    left: width / 15.06, top: height / 20.95),
                                child: Container(
                                    height: height / 14.88,
                                    width: width / 7.68,
                                    child: Image.asset("assets/settings.png")),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: width / 13.51, top: 2),
                                child: Text(
                                  'Settings',
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 11,
                                      color: Color(0xff000000)),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    left: width / 13.06, top: height / 37.95),
                                child: Container(
                                    height: height / 14.88,
                                    width: width / 7.68,
                                    child: Image.asset("assets/phone.png")),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: width / 19.6,
                                ),
                                child: Text(
                                  'Contact Us',
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 11,
                                      color: Color(0xff000000)),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    left: width / 6.5, top: height / 37.95),
                                child: Container(
                                    height: height / 14.88,
                                    width: width / 7.68,
                                    child: Image.asset("assets/onn.png")),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: width / 6.80,
                                ),
                                child: Text(
                                  'Log out',
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 11,
                                      color: Color(0xff000000)),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
