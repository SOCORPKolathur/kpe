


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import '../Translator_Module/Translator_Module_Page.dart';
import '../const File Page.dart';
import 'SetProfile_Page.dart';

class OTPScreen extends StatefulWidget {
  String phone;
   OTPScreen(this.phone);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  OtpFieldController otpController = OtpFieldController();


  @override
  void initState() {
    // TODO: implement initState
    _verifyphone();
    super.initState();
  }
  var _verificationCode;
  bool verfiyedClicked=false;

  _verifyphone()async{
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: "+91${widget.phone}" ,
        verificationCompleted:(PhoneAuthCredential credential)async{
          await FirebaseAuth.instance.signInWithCredential(credential).then((value)async{
            if(value.user!=null){
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context)=>  SetProfile_Page(UserDocid:value.user!.uid.toString(),UserPhoneNumber: widget.phone,)));
            }
          });
        },
        verificationFailed:(FirebaseAuthException e){

        } ,
        codeSent:(String ?verificationid ,int ?resendtoken ){
          setState(() {
            _verificationCode=verificationid;
          });
        },
        codeAutoRetrievalTimeout:( String verificationid){
          setState(() {
            _verificationCode=verificationid;
          });
        },timeout: const Duration(seconds: 120) );

    //location  function
    //check();

  }


  String PinValue='';

  ///user collection create function

   userdata() async {
     String? token = await FirebaseMessaging.instance.getToken();
   FirebaseFirestore.instance.collection("Users").doc(FirebaseAuth.instance.currentUser!.uid).set({
     "Phone":widget.phone,
     "Name":"",
     "Email":"",
     "fcm_token":token,
     "userid":FirebaseAuth.instance.currentUser!.uid,
     "Img":"",
     "companyName":"",
     "companyType":"",
     "timestamp":DateTime.now().millisecondsSinceEpoch,
     "date":"${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}"
   });
     setState(() {
       verfiyedClicked=false;
     });

 }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [

          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding:
                  EdgeInsets.only(left: width / 19.6, top: height/10.74),
                  child: Lottie.asset(OtpwaitingLottie),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: height / 80.10),
                  child:  KText(
                      text:'An OTP has been sent to your phone \n +91 ${widget.phone}',
                      align: TextAlign.center,
                      style:const TextStyle(
                          fontFamily: "Davish",
                          fontWeight: FontWeight.w500,
                          fontSize: 30
                      ),

                    // color: Color(0xff000000)
                  ),
                ),
                const KText(

                  text:"Enter the OTP", style:TextStyle(
                     fontFamily: "Davish",
                     fontWeight: FontWeight.w400,
                     fontSize: 25
                 ),),
                 SizedBox(height:height/43.828),
                OTPTextField(
                    controller: otpController,
                    length: 6,
                    width: MediaQuery.of(context).size.width,
                    textFieldAlignment: MainAxisAlignment.spaceAround,
                    fieldWidth: width/9.142,
                    fieldStyle: FieldStyle.box,
                    outlineBorderRadius: 15,
                    otpFieldStyle: OtpFieldStyle(
                      enabledBorderColor: const Color(0xff0A904C),
                      borderColor: const Color(0xff0A904C),
                      focusBorderColor: const Color(0xff0A904C),

                    ),

                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                        fontSize: 17),
                    onChanged: (pin) {
                    },
                    onCompleted: (pin) {
                      setState(() {
                        PinValue=pin;
                      });
                        try{
                          FirebaseAuth.instance.signInWithCredential(
                              PhoneAuthProvider.credential(
                                  verificationId:_verificationCode ,
                                  smsCode: pin)).then((value){
                            if(value.user!=null){
                              userdata();
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(builder: (context)=>  SetProfile_Page(UserDocid:value.user!.uid.toString(),UserPhoneNumber: widget.phone)));
                            }
                          });
                        }
                        catch(e){
                      }
                    },
                ),




                SizedBox(height:height/43.828),
                Padding(
                  padding: EdgeInsets.only(
                      top: height / 37.95, left: width / 19.6),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        verfiyedClicked=true;
                      });
                      try{
                        FirebaseAuth.instance.signInWithCredential(
                            PhoneAuthProvider.credential(
                                verificationId:_verificationCode ,
                                smsCode:PinValue)).then((value) async {
                          if(value.user!=null){
                            userdata();
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>  SetProfile_Page(UserDocid:value.user!.uid.toString(),UserPhoneNumber: widget.phone)));
                          }
                        });
                      }
                      catch(e){
                      }

                    },
                    child: Padding(
                      padding: EdgeInsets.only(top:height/30.36),
                      child:
                      Container(
                        height: height / 13.97,
                        width: width / 1.91,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Color(0xff0A904C), Color(0xff018266)],
                          ),
                        ),
                        child:  const Center(
                          child: KText(
                            text:"Verify",
                            style: TextStyle(
                              fontSize: 28,
                              letterSpacing: 1.0,
                              fontFamily: "Davish",
                              fontWeight: FontWeight.w600,
                              color: Color(0xffffffff),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),

         verfiyedClicked?Material(
           elevation: 10,
         color: Colors.white,
         shadowColor: Colors.black12,
         borderRadius: BorderRadius.circular(8),
           child: Container(
              height: height/4.2,
              width: width/2,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8)
              ),
              child: Column(
                children: [
                  Lottie.asset(LoadingLottie,height: height/5.4,width: width/2.571),
                  KText(
                    text:'Please Wait...',
                    align: TextAlign.center,
                    style: TextStyle(
                        fontFamily: "Davish",
                        fontWeight: FontWeight.w500,
                        fontSize: width/18
                    ),

                    // color: Color(0xff000000)
                  ),
                ],
              ),

            ),
         ):const SizedBox(),

        ],
      ),
    );
  }
}