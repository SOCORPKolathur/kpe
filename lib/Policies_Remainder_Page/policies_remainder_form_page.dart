import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../Translator_Module/Translator_Module_Page.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import "package:http/http.dart" as http;

class policies_remainder_form_page extends StatefulWidget {
  String?Token;
   policies_remainder_form_page({this.Token});

  @override
  State<policies_remainder_form_page> createState() => _policies_remainder_form_pageState();
}

class _policies_remainder_form_pageState extends State<policies_remainder_form_page> {


  TextEditingController Namecon = TextEditingController();
  TextEditingController Agecon = TextEditingController();
  TextEditingController Phonecon = TextEditingController();
  TextEditingController Premiumcon = TextEditingController();
  TextEditingController Termscon = TextEditingController();
  TextEditingController PremiumTypecon = TextEditingController(text:"Select");
  TextEditingController Datecon = TextEditingController();

  List<String> PlanTypelist=["Select","Yearly","Halfly","Quarterly","Monthly"];
  final Formkey=GlobalKey<FormState>();


  List selectedData=[];

  DateTime? pickedDataValue;

  static const _locale = 'en';
  String _formatNumber(String s) => NumberFormat.decimalPattern(_locale).format(int.parse(s));
  String get _currency => NumberFormat.compactSimpleCurrency(locale: _locale).currencySymbol;

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
                child: FittedBox(
                  alignment: Alignment.centerLeft,
                  fit: BoxFit.contain,
                  child: KText(
                    text: 'Policies Remainder',
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
      body:
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.center,
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
                      height: height / 1.7,
                      width: width / 1.15,
                      decoration: BoxDecoration(
                          color: const Color(0xffffffff),
                          border: Border.all(color: const Color(0xff0C9346)),
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          ///Name controller and text
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
                              height: height / 20.3,
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

                          ///Age controller and text
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
                              height: height / 20.3,
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

                          ///phone number controller

                          Padding(
                            padding: EdgeInsets.only(
                                top: height / 37.95, right: width / 2.30),
                            child: FittedBox(
                              fit: BoxFit.contain,
                              alignment: Alignment.center,
                              child: KText(
                                text: 'Phone Number',
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
                              height: height / 20.3,
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
                                    maxLength: 10,
                                    controller: Phonecon,
                                    keyboardType: TextInputType.number,
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        fontSize: width / 22.402,
                                        color: Colors.black),
                                    decoration:
                                    InputDecoration(border: InputBorder.none,
                                        counterText: "",
                                        contentPadding: EdgeInsets.only(
                                          left: width / 41.143,
                                          bottom: height / 150.187,)
                                    ),

                                    validator: (value){
                                      if(value!.isEmpty){
                                        return "Field is Empty";

                                      }
                                      else if(value.isNotEmpty){
                                        if(value.length!=10){
                                          return "Please Fill the Phone Number Correctly";
                                        }
                                      }
                                    }
                                  )),
                            ),
                          ),

                          ///Premium Text and controller
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    top: height / 50.6, left: width/12),
                                child: FittedBox(
                                  alignment: Alignment.centerLeft,
                                  fit: BoxFit.contain,
                                  child: KText(
                                    text: 'Premium',
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w600,
                                        fontSize: width / 29.387,
                                        color: const Color(0xff000000)),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: height / 50.6, left: width/5.2),
                                child: FittedBox(
                                  alignment: Alignment.centerLeft,
                                  fit: BoxFit.contain,
                                  child: KText(
                                    text: 'Terms',
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w600,
                                        fontSize: width / 29.387,
                                        color: const Color(0xff000000)),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    right: width / 39.2, top: height / 75.9),
                                child: Container(
                                  height: height / 20.3,
                                  width: width / 2.9,
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
                                        controller: Premiumcon,
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
                              Padding(
                                padding: EdgeInsets.only(
                                    right: width / 39.2, top: height / 75.9),
                                child: Container(
                                  height: height / 20.3,
                                  width: width / 2.9,
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
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                                        ],
                                        controller: Termscon,
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
                            ],
                          ),

