import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kpe/Marketing_Flyers_Page/Birthday.dart';
import 'package:page_transition/page_transition.dart';

import '../Translator_Module/Translator_Module_Page.dart';
import 'Policies Advertisment_Page.dart';

class marketing extends StatefulWidget {
  const marketing({super.key});

  @override
  State<marketing> createState() => _marketingState();
}

class _marketingState extends State<marketing> {
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
                    text: 'Marketing Flyers',
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
                      text: 'Select the type',
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  height: height / 1.50,
                  width: width / 1.15,
                  decoration: BoxDecoration(
                      color: const Color(0xffffffff),
                      border: Border.all(color: const Color(0xff0C9346)),
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance.collection("Marketing_Flyers").orderBy("name").snapshots(),
                        builder:(context, snapshot) {

                          if(snapshot.hasData==null){
                            return const Center(
                                child: CircularProgressIndicator()
                            );
                          }
                          if(!snapshot.hasData){
                            return const Center(
                                child: Text(
                                    ""
                                )
                            );
                          }
                          return
                            ListView.builder(
                              shrinkWrap: true,
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (context, index) {
                                var Marketting=snapshot.data!.docs[index];

                                return   GestureDetector(
                                  onTap: (){

                                    if(Marketting['name']=="Policies Advertisment"){

                                      Navigator.push(context, MaterialPageRoute(
                                        builder: (context) =>
                                            PoliciesAdvertisment_Page(Name:Marketting['name'].toString()),));
                                    }
                                    else {
                                      Navigator.push(context, MaterialPageRoute(
                                        builder: (context) =>
                                            birthday(Marketting['name']
                                                .toString()),));
                                    }
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
                                              text:Marketting['name'].toString(),
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
                                );

                              },);
                        }, ),
                    ],
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
