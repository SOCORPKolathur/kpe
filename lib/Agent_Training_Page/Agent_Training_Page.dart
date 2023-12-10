
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Translator_Module/Translator_Module_Page.dart';

class Agent_Training_Page extends StatefulWidget {
  const Agent_Training_Page({Key? key}) : super(key: key);

  @override
  State<Agent_Training_Page> createState() => _Agent_Training_PageState();
}

class _Agent_Training_PageState extends State<Agent_Training_Page> {
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
                  fit: BoxFit.contain,
                  alignment: Alignment.centerLeft,
                  child: KText(
                    text:'Agent Training',
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
      body:
      SingleChildScrollView(
        child: Column(
          children: [
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection("Agenttraining_videos").orderBy("timestamp").snapshots(),
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
                  return
                    Center(
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

                      return GestureDetector(
                       onTap: () async {
                         await launch(Value['url']);
                       },
                        child: Padding(
                          padding:  EdgeInsets.symmetric(horizontal: width/51.428,vertical: height/109.57),
                          child: Material(
                            elevation: 8,
                            color: Colors.white54,
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              height: height/9.0,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white54,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding:  EdgeInsets.symmetric(
                                      horizontal: width/41.143,
                                      vertical: height/87.657
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          height:height/16.539,
                                          width: width/7.762,
                                          decoration: BoxDecoration(
                                              color: Colors.grey.shade300,
                                              borderRadius:  BorderRadius.circular(8)
                                          ),
                                          child: Image.network(Value['img'].toString())
                                        ),
                                        SizedBox(width: width/27.428,),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            KText(text:Value['title'].toString(),
                                              align: TextAlign.center,
                                              style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w600,
                                                  color: const Color(0xff000000)),),
                                            KText(text:Value['subtitle'].toString(),
                                              align: TextAlign.center,
                                              style: GoogleFonts.poppins(
                                                  color: const Color(0xff000000)),),
                                            KText(text:Value['date'].toString(),
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