                          ///Premium type and Date controller
                          Row(
                            children: [

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 35,
                                        top: height / 50.6),
                                    child: KText(
                                      text: 'Premium Type',
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
                                      height: height / 20.3,
                                      width: width / 3.92,
                                      decoration: BoxDecoration(
                                        color: const Color(0xffffffff),
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          color: const Color(0xffD1CDCD),
                                        ),
                                      ),
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButtonFormField2<String>(
                                          isExpanded: true,
                                          isDense:true,
                                          hint: KText(
                                              text:'Select',
                                            style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black),
                                          ),
                                          items: PlanTypelist.map((String item) => DropdownMenuItem<String>(
                                            value: item,
                                            child: KText(
                                                text: item,
                                              style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: width / 32.402,
                                                  color: Colors.black),
                                            ),
                                          )).toList(),
                                          value: PremiumTypecon.text,
                                          onChanged: (String? value) {
                                            setState(() {
                                              PremiumTypecon.text = value!;
                                            });
                                          },
                                          buttonStyleData:  ButtonStyleData(
                                          ),decoration: InputDecoration(
                                            border: InputBorder.none
                                        ),

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
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: width / 10,top: height / 50.6),
                                          child: KText(
                                            text: 'Date',
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
                                            height: height / 20.3,
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
                                                    left: width / 100.66,right:width / 100.66 ),
                                                child: TextFormField(
                                                  readOnly: true,
                                                  controller: Datecon,
                                                  style: GoogleFonts.poppins(
                                                      fontWeight: FontWeight.w500,
                                                      fontSize: width / 32.402,
                                                      color: Colors.black),
                                                  decoration: InputDecoration(
                                                      counterText: "",
                                                      border: InputBorder.none,
                                                      contentPadding: EdgeInsets
                                                          .only(
                                                        left: width / 41.143,
                                                        bottom: height / 150.187,)
                                                  ),
                                                  onTap: ()async{
                                                    DateTime? pickedDate = await showDatePicker(
                                                        context: context,
                                                        firstDate: DateTime(1950),
                                                        lastDate: DateTime(2050),
                                                        initialDate: DateTime.now(),
                                                        fieldHintText: "enter your date of birthday"
                                                    );
                                                    if (pickedDate != null) {
                                                      String formattedDate = DateFormat('d-M-yyyy').format(pickedDate);
                                                      pickedDataValue=pickedDate;
                                                      Datecon.text =formattedDate;

                                                      print("Pcked Date+++++++++++++++++++++++++++++++++++++");
                                                      print(pickedDataValue);

                                                    }

                                                  },
                                                  validator: (value) => value!.isEmpty
                                                      ? "Field Can't Empty" : null,
                                                )
                                            ),
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
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar:
      ///Submit  And  Pdf container
      Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () async {
                if (Formkey.currentState!.validate()) {
                  documentcreatefunc();
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
                Navigator.pop(context);
              },
              child: Container(
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
                          text: "Cancel",
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
      ),
    );
  }

  documentcreatefunc(){
   print("Submited Function++++++++++++++++++++++++++++++++++++++++++++++++");
    setState(() {
      selectedData.clear();
    });
    var temp;
    if(PremiumTypecon.text=="Yearly"){
      for(int i=0;i<int.parse(Termscon.text.toString());i++){
       temp=DateTime(pickedDataValue!.year+i,pickedDataValue!.month,pickedDataValue!.day,);

       print("Year +++++++++++++++++++++++++++++++++++++++++++++++++");
       print(temp);
       print("value==================================================");
       String formattedDate = DateFormat('d-M-yyyy').format(temp);
       print("Formateddddddddddddddddddddddd");
       print(formattedDate);
       selectedData.add(formattedDate);
      }
      print(selectedData);
    }
    else if(PremiumTypecon.text=="Halfly"){
      for(int i=0;i<int.parse(Termscon.text.toString())*2;i++){
        temp=DateTime(pickedDataValue!.year,pickedDataValue!.month+(6*i),pickedDataValue!.day);
        String formattedDate = DateFormat('d-M-yyyy').format(temp);
        selectedData.add(formattedDate);
      }
      print(selectedData);
    }
    else if(PremiumTypecon.text=="Quarterly"){
      for(int i=0;i<int.parse(Termscon.text.toString())*4;i++){
        temp=DateTime(pickedDataValue!.year,pickedDataValue!.month+(4*i),pickedDataValue!.day,);
        String formattedDate = DateFormat('d-M-yyyy').format(temp);
        selectedData.add(formattedDate);
      }
      print(selectedData);
    }
    else if(PremiumTypecon.text=="Monthly"){
      for(int i=0;i<int.parse(Termscon.text.toString());i++){
        temp=DateTime(pickedDataValue!.year,pickedDataValue!.month+1,pickedDataValue!.day,);
        String formattedDate = DateFormat('d-M-yyyy').format(temp);
        selectedData.add(formattedDate);
      }
      print(selectedData);
    }

    print("Final DatE Lists");
    print(selectedData);
    print("Final DatE Lists+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
    FirebaseFirestore.instance.collection("Policies_remainder").doc().set({
      "plname":Namecon.text,
      "plage":Agecon.text,
      "plphone":Phonecon.text,
      "plPremium":Premiumcon.text,
      "pltype":PremiumTypecon.text,
      "plDate":Datecon.text,
      "Terms":Termscon.text,
      "FcmToken":widget.Token.toString(),
      "Date":"${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
      "Due Date":selectedData,
      'timestamp':DateTime.now().millisecondsSinceEpoch
    });
    FirebaseFirestore.instance.collection("Users").doc(FirebaseAuth.instance.currentUser!.uid.toString()).collection("Policies_remainder").doc().set({
     "plname":Namecon.text,
     "plage":Agecon.text,
     "plphone":Phonecon.text,
     "plPremium":Premiumcon.text,
     "pltype":PremiumTypecon.text,
     "plDate":Datecon.text,
     "Terms":Termscon.text,
     "FcmToken":widget.Token.toString(),
     "Date":"${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
     "Due Date":selectedData,
     'timestamp':DateTime.now().millisecondsSinceEpoch
   });
    clearallcontrollers();
    Navigator.pop(context);

  }

  ///controller clear function

  clearallcontrollers(){
    Namecon .clear();
    Agecon .clear();
    Phonecon .clear();
    Premiumcon.clear();
    PremiumTypecon .clear();
    Datecon .clear();
    Termscon .clear();

  }



  Future<bool> sendPushMessagefirebase(String token, String body, String title) async {
    bool isSended = false;
    try {
      var response = await http.post(
        Uri.parse('https://fcm.googleapis.com/fcm/send'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization':
          'key=AAAAsjkTLd4:AAAA-Y97X3I:APA91bGTXqDGT_wsoVv9aFmxMmRwuA-WVBakP5mbugEiVh2rqrb3rv7aWj72brel_V1PjBnpv-P_3iCciWzNxMJhvNI1lZXsW31AccVRAY4U2caF_uyz-ABQTLMJ7vih8H0Orkd86e10',
        },
        body: jsonEncode(
          <String, dynamic>{
            'notification': <String, dynamic>{'body': body, 'title': title},
            'priority': 'high',
            'data': <String, dynamic>{
              'click_action': 'FLUTTER_NOTIFICATION_CLICK',
              'id': '1',
              'status': 'done'
            },
            "to": token,
          },
        ),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        isSended = true;
      } else {
        isSended = false;
      }
    } catch (e) {
    }
    return isSended;
  }

}
