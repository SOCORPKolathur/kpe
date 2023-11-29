
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:kpe/Translator_Module/Translator_Module_Page.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart' as p;

import 'package:path_provider/path_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:printing/printing.dart';
import 'package:share_plus/share_plus.dart';
import 'package:translator/translator.dart';
import '../Translator_Module/Translator_Module_Page.dart';
import '../Translator_Module/Translator_Module_Page.dart';
import '../Translator_Module/Translator_Module_Page.dart';
import '../const File Page.dart';
import 'New_Endowment_details_Page.dart';
import 'package:intl/intl.dart';





class endowment extends StatefulWidget {
  String plantype;
  endowment(this.plantype);

  @override
  State<endowment> createState() => _endowmentState();
}

class _endowmentState extends State<endowment> {
  bool ADDBswitch = false;
  bool Teamraider = false;
  bool AgeExtra = false;
  bool Presentation = false;
  bool Settlement = false;

  TextEditingController Namecon = TextEditingController();
  TextEditingController Agecon = TextEditingController();
  TextEditingController Assumedcon = TextEditingController();
  TextEditingController Teamcon = TextEditingController();
  TextEditingController Bounuscon = TextEditingController();


  final MaterialStateProperty<Icon?> thumbIcon =
  MaterialStateProperty.resolveWith<Icon?>(
        (Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return const Icon(Icons.check);
      }
      return const Icon(Icons.close);
    },
  );


  List<Product> product = [];

  String _character1="1";
  String _character2="";

  static const TYPE_radio1 = 1;

  static const TYPE_radio2 = 2;

  List<String> Name = ["Good", "Bad", "Hello", "World", "Max"];

  List<String> Age = ["20", "21", "22", "23", "24"];

  String userid= FirebaseAuth.instance.currentUser!.uid;

  String Username="";


  GoogleTranslator translator = GoogleTranslator();
  final Formkey=GlobalKey<FormState>();


  static const _locale = 'en';
  String _formatNumber(String s) => NumberFormat.decimalPattern(_locale).format(int.parse(s));
  String get _currency => NumberFormat.compactSimpleCurrency(locale: _locale).currencySymbol;

