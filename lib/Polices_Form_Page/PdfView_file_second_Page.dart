
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Translator_Module/Translator_Module_Page.dart';

class PdfView_file_second_Page extends StatefulWidget {
  String?Pdfviewtype1;
  String?Pdfviewtype2;
   PdfView_file_second_Page(this.Pdfviewtype1,this.Pdfviewtype2);

  @override
  State<PdfView_file_second_Page> createState() => _PdfView_file_second_PageState();
}

class _PdfView_file_second_PageState extends State<PdfView_file_second_Page> {
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


      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [

            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection("Policies_pdf_forms").orderBy("pdfname").snapshots(),
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

                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder:(context, index) {
                    var value=snapshot.data!.docs[index];

                    if(value['type']==widget.Pdfviewtype1 ){
                      return ListTile(
                          onTap: () async {
                            await launch(value['pdfurl'].toString());
                          },
                          title: Text(value['pdfname']),
                          leading: Image.network("https://firebasestorage.googleapis.com/v0/b/kp-enterpries.appspot.com/o/final%20pdf%20images.png?alt=media&token=2ebd29ac-b3c1-47e6-9fc1-5f140bf0545a")
                      );
                    }
                    return const SizedBox();
                  },);

              }, ),


          ],
        ),
      ),

    );
  }
}
