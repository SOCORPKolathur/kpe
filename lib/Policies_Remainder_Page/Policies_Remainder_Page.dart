
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kpe/Policies_Remainder_Page/policies_remainder_form_page.dart';

import '../Translator_Module/Translator_Module_Page.dart';

class Policies_Remainder_Page extends StatefulWidget {
  const Policies_Remainder_Page({Key? key}) : super(key: key);

  @override
  State<Policies_Remainder_Page> createState() => _Policies_Remainder_PageState();
}

class _Policies_Remainder_PageState extends State<Policies_Remainder_Page> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery
        .of(context)
        .size
        .height;
    double width = MediaQuery
        .of(context)
        .size
        .width;
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
                    text: 'Policies Remainder',
                    style: TextStyle(
                        fontFamily: "Davish",
                        color: Colors.white,
                        letterSpacing: 0.3),
                  ),
                ),
              ),
            ),

            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const policies_remainder_form_page(),));
              },
              child: Container(
                height: height/34.062,
                  width: width/15.457,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.white,
                  ),
                  child: Center(child: Icon(Icons.add,size: width/22.857,color: Colors.black,))),
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

      body: SingleChildScrollView(
        child: Column(
          children: [
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection("Policies_remainder").orderBy("plname").snapshots(),
              builder:(context, snapshot) {

                if(snapshot.hasData==null){
                  return  Center(
                    child: Padding(
                      padding:  EdgeInsets.only(top: height/2.9219),
                      child: const CircularProgressIndicator(color :Color(0xff0C9346),strokeCap: StrokeCap.square,
                        strokeWidth: 5,),
                    ),
                  );
                }

                if(!snapshot.hasData){
                  return  Center(
                    child: Padding(
                      padding:  EdgeInsets.only(top: height/2.9219),
                      child: const CircularProgressIndicator(color :Color(0xff0C9346),strokeCap: StrokeCap.square,
                        strokeWidth: 5,),
                    ),
                  );
                }

                return
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      var Value=snapshot.data!.docs[index];

                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Material(
                          elevation: 8,
                          color: Colors.white54,
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            height: 90,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white54,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    children: [
                                      Container(
                                        height:53,
                                        width: 53,
                                        decoration: BoxDecoration(
                                            color: Colors.grey.shade300,
                                            borderRadius:  BorderRadius.circular(8)
                                        ),
                                        child: Center(
                                          child: KText(text:Value['plname'].toString().substring(0,1), style: GoogleFonts.poppins(
                                              color: const Color(0xff008069),
                                              fontSize: 25,
                                              fontWeight: FontWeight.w600
                                          ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: width/27.428,),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          KText(text:Value['plname'].toString(),
                                            align: TextAlign.center,
                                            style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w600,
                                                color: const Color(0xff000000)),),
                                          KText(text: "Policy Terms : ${Value['plterm'].toString()}",
                                            align: TextAlign.center,
                                            style: GoogleFonts.poppins(
                                                color: const Color(0xff000000)),),
                                          KText(text: "Premium : ₹ ${Value['plassumed_sum'].toString()}",
                                            align: TextAlign.center,
                                            style: GoogleFonts.poppins(

                                                color: const Color(0xff000000)),),

                                        ],
                                      )

                                    ],
                                  ),
                                )

                              ],
                            ),
                          ),
                        ),
                      );


                    },);
              }, ),

          ],
        ),
      ),


    );
  }
}