@override
  void initState() {
    Userdata();
  // TODO: implement initState
    super.initState();
  }


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
    var localizationDelegate = LocalizedApp
        .of(context)
        .delegate;
    Locale currentLocale = localizationDelegate.currentLocale;
    return Scaffold(
      backgroundColor: const Color(0xffF9F9F9),
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
                child: FittedBox(
                  alignment: Alignment.centerLeft,
                  fit: BoxFit.contain,
                  child: KText(
                    text: 'New Endowment',
                    style: TextStyle(
                        fontFamily: "Davish",
                        color: Colors.white,
                        fontSize: width / 13.714,
                        letterSpacing: 0.3
                    ),
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
        child: Column(
            children: [

              ///Plan details text
              Padding(
                padding: EdgeInsets.only(
                    left: width / 19.6, top: height / 50.6),
                child: GestureDetector(
                  onTap: () {},
                  child: SizedBox(
                    width: width / 1.6457,
                    height: height / 35.062,
                    child: FittedBox(
                      fit: BoxFit.contain,
                      alignment: Alignment.center,
                      child: KText(
                        text: 'Plan Details',
                        style: GoogleFonts.amaranth(
                            fontWeight: FontWeight.w500,
                            fontSize: width / 17.142,
                            color: const Color(0xff000000)),
                      ),
                    ),
                  ),
                ),
              ),

              ///details container and textfield
              Form(
                key: Formkey,
                child: Padding(
                  padding: EdgeInsets.only(left: width / 78.4,
                      top: height / 94.87),
                  child: Container(
                    height: height / 2.3,
                    width: width / 1.15,
                    decoration: BoxDecoration(
                        color: const Color(0xffffffff),
                        border: Border.all(color: const Color(0xff0C9346)),
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              top: height / 39.95, right: width / 1.66),
                          child: FittedBox(
                            alignment: Alignment.center,
                            fit: BoxFit.contain,
                            child: KText(
                              text: 'Name',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  fontSize: width / 29.387,
                                  color: const Color(0xff000000)),
                            ),
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.only(
                              right: width / 39.2,
                              top: height / 75.9),
                          child:
                          Container(
                            height: height / 25.3,
                            width: width / 1.4,
                            decoration: BoxDecoration(
                              color: const Color(0xffffffff),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: const Color(0xffD1CDCD),
                              ),
                            ),
                            child: Padding(
                                padding: EdgeInsets.only(
                                    left: width / 39.2,),
                                child: TextFormField(
                                  controller: Namecon,
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      fontSize: width / 22.402,
                                      color: Colors.black),
                                  decoration:
                                  InputDecoration(border: InputBorder.none,
                                      contentPadding: EdgeInsets.only(
                                          left: width / 41.143,
                                          bottom: height / 150.187,)
                                  ),
                                  validator: (value) => value!.isEmpty
                                      ? "Field Can't Empty" : null,
                                ),),
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.only(
                              top: height / 37.95, right: width / 1.60),
                          child: FittedBox(
                            fit: BoxFit.contain,
                            alignment: Alignment.center,
                            child: KText(
                              text: 'Age',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  fontSize: width / 29.387,
                                  color: const Color(0xff000000)),
                            ),
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.only(
                              right: width / 39.2, top: height / 75.9),
                          child: Container(
                            height: height / 25.3,
                            width: width / 1.4,
                            decoration: BoxDecoration(
                              color: const Color(0xffffffff),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: const Color(0xffD1CDCD),
                              ),
                            ),
                            child: Padding(
                                    padding: EdgeInsets.only(
                                        left: width / 32.66),
                                child: TextFormField(
                                  controller: Agecon,
                                  keyboardType: TextInputType.number,
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      fontSize: width / 22.402,
                                      color: Colors.black),
                                  decoration:
                                  InputDecoration(border: InputBorder.none,
                                      contentPadding: EdgeInsets.only(
                                          left: width / 41.143,
                                        bottom: height / 150.187,)
                                  ),

                                  validator: (value) => value!.isEmpty
                                      ? "Field Can't Empty" : null,
                                )),
                          ),
                        ),

                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  top: height / 50.6, left: 38.5),
                              child: FittedBox(
                                alignment: Alignment.centerLeft,
                                fit: BoxFit.contain,
                                child: KText(
                                  text: 'Sums Assumed',
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      fontSize: width / 29.387,
                                      color: const Color(0xff000000)),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              right: width / 39.2, top: height / 75.9),
                          child: Container(
                            height: height / 25.3,
                            width: width / 1.4,
                            decoration: BoxDecoration(
                              color: const Color(0xffffffff),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: const Color(0xffD1CDCD),
                              ),
                            ),
                            child:
                            Padding(
                                padding: EdgeInsets.only(
                                    left: width / 32.66),
                                child: TextFormField(
                                  controller: Assumedcon,
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      fontSize: width / 22.402,
                                      color: Colors.black),
                                  decoration:
                                  InputDecoration(border: InputBorder.none,
                                      contentPadding: EdgeInsets.only(
                                          left: width / 41.143,
                                        bottom: height / 150.187,)
                                  ),
                                  keyboardType: TextInputType.number,
                                  onChanged: (string) {
                                    string = '${_formatNumber(string.replaceAll(',', ''))}';
                                    Assumedcon.value = TextEditingValue(
                                      text: string,
                                      selection: TextSelection.collapsed(offset: string.length),
                                    );
                                  },

                                  validator: (value) => value!.isEmpty
                                      ? "Field Can't Empty" : null,
                                )),
                          ),
                        ),

                        Row(
                          children: [
                            Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      right: width / 15.68,
                                      top: height / 50.6),
                                  child: KText(
                                    text: 'Term',
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w600,
                                        fontSize: width / 31.648,
                                        color: Colors.black),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: width / 13.06,
                                      top: height / 75.9),
                                  child: Container(
                                    height: height / 25.3,
                                    width: width / 3.92,
                                    decoration: BoxDecoration(
                                      color: const Color(0xffffffff),
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: const Color(0xffD1CDCD),
                                      ),
                                    ),
                                    child: Padding(
                                        padding: EdgeInsets.only(
                                            left: width / 32.66,right:width / 52.66),
                                        child: TextFormField(
                                          controller: Teamcon,
                                          maxLength: 2,
                                          keyboardType: TextInputType.number,
                                          style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w500,
                                              fontSize: width / 22.402,
                                              color: Colors.black),
                                          decoration: InputDecoration(
                                              counterText: "",
                                              border: InputBorder.none,
                                              contentPadding: EdgeInsets.only(
                                                  left: width / 41.143,
                                                bottom: height / 150.187,
                                           )
                                          ),
                                          validator: (value) => value!.isEmpty
                                              ? "Field Can't Empty" : null,
                                      onFieldSubmitted: (Value){
                                            if(int.parse(Teamcon.text)<16&&int.parse(Teamcon.text)>0){
                                              setState(() {
                                                Bounuscon.text="35";
                                              });

                                            }
                                            else if(int.parse(Teamcon.text)>=16&&int.parse(Teamcon.text)<=20){
                                              setState(() {
                                                Bounuscon.text="39";
                                              });

                                            }
                                            else if(int.parse(Teamcon.text)>20){
                                              setState(() {
                                                Bounuscon.text="45";

                                              });

                                            }


                                      },
                                        ),

                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: width / 7.84),
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: width / 412,),
                                        child: KText(
                                          text: 'Bonus',
                                          style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w600,
                                              fontSize: width / 31.648,
                                              color: Colors.black),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: width / 13.06,
                                            top: height / 75.9),
                                        child: Container(
                                          height: height / 25.3,
                                          width: width / 3.92,
                                          decoration: BoxDecoration(
                                            color: const Color(0xffffffff),
                                            borderRadius: BorderRadius.circular(
                                                10),
                                            border: Border.all(
                                              color: const Color(0xffD1CDCD),
                                            ),
                                          ),
                                          child: Padding(
                                              padding: EdgeInsets.only(
                                                  left: width / 32.66,right:width / 52.66 ),
                                              child: TextFormField(
                                                readOnly: true,
                                                controller: Bounuscon,
                                                maxLength: 2,
                                                keyboardType: TextInputType.number,
                                                style: GoogleFonts.poppins(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: width / 22.402,
                                                    color: Colors.black),
                                                decoration: InputDecoration(
                                                    counterText: "",
                                                    border: InputBorder.none,
                                                    contentPadding: EdgeInsets
                                                        .only(
                                                        left: width / 41.143,
                                                      bottom: height / 150.187,)
                                                ),

                                                validator: (value) => value!.isEmpty
                                                    ? "Field Can't Empty" : null,
                                              )),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              ///AD AND DB And Switch
              Row(
                children: [

                  Padding(
                    padding:
                    EdgeInsets.only(left: width / 13.06, top: height / 37.95),
                    child: SizedBox(
                      width: width / 1.371,
                      child: KText(
                        text: 'AD AND DB',
                        style: GoogleFonts.amaranth(
                            fontWeight: FontWeight.w500,
                            fontSize: width / 20.57,
                            color: const Color(0xff000000)),
                      ),
                    ),
                  ),

                  Padding(
                    padding:
                    EdgeInsets.only(top: height / 37.95),
                    child:
                    Switch(
                      value: ADDBswitch,
                      activeColor: const Color(0xff0C9346),
                      onChanged: (bool value) {
                        setState(() {
                          ADDBswitch = value;
                        });
                      },
                    ),
                  )
                ],
              ),

              ///Age Extra And Switch
              Row(
                children: [
                  Padding(
                    padding:
                    EdgeInsets.only(left: width / 13.06, top: height / 75.9),
                    child: SizedBox(
                      width: width / 1.371,
                      child: KText(
                        text: 'Age Extra',
                        style: GoogleFonts.amaranth(
                            fontWeight: FontWeight.w500,
                            fontSize: width / 20.57,
                            color: const Color(0xff000000)),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                    EdgeInsets.only(top: height / 75.9),
                    child:
                    Switch(
                      value: AgeExtra,
                      activeColor: const Color(0xff0C9346),
                      onChanged: (bool value) {
                        setState(() {
                          AgeExtra = value;
                        });
                      },
                    ),
                  )
                ],
              ),

              ///Team raider And Switch
              Row(
                children: [
                  Padding(
                    padding:
                    EdgeInsets.only(left: width / 13.06, top: height / 75.9),
                    child: SizedBox(
                      width: width / 1.371,
                      child: KText(
                        text: 'Team Rider',
                        style: GoogleFonts.amaranth(
                            fontWeight: FontWeight.w500,
                            fontSize: width / 20.57,
                            color: const Color(0xff000000)),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                    EdgeInsets.only(top: height / 75.9),
                    child:
                    Switch(
                      value: Teamraider,
                      activeColor: const Color(0xff0C9346),
                      onChanged: (bool value) {
                        setState(() {
                          Teamraider = value;
                        });
                      },
                    ),
                  )
                ],
              ),

              ///old Presentation And Switch
              Row(
                children: [
                  Padding(
                    padding:
                    EdgeInsets.only(left: width / 13.06, top: height / 151.8),
                    child: SizedBox(
                      width: width / 1.371,
                      child: KText(
                        text: 'Old Presentation',
                        style: GoogleFonts.amaranth(
                            fontWeight: FontWeight.w500,
                            fontSize: width / 20.57,
                            color: const Color(0xff000000)),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                    EdgeInsets.only(top: height / 151.8),
                    child:
                    Switch(
                      value: Presentation,
                      activeColor: const Color(0xff0C9346),
                      onChanged: (bool value) {
                        setState(() {
                          Presentation = value;
                        });
                      },
                    ),
                  )
                ],
              ),

              ///Settlement And Switch
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: width / 13.06, top: 5.0),
                    child: SizedBox(
                      width: width / 1.371,
                      child:
                      KText(
                        text: 'Maturity Settlement',
                        style: GoogleFonts.amaranth(
                            fontWeight: FontWeight.w500,
                            fontSize: width / 20.57,
                            color: const Color(0xff000000)),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                    EdgeInsets.only(top: height / 151.8),
                    child: Switch(
                      activeColor: const Color(0xff0C9346),
                      value: Settlement,
                      onChanged: (bool value) {
                        setState(() {
                          Settlement = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: height / 41.028,),


              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Radio(
                    activeColor: Colors.green,
                    value: TYPE_radio1.toString(),
                    groupValue: _character1,
                    onChanged: (value) {
                      setState(() {
                        _character1 = value.toString();
                        _character2 = "";
                      });
                    },),

                  SizedBox(
                    height: height / 43.82,
                    width: width / 5.142,
                    child: FittedBox(
                      fit: BoxFit.contain,
                      alignment: Alignment.centerLeft,
                      child: KText(
                        text: 'View Pdf 1',
                        style: GoogleFonts.amaranth(
                            fontWeight: FontWeight.w500,

                            color: const Color(0xff000000)),
                      ),
                    ),
                  ),

                  SizedBox(width: width / 10.285,),

                  Radio(
                    activeColor: Colors.green,
                    value: TYPE_radio2.toString(),
                    groupValue: _character2,
                    onChanged: (value) {
                      setState(() {
                        _character2 = value.toString();
                        _character1 = "";
                      });
                    },
                  ),

                  SizedBox(
                    height: height / 43.82,
                    width: width / 5.142,
                    child: FittedBox(
                      alignment: Alignment.centerLeft,
                      fit: BoxFit.contain,
                      child: KText(
                        text: 'View Pdf 2',
                        style: GoogleFonts.amaranth(
                            fontWeight: FontWeight.w500,

                            color: const Color(0xff000000)),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: height / 41.028,),

              ///Submit  And  Pdf container
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  GestureDetector(
                    onTap: () async {
                         if (Formkey.currentState!.validate()) {
                           Navigator.push(
                               context, MaterialPageRoute(builder: (context) =>
                               New_Endowment_details_Page(
                                 Namecon.text,
                                 Agecon.text,
                                 Assumedcon.text,
                                 Teamcon.text,
                                 Bounuscon.text,

                               ),));



                         }

                    },
                    child:
                    Container(
                      height: height / 17.97,
                      width: width / 2.21,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(17),
                        gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Color(0xff0C9346), Color(0xff008069)],
                        ),
                      ),
                      child: Center(
                        child: SizedBox(
                          width: width / 1.6457,
                          height: height / 35.062,
                          child: const FittedBox(
                            fit: BoxFit.contain,
                            child: KText(
                                text: "Submit",
                                style: TextStyle(
                                  fontFamily: "Davish",
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xffffffff),
                                )
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  GestureDetector(

                    onTap: () async {
                      //getItemList(context);
                      getvalue();

                      },
                    child:
                    Container(
                      height: height / 17.97,
                      width: width / 2.21,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(17),
                        gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Color(0xff0C9346), Color(0xff008069)],
                        ),
                      ),
                      child: Center(
                        child: SizedBox(
                          width: width / 1.6457,
                          height: height / 35.062,
                          child: const FittedBox(
                            fit: BoxFit.contain,
                            alignment: Alignment.center,
                            child: KText(
                                text: "PDF",
                                style: TextStyle(
                                  fontFamily: "Davish",
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xffffffff),
                                )
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),


              SizedBox(height: height / 29.219,),
            ]),
      ),
    );
  }

  translateLanguage(String text, String code) async {
    Translation translation = await translator.translate(text, to: code);
    return translation;
  }

  Future<File> saveAssetImageToTempFile(String assetPath) async {
    ByteData data = await rootBundle.load(assetPath);
    Uint8List bytes = data.buffer.asUint8List();
    Directory tempDir = await getTemporaryDirectory();
    String tempFilePath = '${tempDir.path}/temp_image.png';
    File tempImage = File(tempFilePath);
    await tempImage.writeAsBytes(bytes);
    return tempImage;
  }



  getvalue() async {
    final pdf = pw.Document();
  final ByteData image = await rootBundle.load('assets/avator icon.png');
  Uint8List imageData = (image).buffer.asUint8List();

  final ByteData image2 = await rootBundle.load('assets/pexels-pixabay-357514 (1).jpg');
  Uint8List imageData2 = (image2).buffer.asUint8List();

  double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;


    List<p.Widget> widgets = [];

    widgets.add(p.SizedBox(height: 5));

    widgets.add(
         p.Container(
            child:
          p.  Column(
              children: [


                    p.Container(
                      height: 25,
                      width: double.infinity,
                      child:
                      p.Center(
                        child: p.Text(
                          "New Endowment",
                          style: const p.TextStyle(
                              color: PdfColors.black,
                              letterSpacing: 0.3,
                              fontSize: 16
                          ),
                        ),
                      )
                    ),
                p.Divider(),
                p.SizedBox(height: 10),

                p.Container(
                    height: 200.0,
                    child: pw.Image(pw.MemoryImage(imageData2))
                ),


                p.SizedBox(height: 10),
                p.Container(
                  height: 25,
                  width: double.infinity,
                  child:
                  p.Text(
                    "Prepared by",
                    style: const p.TextStyle(
                        color: PdfColors.black,
                        letterSpacing: 0.3,
                        fontSize: 16
                    ),
                  ),
                ),
                p.Divider(),





                ///profile image and text widgets
                p.  Row(
                  mainAxisAlignment: p.MainAxisAlignment.start,
                  children: [
                    p.SizedBox(width:20),
                    p.Container(
                        width: 50.0,
                        height: 50.0,
                        child: pw.Image(pw.MemoryImage(imageData))
                    ),
                    p.SizedBox(width:10),
                    p.  SizedBox(
                      height: 20,
                      child:p.  FittedBox(
                        fit: p. BoxFit.contain,
                        alignment: p.Alignment.center,
                        child: p. Text(
                         "Raja",
                          style:  const p. TextStyle(
                              color: PdfColors.black,

                          ),
                        ),
                      ),
                    ),


                  ],
                ),
                p. SizedBox(height: 10),

            //imageData




                ///sumassured value and terms and text and value
                p.  Row(
                  mainAxisAlignment: p. MainAxisAlignment.spaceAround,
                  children: [
                    ///age container text
                    p.    SizedBox(
                      height: 50,
                      child: p. Column(
                        mainAxisAlignment: p. MainAxisAlignment.spaceAround,
                        children: [
                          p.   SizedBox(
                            height: 20,
                            width: 50,
                            child:  p. FittedBox(
                              alignment: p. Alignment.center,
                              fit: p. BoxFit.contain,
                              child:p.Text(
                                "Age",
                                style: const p. TextStyle(
                                    color: PdfColors.black,
                                    letterSpacing: 0.3
                                ),
                              ),
                            ),
                          ),
                          p.  SizedBox(
                            height: 20,
                            width: 50,
                            child:p.FittedBox(
                              fit:p.  BoxFit.contain,
                              alignment: p. Alignment.center,
                              child:p.Text(
                                "100",
                                style: const p.  TextStyle(
                                    color: PdfColors.black,
                                    letterSpacing: 0.3
                                ),
                              ),
                            ),
                          ),




                        ],
                      ),
                    ),

                    ///SumAssured container and text
                    p. SizedBox(
                      height: 50,
                      child:p.  Column(
                        mainAxisAlignment: p.MainAxisAlignment.spaceAround,
                        children: [

                          p.  SizedBox(
                            height: 20,
                            width: 80,
                            child:  p.Text(
                              "SumAssured",
                              style: const p.TextStyle(
                                  color: PdfColors.black,
                                  letterSpacing: 0.3
                              ),
                            ),
                          ),
                          p. SizedBox(
                            height: 20,
                            width: 80,
                            child: p.Text(
                               "SumAssured",
                              style: const p.TextStyle(
                                  color: PdfColors.black,
                                  letterSpacing: 0.3
                              ),
                            ),
                          ),




                        ],
                      ),
                    ),

                    ///Term container and text
                    p. SizedBox(
                      height: 50,
                      child: p. Column(
                        mainAxisAlignment: p. MainAxisAlignment.spaceAround,
                        children: [

                          p. SizedBox(
                            height: 20,
                            width: 50,
                            child: p.  FittedBox(
                              alignment: p.Alignment.center,
                              fit: p.BoxFit.contain,
                              child: p.Text(
                              "Term",
                                style: const p.TextStyle(
                                    color: PdfColors.black,
                                    letterSpacing: 0.3
                                ),
                              ),
                            ),
                          ),
                          p.  SizedBox(
                            height: 20,
                            width: 50,
                            child:p.  FittedBox(
                              fit: p.BoxFit.contain,
                              alignment: p.Alignment.center,
                              child: p.Text(
                                 "TErm",
                                style: const p.TextStyle(
                                    color:PdfColors.black,
                                    letterSpacing: 0.3
                                ),
                              ),
                            ),
                          ),




                        ],
                      ),
                    ),

                    ///ppt container and text
                    p.   SizedBox(
                      height: 50,
                      child: p. Column(
                        mainAxisAlignment: p.MainAxisAlignment.spaceAround,
                        children: [

                          p.   SizedBox(
                            height: 20,
                            width: 50,
                            child: p.  FittedBox(
                              alignment: p.Alignment.center,
                              fit: p.BoxFit.contain,
                              child: p.Text(
                                "PPT",
                                style: const p.TextStyle(
                                    color: PdfColors.black,
                                    letterSpacing: 0.3
                                ),
                              ),
                            ),
                          ),
                          p.  SizedBox(
                            height: 20,
                            width: 80,
                            child: p. FittedBox(
                              fit: p.BoxFit.contain,
                              alignment: p.Alignment.center,
                              child: p.Text(
                                "PPt value",
                                style: const p. TextStyle(
                                    color: PdfColors.black,
                                    letterSpacing: 0.3
                                ),
                              ),
                            ),
                          ),




                        ],
                      ),
                    ),


                  ],
                ),

              p.SizedBox(height: 10,),

                ///first year premium container---start(4.5% gst)
                p.Container(
                  height: 25,
                  decoration:  const p.BoxDecoration(
                    gradient: p.LinearGradient(
                      begin: p.Alignment.topCenter,
                      end:p. Alignment.bottomCenter,
                      colors: [PdfColor.fromInt(0xff0C9346), PdfColor.fromInt(0xff008069)],
                    ),
                  ),
                  child: p.Center(
                    child:
                    p.SizedBox(
                      height: 25,
                      width: double.infinity,
                      child:
                      p. FittedBox(
                        alignment: p.Alignment.center,
                        fit:p. BoxFit.contain,
                        child: p.Text(
                          "First Year Premium(4.5% Gst)",
                          style: const p.TextStyle(
                              color: PdfColors.white,
                              letterSpacing: 0.3
                          ),
                        ),
                      ),
                    ),
                  ),


                ),

                ///yearly and half text container and so on.......
                p.Container(
                   height: 25,
                  decoration: const p.BoxDecoration(
                      color: PdfColors.grey
                  ),
                  child: p.Row(
                    mainAxisAlignment: p.MainAxisAlignment.spaceAround,
                    children:  [

                      ///yearly text
                      p.SizedBox(
                        height: 20,
                        width: 60,
                        child: p.SizedBox(
                          height: 20,
                          width: 60,
                          child:
                          p.FittedBox(
                            alignment: p.Alignment.center,
                            fit: p.BoxFit.contain,
                            child: p.Text(
                              "YLY",
                              style: const p.TextStyle(
                                  color: PdfColors.black,
                                  letterSpacing: 0.3
                              ),
                            ),
                          ),
                        ),
                      ),


                      ///halfy text
                      p.SizedBox(
                        height: 20,
                        width: 60,
                        child: p.SizedBox(
                          height: 20,
                          width: 60,
                          child:
                          p.FittedBox(
                            alignment: p.Alignment.center,
                            fit: p.BoxFit.contain,
                            child: p.Text(
                              "HLY",
                              style: const p.TextStyle(
                                  color: PdfColors.black,
                                  letterSpacing: 0.3
                              ),
                            ),
                          ),
                        ),
                      ),

                      ///Quvatterly text
                      p.SizedBox(
                        height: 20,
                        width: 60,
                        child: p.SizedBox(
                          height: 20,
                          width: 60,
                          child:
                          p. FittedBox(
                            alignment: p.Alignment.center,
                            fit: p.BoxFit.contain,
                            child: p.Text(
                            "QLY",
                              style: const p.TextStyle(
                                  color: PdfColors.black,
                                  letterSpacing: 0.3
                              ),
                            ),
                          ),
                        ),
                      ),

                      ///monthly text
                      p.SizedBox(
                        height: 20,
                        width: 60,
                        child: p.SizedBox(
                          height: 20,
                          width: 60,
                          child:
                          p. FittedBox(
                            alignment: p.Alignment.center,
                            fit: p.BoxFit.contain,
                            child: p.Text(
                              "MLY",
                              style: const p.TextStyle(
                                  color: PdfColors.black,
                                  letterSpacing: 0.3
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                ///yearly and half text container and so on value text.......
                p.Container(
                  height: 20,
                  decoration: const p.BoxDecoration(
                    gradient: p.LinearGradient(
                      begin: p.Alignment.topCenter,
                      end: p.Alignment.bottomCenter,
                      colors: [
                        PdfColor.fromInt(0xff0C9346),
                        PdfColor.fromInt(0xff008069),
                      ],
                    ),
                  ),
                  child: p.Row(
                    mainAxisAlignment: p.MainAxisAlignment.spaceAround,
                    children:  [

                      ///yearly text
                      p.SizedBox(
                        height: 20,
                        width: 60,
                        child: p.SizedBox(
                          height: 20,
                          width: 60,
                          child:
                          p. FittedBox(
                            alignment: p.Alignment.center,
                            fit: p.BoxFit.contain,
                            child: p.Text(
                              "999999",
                              style: const p.TextStyle(
                                  color: PdfColors.white,
                                  letterSpacing: 0.3
                              ),
                            ),
                          ),
                        ),
                      ),


                      ///halfy text
                      p.SizedBox(
                        height: 20,
                        width: 60,
                        child: p.SizedBox(
                          height: 20,
                          width: 60,
                          child:
                          p. FittedBox(
                            alignment: p.Alignment.center,
                            fit: p.BoxFit.contain,
                            child: p.Text(
                              "999999",
                              style: const p.TextStyle(
                                  color: PdfColors.white,
                                  letterSpacing: 0.3
                              ),
                            ),
                          ),
                        ),
                      ),

                      ///Quvatterly text
                      p.SizedBox(
                        height: 20,
                        width: 60,
                        child: p.SizedBox(
                          height: 20,
                          width: 60,
                          child:
                          p. FittedBox(
                            alignment: p.Alignment.center,
                            fit: p.BoxFit.contain,
                            child: p.Text(
                              "999999",
                              style: const p.TextStyle(
                                  color: PdfColors.white,
                                  letterSpacing: 0.3
                              ),
                            ),
                          ),
                        ),
                      ),

                      ///monthly text
                      p.SizedBox(
                        height: 20,
                        width: 60,
                        child: p.SizedBox(
                          height: 20,
                          width: 60,
                          child:
                          p. FittedBox(
                            alignment: p.Alignment.center,
                            fit: p.BoxFit.contain,
                            child: p.Text(
                              "999999",
                              style: const p.TextStyle(

                                  color: PdfColors.white,
                                  letterSpacing: 0.3
                              ),
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),

                ///yearly and half  value text and gst value add .......
                p.Container(
                  height: 20,
                  decoration: const p.BoxDecoration(
                      color: PdfColor.fromInt(0xFFE0E0E0),
                  ),
                  child: p.Row(
                    mainAxisAlignment: p.MainAxisAlignment.spaceAround,
                    children:  [

                      ///yearly text
                      p.SizedBox(
                        height: 20,
                        width: 60,
                        child: p. FittedBox(
                          alignment: p.Alignment.center,
                          fit: p.BoxFit.contain,
                          child: p.Text(
                            "999999+10000",
                            style: const p.TextStyle(
                                color: PdfColors.black,
                                letterSpacing: 0.3
                            ),
                          ),
                        ),
                      ),


                      ///halfy text
                      p.SizedBox(
                        height: 20,
                        width: 60,
                        child: p. FittedBox(
                          alignment: p.Alignment.center,
                          fit: p.BoxFit.contain,
                          child: p.Text(
                            "999999+10000",
                            style: const p.TextStyle(
                                color: PdfColors.black,
                                letterSpacing: 0.3
                            ),
                          ),
                        ),
                      ),

                      ///Quvatterly text
                      p.SizedBox(
                        height: 20,
                        width: 60,
                        child:
                        p. FittedBox(
                          alignment: p.Alignment.center,
                          fit: p.BoxFit.contain,
                          child: p.Text(
                            "999999+10000",
                            style: const p.TextStyle(
                                color: PdfColors.black,
                                letterSpacing: 0.3
                            ),
                          ),
                        ),
                      ),

                      ///monthly text
                      p.SizedBox(
                        height: 20,
                        width: 60,
                        child:
                        p. FittedBox(
                          alignment: p.Alignment.center,
                          fit: p.BoxFit.contain,
                          child: p.Text(
                           "999999+10000",
                            style: const p.TextStyle(
                                color: PdfColors.black,
                                letterSpacing: 0.3
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
                ///first year premium container--end


                ///Renewal premium container---start(2.25% gst)
                p.Container(
                  height: 20,
                  decoration: const p. BoxDecoration(
                    gradient: p.LinearGradient(
                      begin: p.Alignment.topCenter,
                      end: p.Alignment.bottomCenter,
                      colors: [PdfColor.fromInt(0xff0C9346), PdfColor.fromInt(0xff008069)],
                    ),
                  ),
                  child: p.Center(
                    child:
                    p.SizedBox(
                      height: 20,
                      child:
                      p. FittedBox(
                        alignment: p.Alignment.center,
                        fit: p.BoxFit.contain,
                        child: p.Text(
                          "Renewal Premium(2.25% Gst)",
                          style: const p.TextStyle(
                              color: PdfColors.white,
                              letterSpacing: 0.3
                          ),
                        ),
                      ),
                    ),
                  ),


                ),

                ///yearly and half text container and so on.......
                p.Container(
                  height: 20,
                  decoration: const p.BoxDecoration(
                      color:PdfColor.fromInt(0xFFE0E0E0)
                  ),
                  child: p.Row(
                    mainAxisAlignment: p.MainAxisAlignment.spaceAround,
                    children:  [

                      ///yearly text
                      p.SizedBox(
                        height: 20,
                        width: 60,
                        child: p.SizedBox(
                          height: 20,
                          width: 60,
                          child:
                          p.FittedBox(
                            alignment: p.Alignment.center,
                            fit: p.BoxFit.contain,
                            child: p.Text(
                              "YLY",
                              style:  const p.TextStyle(
                                  color: PdfColors.black,
                                  letterSpacing: 0.3
                              ),
                            ),
                          ),
                        ),
                      ),


                      ///halfy text
                      p.SizedBox(
                        height: 20,
                        width: 60,
                        child: p.SizedBox(
                          height: 20,
                          width: 60,
                          child:
                          p. FittedBox(
                            alignment: p.Alignment.center,
                            fit: p.BoxFit.contain,
                            child: p.Text(
                              "HLY",
                              style: const p.TextStyle(
                                  color:PdfColors.black,
                                  letterSpacing: 0.3
                              ),
                            ),
                          ),
                        ),
                      ),

                      ///Quvatterly text
                      p.SizedBox(
                        height: 20,
                        width: 60,
                        child: p.SizedBox(
                          height: 20,
                          width: 60,
                          child:
                          p. FittedBox(
                            alignment: p.Alignment.center,
                            fit: p.BoxFit.contain,
                            child: p.Text(
                              "QLY",
                              style: const p.TextStyle(
                                  color: PdfColors.black,
                                  letterSpacing: 0.3
                              ),
                            ),
                          ),
                        ),
                      ),

                      ///monthly text
                      p.SizedBox(
                        height: 20,
                        width: 60,
                        child: p.SizedBox(
                          height: 20,
                          width: 60,
                          child:
                          p. FittedBox(
                            alignment: p.Alignment.center,
                            fit: p.BoxFit.contain,
                            child: p.Text(
                              "MLY",
                              style:const p.TextStyle(
                                  color: PdfColors.black,
                                  letterSpacing: 0.3
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                ///yearly and half text container and so on value text.......
                p.Container(
                  height: 20,
                  decoration: const p. BoxDecoration(
                    gradient: p.LinearGradient(
                      begin: p.Alignment.topCenter,
                      end: p.Alignment.bottomCenter,
                      colors: [PdfColor.fromInt(0xff0C9346), PdfColor.fromInt(0xff008069)],
                    ),
                  ),
                  child: p.Row(
                    mainAxisAlignment: p.MainAxisAlignment.spaceAround,
                    children:  [

                      ///yearly text
                      p.SizedBox(
                        height: 20,
                        width: 60,
                        child: p.SizedBox(
                          height: 20,
                          width: 60,
                          child:
                          p.FittedBox(
                            alignment: p.Alignment.center,
                            fit: p.BoxFit.contain,
                            child: p.Text(
                             "999999",
                              style: const p.TextStyle(
                                  color: PdfColors.white,
                                  letterSpacing: 0.3
                              ),
                            ),
                          ),
                        ),
                      ),


                      ///halfy text
                      p.SizedBox(
                        height: 20,
                        width: 60,
                        child: p.SizedBox(
                          height: 20,
                          width: 60,
                          child:
                          p. FittedBox(
                            alignment: p.Alignment.center,
                            fit: p.BoxFit.contain,
                            child: p.Text(
                              "999999",
                              style: const p.TextStyle(
                                  color: PdfColors.white,
                                  letterSpacing: 0.3
                              ),
                            ),
                          ),
                        ),
                      ),

                      ///Quvatterly text
                      p.SizedBox(
                        height: 20,
                        width: 60,
                        child: p.SizedBox(
                          height: 20,
                          width: 60,
                          child:
                          p. FittedBox(
                            alignment: p.Alignment.center,
                            fit: p.BoxFit.contain,
                            child: p.Text(
                             "999999",
                              style: const p.TextStyle(
                                  color: PdfColors.white,
                                  letterSpacing: 0.3
                              ),
                            ),
                          ),
                        ),
                      ),

                      ///monthly text
                      p.SizedBox(
                        height: 20,
                        width: 60,
                        child: p.SizedBox(
                          height: 20,
                          width: 60,
                          child:
                          p. FittedBox(
                            alignment: p.Alignment.center,
                            fit: p.BoxFit.contain,
                            child: p.Text(
                             "999999",
                              style: const p.TextStyle(
                                  color: PdfColors.white,
                                  letterSpacing: 0.3
                              ),
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),

                ///yearly and half  value text and gst value add .......
                p.Container(
                  height: 20,
                  decoration: const p.BoxDecoration(
                      color: PdfColors.grey
                  ),
                  child: p.Row(
                    mainAxisAlignment: p.MainAxisAlignment.spaceAround,
                    children:  [

                      ///yearly text
                      p.SizedBox(
                        height: 20,
                        width: 60,
                        child: p.FittedBox(
                          alignment: p.Alignment.center,
                          fit: p.BoxFit.contain,
                          child: p.Text(
                            "999999+10000",
                            style: const p.TextStyle(
                                color: PdfColors.black,
                                letterSpacing: 0.3
                            ),
                          ),
                        ),
                      ),


                      ///halfy text
                      p.SizedBox(
                        height: 20,
                        width: 60,
                        child: p.FittedBox(
                          alignment: p.Alignment.center,
                          fit: p.BoxFit.contain,
                          child: p.Text(
                           "999999+10000",
                            style: const p.TextStyle(
                                color: PdfColors.black,
                                letterSpacing: 0.3
                            ),
                          ),
                        ),
                      ),

                      ///Quvatterly text
                      p.SizedBox(
                        height: 20,
                        width: 60,
                        child:
                        p.FittedBox(
                          alignment: p.Alignment.center,
                          fit: p.BoxFit.contain,
                          child: p.Text(
                            "999999+10000",
                            style: const p.TextStyle(
                                color: PdfColors.black,
                                letterSpacing: 0.3
                            ),
                          ),
                        ),
                      ),

                      ///monthly text
                      p.SizedBox(
                        height: 20,
                        width: 60,
                        child:
                        p.FittedBox(
                          alignment: p.Alignment.center,
                          fit: p.BoxFit.contain,
                          child: p.Text(
                            "999999+10000",
                            style: const p.TextStyle(
                                color:PdfColors.black,
                                letterSpacing: 0.3
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),

                ///Renewal premium container---start(2.25% gst)--end.............


                ///approximate return container
                p.Container(
                  height: 20,
                  decoration: const p.BoxDecoration(
                    gradient: p.LinearGradient(
                      begin: p.Alignment.topCenter,
                      end: p.Alignment.bottomCenter,
                      colors: [PdfColor.fromInt(0xff0C9346), PdfColor.fromInt(0xff008069)],
                    ),
                  ),
                  child: p.Center(
                    child:
                    p.SizedBox(
                      height: 22,
                      width: width/2.0571,
                      child:
                      p. FittedBox(
                        alignment: p.Alignment.center,
                        fit: p.BoxFit.contain,
                        child: p.Text(
                          "Approximate Returns",
                          style: const p.TextStyle(
                              color: PdfColors.white,
                              letterSpacing: 0.3
                          ),
                        ),
                      ),
                    ),
                  ),


                ),
                p.SizedBox(height:5),

                ///approximate details container

                p.Container(
                  decoration: const p. BoxDecoration(
                    gradient: p.LinearGradient(
                      begin: p.Alignment.topCenter,
                      end: p.Alignment.bottomCenter,
                      colors: [PdfColor.fromInt(0xff0C9346), PdfColor.fromInt(0xff008069)],
                    ),
                  ),
                  padding: const p.EdgeInsets.only(top: 10,bottom: 10),

                  child:
                  p.Column(
                    children: [
                      ///sum assured text
                      p.Row(
                        mainAxisAlignment: p.MainAxisAlignment.spaceAround,
                        children: [
                          ///Sum Assured text
                          p.SizedBox(
                            height: 15,
                            width: width/4.1143,
                            child:
                            p. FittedBox(
                              alignment: p.Alignment.centerLeft,
                              fit: p.BoxFit.contain,
                              child: p.Text(
                               "Sum Assured",
                                style: const p.TextStyle(
                                    color: PdfColors.white,
                                    letterSpacing: 0.3
                                ),
                              ),
                            ),
                          ),

                          ///Sum Assured value  text
                          p.SizedBox(
                            height: 15,
                            width: width/4.1143,
                            child:
                            p. FittedBox(
                              alignment: p.Alignment.center,
                              fit: p.BoxFit.contain,
                              child: p.Text(
                                ": 200000",
                                style: const p.TextStyle(
                                    color: PdfColors.white,
                                    letterSpacing: 0.3
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      p.SizedBox(height: height/87.657),

                      ///Bounus Text
                      p.Row(
                        mainAxisAlignment: p.MainAxisAlignment.spaceAround,
                        children: [
                          ///Bonus text
                          p.SizedBox(
                            height: 15,
                            width: width/4.1143,
                            child:
                            p.FittedBox(
                              alignment: p.Alignment.centerLeft,
                              fit: p.BoxFit.contain,
                              child: p.Text(
                                "Bonus",
                                style: const p.TextStyle(
                                    color: PdfColors.white,
                                    letterSpacing: 0.3
                                ),
                              ),
                            ),
                          ),

                          ///Bonus text
                          p.SizedBox(
                            height: 15,
                            width: width/4.1143,
                            child:
                            p.FittedBox(
                              alignment: p.Alignment.center,
                              fit: p.BoxFit.contain,
                              child: p.Text(
                                ": 200000",
                                style:  const p.TextStyle(
                                    color: PdfColors.white,
                                    letterSpacing: 0.3
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      p.SizedBox(height: height/87.657),

                      ///final addition bonus text
                      p.Row(
                        mainAxisAlignment: p.MainAxisAlignment.spaceAround,
                        children: [
                          ///final addition bonus text
                          p.SizedBox(
                            height: 15,
                            width: width/4.1143,
                            child:
                            p.FittedBox(
                              alignment: p.Alignment.centerLeft,
                              fit: p.BoxFit.contain,
                              child:  p.Text(
                                "final addition bonus",
                                style:  const p.TextStyle(
                                    color: PdfColors.white,
                                    letterSpacing: 0.3
                                ),
                              ),
                            ),
                          ),

                          ///final addition bonus text
                          p.SizedBox(
                            height: 15,
                            width: width/4.1143,
                            child:
                            p. FittedBox(
                              alignment: p.Alignment.center,
                              fit: p.BoxFit.contain,
                              child:  p.Text(
                                ": 200000",
                                style:  const p.TextStyle(
                                    color: PdfColors.white,
                                    letterSpacing: 0.3
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      p.SizedBox(height: height/87.657),

                      ///maturity text
                      p.Row(
                        mainAxisAlignment: p.MainAxisAlignment.spaceAround,
                        children: [
                          ///maturity text
                          p.SizedBox(
                            height: 15,
                            width: width/4.1143,
                            child:
                            p. FittedBox(
                              alignment: p.Alignment.centerLeft,
                              fit: p.BoxFit.contain,
                              child:  p.Text(
                                "Maturity",
                                style:  const p.TextStyle(
                                    color: PdfColors.white,
                                    letterSpacing: 0.3
                                ),
                              ),
                            ),
                          ),

                          ///final addition bonus text
                          p.SizedBox(
                            height: 15,
                            width: width/4.1143,
                            child:
                            p.FittedBox(
                              alignment: p.Alignment.center,
                              fit: p.BoxFit.contain,
                              child:  p.Text(
                                ": 200000",
                                style:  const p.TextStyle(
                                    color: PdfColors.white,
                                    letterSpacing: 0.3
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),


                ),

                ///total details value container

                p.Container(
                  height: 40,
                  decoration: p.BoxDecoration(
                      border: p.Border.all(color: PdfColors.black)
                  ),
                  margin: const p.EdgeInsets.symmetric(
                      horizontal: 4,
                      vertical: 10
                  ),
                  child: p.Column(
                    mainAxisAlignment: p.MainAxisAlignment.spaceAround,
                    children: [
                      ///Total Premium text
                      p.Row(
                        mainAxisAlignment: p.MainAxisAlignment.spaceAround,
                        children: [
                          ///Total Premium text
                          p.SizedBox(
                            height: 15,
                            width: width/4.1143,
                            child:
                            p.FittedBox(
                              alignment: p.Alignment.centerLeft,
                              fit: p.BoxFit.contain,
                              child:  p.Text(
                                "Total Premium",
                                style:  const p.TextStyle(
                                    color: PdfColors.black,
                                    letterSpacing: 0.3
                                ),
                              ),
                            ),
                          ),

                          ///Total Premium value  text
                          p.SizedBox(
                            height: 15,
                            width: width/4.1143,
                            child:
                            p.FittedBox(
                              alignment: p.Alignment.center,
                              fit: p.BoxFit.contain,
                              child: p.Text(
                                ": 200000",
                                style:  const p.TextStyle(
                                    color: PdfColors.black,
                                    letterSpacing: 0.3
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),


                      ///Total Returns text
                      p.Row(
                        mainAxisAlignment: p.MainAxisAlignment.spaceAround,
                        children: [
                          ///Total Returns text
                          p.SizedBox(
                            height: 15,
                            width: width/4.1143,
                            child:
                            p.FittedBox(
                              alignment: p.Alignment.centerLeft,
                              fit: p.BoxFit.contain,
                              child:  p.Text(
                             "Total Returns",
                                style:  const p.TextStyle(
                                    color: PdfColors.black,
                                    letterSpacing: 0.3
                                ),
                              ),
                            ),
                          ),

                          ///Total Returns text
                          p.SizedBox(
                            height: 15,
                            width: width/4.1143,
                            child:
                            p.FittedBox(
                              alignment: p.Alignment.center,
                              fit: p.BoxFit.contain,
                              child:  p.Text(
                                ": 200000",
                                style:  const p.TextStyle(
                                    color: PdfColors.black,
                                    letterSpacing: 0.3
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                    ],
                  ),



                ),


                ///Medical reports text
                p.Container(
                  height: height/25.044,
                  decoration: const p.BoxDecoration(
                      gradient: p.LinearGradient(
                          begin: p.Alignment.topCenter,
                          end: p.Alignment.bottomCenter,
                          colors: [
                            PdfColor.fromInt(0xff0C9346),PdfColor.fromInt(0xff008069)]
                  ),
                  ),
                  child: p.Center(
                    child:
                    p.SizedBox(
                      height: height/39.844,
                      width: width/2.0571,
                      child:
                      p.FittedBox(
                        alignment: p.Alignment.center,
                        fit: p.BoxFit.contain,
                        child: p.Text(
                          "Medical reports",
                          style: const p.TextStyle(
                              color: PdfColors.white,
                              letterSpacing: 0.3
                          ),
                        ),
                      ),
                    ),
                  ),


                ),


                ///medical details container................
                p.SizedBox(height: height/87.657),
                p.Container(
                  width: double.infinity,
                  height: 150,
                  decoration: const p.BoxDecoration(
                    gradient: p.LinearGradient(
                      begin: p.Alignment.topCenter,
                      end: p.Alignment.bottomCenter,
                      colors: [PdfColor.fromInt(0xff0C9346), PdfColor.fromInt(0xff008069)],
                    ),
                  ),
                  child: p.Padding(
                    padding: const p. EdgeInsets.all(8.0),
                    child: p.Column(
                      crossAxisAlignment: p.CrossAxisAlignment.start,
                      children: [
                        p.SizedBox(
                          height: height/12.844,
                          width: width/1.0,
                          child: p.Text(
                            medicalreport_textvalue,
                            style: p.TextStyle(
                                color: PdfColors.white,
                                letterSpacing: 0.3,
                                fontSize: width/20.571
                            ),),
                        ),
                        p.SizedBox(height:5),

                        p.SizedBox(
                          height: height/26.844,
                          width: width/1.0,
                          child: p.Text(
                            medicalreport_textvalue2,
                            style: p.TextStyle(
                                color: PdfColors.white,
                                letterSpacing: 0.3,
                                fontSize: width/20.571

                            ),),
                        ),
                      ],
                    ),
                  ),
                ),









              ],

            ),


        ));

    pdf.addPage(
      p.MultiPage(
        pageFormat: PdfPageFormat.a4,
        build: (context) => widgets, //here goes the widgets list
      ),
    );
    Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save(),
    );
  }

  
  getItemList(BuildContext context) async {
    
    
    setState(() {
      product.clear();
    });
    var localizationDelegate = LocalizedApp.of(context).delegate;
    Locale currentLocale = localizationDelegate.currentLocale;

    for (int i = 0; i < Name.length; i++) {

      Translation translation = await translator.translate(Name[i].toString(),
          to: currentLocale.languageCode.toString());


      product.add(Product(
        sku:i.toString(),
          Usename:translation.text.toString(),
          Userage:Age[i].toString() ,
        MonthlyTerm:Age[i].toString() ,
        QuvatalyTerm:translation.text.toString() ,
        Termvalue:Age[i].toString() ,
        YearlyTerm:Age[i].toString() ,
        HalflyTerm:translation.text.toString()
       ));
    }


    sharePdf(product);

    await clearallcontrollers();

  }

  sharePdf(product) async {

    final pdf = pw.Document();

    const tableHeaders = [
      'Si.NO',
      'Name',
      'Price',
      'Quantity',
      'Total',
      'Total2',
    ];

    pdf.addPage(
      pw.Page(
          build: (pw.Context context) {
            return

              pw.Container(

                child: pw.TableHelper.fromTextArray(
                  headers: List<String>.generate(tableHeaders.length,
                        (col) => tableHeaders[col],
                  ),
                  border: null,
                  cellAlignment: pw.Alignment.centerLeft,
                  headerDecoration: const pw.BoxDecoration(
                    borderRadius: pw.BorderRadius.all(pw.Radius.circular(2)),
                  ),
                  data: List<List<String>>.generate(product.length, (row) =>
                  List<String>.generate(
                    tableHeaders.length, (col) => product[row].getIndex(col),),
                  ),
                )
            );
          }
      ),
    );


    final directory = await getExternalStorageDirectory();
    final file = File("${directory?.path}/FinalPDf.pdf");

    final pdfBytes = await pdf.save();
    await file.writeAsBytes(pdfBytes.toList());

    await Share.shareFiles([(file.path)]);

  }


  ///controller clear function

  clearallcontrollers(){
    Namecon .clear();
   Agecon .clear();
   Assumedcon.clear();
   Teamcon .clear();
   Bounuscon .clear();

}


  Userdata()async{
    var User=await FirebaseFirestore.instance.collection("Users").doc(userid).get();
    Map<String,dynamic>?values=User.data();
    setState(() {
      Username=values!['Name'];
    });




  }


}


class Product {



  const Product({
    this.sku,
    this.Usename,
    this.Userage,
    this.YearlyTerm,
    this.HalflyTerm,
    this.QuvatalyTerm,
    this.MonthlyTerm,
    this.Termvalue,
  }
      );


  final String ?sku;
  final String ?Usename;
  final String ?Termvalue;
  final String ?Userage;
  final String ?YearlyTerm;
  final String ?HalflyTerm;
  final String ?QuvatalyTerm;
  final String ?MonthlyTerm;

 getIndex(int index) {
    switch (index) {
      case 0:
        return sku;
      case 1:
        return YearlyTerm;
      case 2:
        return HalflyTerm;
      case 3:
        return QuvatalyTerm;
      case 4:
        return MonthlyTerm;
      case 5:
        return Termvalue;

    }
    return '';
  }

}



