
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Translator_Module/Translator_Module_Page.dart';
import 'Policies _Pdf_view_Page.dart';


class Polices_Form_Page extends StatefulWidget {
  const Polices_Form_Page({Key? key}) : super(key: key);

  @override
  State<Polices_Form_Page> createState() => _Polices_Form_PageState();
}

class _Polices_Form_PageState extends State<Polices_Form_Page> {
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
                  alignment: Alignment.centerLeft,
                  fit: BoxFit.contain,
                  child: KText(
                    text: 'Policies Form',
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
            padding: EdgeInsets.only(
              top: width / 82.057,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width:width/1.6457,
                  height: height/36.062,
                  child: FittedBox(
                    alignment: Alignment.center,
                    fit: BoxFit.contain,
                    child: KText(
                      text: 'Policies',
                      style: GoogleFonts.amaranth(
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff000000)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: height / 32.822,
          ),
          Container(
              height: height / 1.31,
              width: width / 1.15,
              decoration: BoxDecoration(
                  color: const Color(0xffffffff),
                  border: Border.all(color: const Color(0xff0C9346)),
                  borderRadius: BorderRadius.circular(20)),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(

                  children: [

                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Policies_Pdf_view_Page("Addendum Forms"),));
                      },
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: width / 26.1, top: height / 40.97),
                            child: SizedBox(
                                height: height / 12.65,
                                width: width / 6.53,
                                child: Image.asset("assets/folder.png")),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: width / 19.6, top: height / 20.97),
                            child: SizedBox(
                              width:width/1.6457,
                              height: height/36.062,
                              child: FittedBox(
                                fit:BoxFit.contain,
                                alignment: Alignment.centerLeft,
                                child: KText(
                                  text:"Addendum Forms",
                                  style: GoogleFonts.amaranth(
                                      fontWeight: FontWeight.w500,
                                      fontSize: width / 17.142,
                                      color: const Color(0xff000000)),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Policies_Pdf_view_Page("Business Insurance Forms"),));
                      },
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: width / 26.1, top: height / 40.97),
                            child: SizedBox(
                                height: height / 12.65,
                                width: width / 6.53,
                                child: Image.asset("assets/folder.png")),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: width / 19.6, top: height / 20.97),
                            child: SizedBox(
                              width:width/1.6457,
                              height: height/36.062,
                              child: FittedBox(
                                fit:BoxFit.contain,
                                alignment: Alignment.centerLeft,
                                child: KText(
                                  text:"Business Insurance Forms",
                                  style: GoogleFonts.amaranth(
                                      fontWeight: FontWeight.w500,
                                      fontSize: width / 17.142,
                                      color: const Color(0xff000000)),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Policies_Pdf_view_Page("DGH Forms"),));
                      },
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: width / 26.1, top: height / 40.97),
                            child: SizedBox(
                                height: height / 12.65,
                                width: width / 6.53,
                                child: Image.asset("assets/folder.png")),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: width / 19.6, top: height / 20.97),
                            child: SizedBox(
                              width:width/1.6457,
                              height: height/36.062,
                              child: FittedBox(
                                fit:BoxFit.contain,
                                alignment: Alignment.centerLeft,
                                child: KText(
                                  text:"DGH Forms",
                                  style: GoogleFonts.amaranth(
                                      fontWeight: FontWeight.w500,
                                      fontSize: width / 17.142,
                                      color: const Color(0xff000000)),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Policies_Pdf_view_Page("General Forms"),));
                      },
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: width / 26.1, top: height / 40.97),
                            child: SizedBox(
                                height: height / 12.65,
                                width: width / 6.53,
                                child: Image.asset("assets/folder.png")),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: width / 19.6, top: height / 20.97),
                            child: SizedBox(
                              width:width/1.6457,
                              height: height/36.062,
                              child: FittedBox(
                                fit:BoxFit.contain,
                                alignment: Alignment.centerLeft,
                                child: KText(
                                  text:"General Forms",
                                  style: GoogleFonts.amaranth(
                                      fontWeight: FontWeight.w500,
                                      fontSize: width / 17.142,
                                      color: const Color(0xff000000)),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Policies_Pdf_view_Page("Income Proof Forms"),));
                      },
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: width / 26.1, top: height / 40.97),
                            child: SizedBox(
                                height: height / 12.65,
                                width: width / 6.53,
                                child: Image.asset("assets/folder.png")),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: width / 19.6, top: height / 20.97),
                            child: SizedBox(
                              width:width/1.6457,
                              height: height/36.062,
                              child: FittedBox(
                                fit:BoxFit.contain,
                                alignment: Alignment.centerLeft,
                                child: KText(
                                  text:"Income Proof Forms",
                                  style: GoogleFonts.amaranth(
                                      fontWeight: FontWeight.w500,
                                      fontSize: width / 17.142,
                                      color: const Color(0xff000000)),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Policies_Pdf_view_Page("MHR Forms"),));
                      },
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: width / 26.1, top: height / 40.97),
                            child: SizedBox(
                                height: height / 12.65,
                                width: width / 6.53,
                                child: Image.asset("assets/folder.png")),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: width / 19.6, top: height / 20.97),
                            child: SizedBox(
                              width:width/1.6457,
                              height: height/36.062,
                              child: FittedBox(
                                fit:BoxFit.contain,
                                alignment: Alignment.centerLeft,
                                child: KText(
                                  text:"MHR Forms",
                                  style: GoogleFonts.amaranth(
                                      fontWeight: FontWeight.w500,
                                      fontSize: width / 17.142,
                                      color: const Color(0xff000000)),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Policies_Pdf_view_Page("NRI Forms"),));
                      },
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: width / 26.1, top: height / 40.97),
                            child: SizedBox(
                                height: height / 12.65,
                                width: width / 6.53,
                                child: Image.asset("assets/folder.png")),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: width / 19.6, top: height / 20.97),
                            child: SizedBox(
                              width:width/1.6457,
                              height: height/36.062,
                              child: FittedBox(
                                fit:BoxFit.contain,
                                alignment: Alignment.centerLeft,
                                child: KText(
                                  text:"NRI Forms",
                                  style: GoogleFonts.amaranth(
                                      fontWeight: FontWeight.w500,
                                      fontSize: width / 17.142,
                                      color: const Color(0xff000000)),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Policies_Pdf_view_Page("Occupation Questionnaires"),));
                      },
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: width / 26.1, top: height / 40.97),
                            child: SizedBox(
                                height: height / 12.65,
                                width: width / 6.53,
                                child: Image.asset("assets/folder.png")),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: width / 19.6, top: height / 20.97),
                            child: SizedBox(
                              width:width/1.6457,
                              height: height/36.062,
                              child: FittedBox(
                                fit:BoxFit.contain,
                                alignment: Alignment.centerLeft,
                                child: KText(
                                  text:"Occupation Questionnaires",
                                  style: GoogleFonts.amaranth(
                                      fontWeight: FontWeight.w500,
                                      fontSize: width / 17.142,
                                      color: const Color(0xff000000)),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Policies_Pdf_view_Page("Personal History MedicalQuestionnaires"),));
                      },
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: width / 26.1, top: height / 40.97),
                            child: SizedBox(
                                height: height / 12.65,
                                width: width / 6.53,
                                child: Image.asset("assets/folder.png")),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: width / 19.6, top: height / 20.97),
                            child: Container(
                              width:width/1.6457,
                              height: height/19.062,
                              child: FittedBox(
                                fit:BoxFit.contain,
                                alignment: Alignment.centerLeft,
                                child: KText(
                                  text:"Personal History\nMedical Questionnaires",
                                  style: GoogleFonts.amaranth(
                                    textStyle: const TextStyle(overflow: TextOverflow.ellipsis),
                                      fontWeight: FontWeight.w500,
                                      fontSize: width / 17.142,
                                      color: const Color(0xff000000)),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Policies_Pdf_view_Page("Proposal Forms"),));
                      },
                      child:
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: width / 26.1, top: height / 40.97),
                            child: SizedBox(
                                height: height / 12.65,
                                width: width / 6.53,
                                child: Image.asset("assets/folder.png")),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: width / 19.6, top: height / 20.97),
                            child: SizedBox(
                              width:width/1.6457,
                              height: height/36.062,
                              child: FittedBox(
                                fit:BoxFit.contain,
                                alignment: Alignment.centerLeft,
                                child: KText(
                                  text:"Proposal Forms",
                                  style: GoogleFonts.amaranth(
                                      fontWeight: FontWeight.w500,
                                      fontSize: width / 17.142,
                                      color: const Color(0xff000000)),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Policies_Pdf_view_Page("Ananda Specimen Forms"),));
                      },
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: width / 26.1, top: height / 40.97),
                            child: SizedBox(
                                height: height / 12.65,
                                width: width / 6.53,
                                child: Image.asset("assets/folder.png")),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: width / 19.6, top: height / 20.97),
                            child: SizedBox(
                              width:width/1.6457,
                              height: height/36.062,
                              child: FittedBox(
                                fit:BoxFit.contain,
                                alignment: Alignment.centerLeft,
                                child: KText(
                                  text:"Ananda Specimen Forms",
                                  style: GoogleFonts.amaranth(
                                      fontWeight: FontWeight.w500,
                                      fontSize: width / 17.142,
                                      color: const Color(0xff000000)),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
              )),
        ],
      ),

    );
  }
}
