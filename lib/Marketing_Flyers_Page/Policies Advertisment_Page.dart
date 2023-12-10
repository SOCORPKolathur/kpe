import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kpe/Translator_Module/Translator_Module_Page.dart';

import 'Poliy_Advertiment_subCategory.dart';

class PoliciesAdvertisment_Page extends StatefulWidget {
  String? Name;

  PoliciesAdvertisment_Page({this.Name});

  @override
  State<PoliciesAdvertisment_Page> createState() =>
      _PoliciesAdvertisment_PageState();
}

class _PoliciesAdvertisment_PageState extends State<PoliciesAdvertisment_Page> {
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
                height: height / 30.062,
                width: width / 1.418,
                child: FittedBox(
                  alignment: Alignment.centerLeft,
                  fit: BoxFit.contain,
                  child: KText(
                    text: '${widget.Name}',
                    style: const TextStyle(
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
      body: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
            children: [
              StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("Policies Advertisment_category")
                    .orderBy("timestamp")
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData == null) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      var Policy = snapshot.data!.docs[index];

                      return
                        GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>Poliy_Advertiment_subCategory(
                            DocumentID: Policy.id,
                            TypeName: Policy['name'].toString(),
                          ) ,));

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
                                width: width / 1.6457,
                                height: height / 36.062,
                                child: FittedBox(
                                  fit: BoxFit.contain,
                                  alignment: Alignment.centerLeft,
                                  child: KText(
                                    text: Policy['name'].toString(),
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
                    },
                  );
                },
              ),
              SizedBox(
                height: height / 86.6,
              )
            ],
          )),
    );
  }
}
