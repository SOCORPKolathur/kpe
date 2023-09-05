import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class birthday extends StatefulWidget {
  const birthday({super.key});

  @override
  State<birthday> createState() => _birthdayState();
}

class _birthdayState extends State<birthday> {
  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return Scaffold(
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
                padding:const EdgeInsets.only(top: 23.0,left:15.0),
                child: GestureDetector(
                  onTap: (){
                    Navigator.of(context).pop();
                  },
                    child: Icon(Icons.arrow_back_ios_new_outlined,size: 25.0,color: Color(0xffffffff),)),
              ),
              Padding(
                padding: EdgeInsets.only(left: width/20.53,top: height/27.10),
                child: Text(
                  'Birthday Flyers',
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w600,fontSize:22,color: Color(0xffFFFFFF)),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
          Padding(
            padding:EdgeInsets.only(top: height/37.95),
            child: Container(
              height: height/4.12,
                width: width/1.03,
                child: Image.asset("assets/photo1.png")),
          ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: height/37.95,left: width/39.2),
                  child: Container(
                      height:height/2.53,
                      width:width/2.24,
                        child: Image.asset("assets/photo 2.png")),
                ),
                Padding(
                  padding:EdgeInsets.only(top: height/37.95,left: width/39.2),
                  child: Container(
                      height:height/2.53,
                      width:width/2.24,
                      child: Image.asset("assets/photo 3.png")),
                )
              ],
            ),
            Padding(
              padding:EdgeInsets.only(top: height/37.95),
              child: Container(
                  height: height/4.12,
                  width: width/1.03,
                  child: Image.asset("assets/photo 4.png")),
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: height/37.95,left: width/39.2),
                  child: Container(
                      height:height/2.53,
                      width:width/2.24,
                      child: Image.asset("assets/photo 2.png")),
                ),
                Padding(
                  padding:EdgeInsets.only(top: height/37.95,left: width/39.2),
                  child: Container(
                      height:height/2.53,
                      width:width/2.24,
                      child: Image.asset("assets/photo 3.png")),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
