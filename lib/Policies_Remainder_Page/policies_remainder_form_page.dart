import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../Translator_Module/Translator_Module_Page.dart';

class policies_remainder_form_page extends StatefulWidget {
  const policies_remainder_form_page({Key? key}) : super(key: key);

  @override
  State<policies_remainder_form_page> createState() => _policies_remainder_form_pageState();
}

class _policies_remainder_form_pageState extends State<policies_remainder_form_page> {


  TextEditingController Namecon = TextEditingController();
  TextEditingController Agecon = TextEditingController();
  TextEditingController Assumedcon = TextEditingController();
  TextEditingController Teamcon = TextEditingController();
  TextEditingController Bounuscon = TextEditingController();

  final Formkey=GlobalKey<FormState>();

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
          Column(
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
                                    string = _formatNumber(string.replaceAll(',', ''));
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
            ],
          ),
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
    FirebaseFirestore.instance.collection("Policies_remainder").doc().set({
      "plname":Namecon.text,
      "plage":Agecon.text,
      "plassumed_sum":Assumedcon.text,
      "plterm":Teamcon.text,
      "plbounus":Bounuscon.text,
    });
    clearallcontrollers();
    Navigator.pop(context);
  }

  ///controller clear function

  clearallcontrollers(){
    Namecon .clear();
    Agecon .clear();
    Assumedcon.clear();
    Teamcon .clear();
    Bounuscon .clear();

  }



}
