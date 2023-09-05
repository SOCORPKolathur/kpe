import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kpe/Birthday.dart';

class marketing extends StatefulWidget {
  const marketing({super.key});

  @override
  State<marketing> createState() => _marketingState();
}

class _marketingState extends State<marketing> {
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
                padding: const EdgeInsets.only(top: 24.0,left: 15.0),
                child: GestureDetector(
                    onTap:()
                    {
                      Navigator.of(context).pop();
                    },
                    child: Icon(Icons.arrow_back_ios_new_outlined,size: 25,color: Color(0xffffffff))),
              ),
              Padding(
                padding: EdgeInsets.only(left: width/16.53,top: height/27.10),
                child: Text(
                  'Marketing Flyers',
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
            padding: const EdgeInsets.only(top: 10.0,left: 40.0),
            child: Text(
              'Select the type',
              style: GoogleFonts.amaranth(fontWeight: FontWeight.w500,fontSize:24,color: Color(0xff000000)),
            ),
          ),
    Padding(
      padding: const EdgeInsets.only(left: 25.0,top: 30.0),
      child: Container(
      height:height/1.30,
      width:width/1.15,
      decoration: BoxDecoration(
      color: Color(0xffffffff),
      border: Border.all(color: Color(0xff0C9346)),
      borderRadius: BorderRadius.circular(20)
      ),
        child:Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: width/26.1,top: height/18.97),
                     child: GestureDetector(
                       onTap: (){
                         Navigator.of(context).push(
                           MaterialPageRoute(builder: (context)=>birthday())
                         );
                       },
                       child: Container(
                        height:height/12.65,
                         width:width/6.53,
                          child: Image.asset("assets/folder.png")),
                     ),
                  ),

                Padding(
                  padding: EdgeInsets.only(left: width/19.6,top: height/18.97),
                  child: Text(
                    'Birthday',
                    style: GoogleFonts.amaranth(fontWeight: FontWeight.w500,fontSize:24,color: Color(0xff000000)),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: width/26.1,top: height/39.2),
                  child: Container(
                      height:height/12.65,
                      width:width/6.53,
                      child: Image.asset("assets/folder.png")),
                ),
                Padding(
                  padding:  EdgeInsets.only(left: width/19.6,top: height/75.9),
                  child: Text(
                    'Anniversary',
                    style: GoogleFonts.amaranth(fontWeight: FontWeight.w500,fontSize:24,color: Color(0xff000000)),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: width/26.1,top:height/39.2),
                  child: Container(
                      height:height/12.65,
                      width:width/6.53,
                      child: Image.asset("assets/folder.png")),
                ),
                Padding(
                  padding:EdgeInsets.only(left: width/19.6,top: height/75.9),
                  child: Text(
                    'Festival',
                    style: GoogleFonts.amaranth(fontWeight: FontWeight.w500,fontSize:24,color: Color(0xff000000)),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: width/26.1,top: height/75.9),
                  child: Container(
                      height:height/12.65,
                      width:width/6.53,
                      child: Image.asset("assets/folder.png")),
                ),
                Padding(
                  padding:  EdgeInsets.only(left: width/19.6,top: height/75.9),
                  child: Text(
                    'Thank You',
                    style: GoogleFonts.amaranth(fontWeight: FontWeight.w500,fontSize:24,color: Color(0xff000000)),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: width/26.1,top: height/75.9),
                  child: Container(
                      height:height/12.65,
                      width:width/6.53,
                      child: Image.asset("assets/folder.png")),
                ),
                Padding(
                  padding:  EdgeInsets.only(left: width/19.6,top: height/75.9),
                  child: Text(
                    'Policies Advertisement',
                    style: GoogleFonts.amaranth(fontWeight: FontWeight.w500,fontSize:24,color: Color(0xff000000)),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: width/26.1,top: height/75.9),
                  child: Container(
                      height:height/12.65,
                      width:width/6.53,
                      child: Image.asset("assets/folder.png")),
                ),
                Padding(
                  padding: EdgeInsets.only(left:width/19.6,top:height/75.9),
                  child: Text(
                    'General Posters',
                    style: GoogleFonts.amaranth(fontWeight: FontWeight.w500,fontSize:24,color: Color(0xff000000)),
                  ),
                ),
              ],
            ),

          ],
        )

      ),
    ),
        ],
      ),
    );
  }
}

