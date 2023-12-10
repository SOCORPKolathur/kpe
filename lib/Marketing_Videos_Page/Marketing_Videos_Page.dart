
import 'dart:core';
import 'dart:core';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'dart:io';
import '../Translator_Module/Translator_Module_Page.dart';


class Marketing_Videos_Page extends StatefulWidget {
  const Marketing_Videos_Page({Key? key}) : super(key: key);

  @override
  State<Marketing_Videos_Page> createState() => _Marketing_Videos_PageState();
}

class _Marketing_Videos_PageState extends State<Marketing_Videos_Page> {
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
                    text: 'Marketing Videos',
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
              stream: FirebaseFirestore.instance.collection("Marketting_video").orderBy("timestamp").snapshots(),
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
                      var Value=snapshot.data!.docs[index];

                      return
                        Padding(
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
                                            height:height/15.132,
                                            width: width/7.39622641509434,
                                            decoration: BoxDecoration(
                                                color: Colors.grey.shade300,
                                                borderRadius:  BorderRadius.circular(8)
                                            ),
                                            child: Image.network(Value['img'].toString())
                                        ),
                                        SizedBox(width: width/27.428,),
                                        SizedBox(
                                          width:width/1.7818,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: [
                                              KText(text:Value['title'].toString(),
                                                align: TextAlign.center,
                                                style: GoogleFonts.poppins(
                                                    fontWeight: FontWeight.w600,
                                                    textStyle: TextStyle(
                                                    overflow: TextOverflow.ellipsis
                                                    ),
                                                    color: const Color(0xff000000)),),
                                              KText(text:Value['subtitle'].toString(),
                                                align: TextAlign.center,
                                                style: GoogleFonts.poppins(
                                                    textStyle: TextStyle(
                                                        overflow: TextOverflow.ellipsis
                                                    ),
                                                    color: const Color(0xff000000)),),
                                              KText(text:Value['date'].toString(),
                                                align: TextAlign.center,
                                                style: GoogleFonts.poppins(
                                                    textStyle: TextStyle(
                                                        overflow: TextOverflow.ellipsis
                                                    ),
                                                    color: const Color(0xff000000)),),

                                            ],
                                          ),
                                        ),
                                        SizedBox(width: width/27.428,),
                                        InkWell(
                                          onTap: () async {

                                             var data=await downloadFile(Value['Url'].toString());
                                             print("dataaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
                                             print(data);

                                           if(data!=null){
                                             print("1111111111111111111111111111111111111");
                                             print(data);
                                             ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Download Success Fully")));
                                           }
                                           else{
                                             ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Download Failed")));
                                           }

                                          },
                                          child: Container(
                                            height: height/26.733,
                                            width: width/13.06666666666667,
                                           decoration: BoxDecoration(
                                             color: Colors.grey.shade300,
                                             borderRadius: BorderRadius.circular(5)
                                           ),
                                            child: Center(
                                              child: Icon(Icons.download),
                                            ),
                                          ),
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

   downloadFile(String url) async {


   // Dio dio = Dio();
    try {
      // var dir = await getApplicationDocumentsDirectory();
      // await dio.download(url, "${dir.path}/video.mp4", onReceiveProgress: (rec, total) async {
      //   print("Rec: $rec , Total: $total");
      //
      //   String filePath = '${dir.path}/video.mp4';
      //   File videoFile = File(filePath);
      // });

      String? taskId = await FlutterDownloader.enqueue(
        url: url,
        savedDir: '/storage/emulated/0/Download',
        fileName: 'video.mp4',
        showNotification: true,
        allowCellular: true,
        openFileFromNotification: true,
        saveInPublicStorage: true,
        requiresStorageNotLow: true,
      );

      return taskId; // Return the task ID

    }
    catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Download Failed")));
    }
  }


}
