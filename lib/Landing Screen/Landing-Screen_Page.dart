
import 'package:fancy_flutter_dialog/fancy_flutter_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kpe/Agent_Training_Page/Agent_Training_Page.dart';
import 'package:kpe/Marketing_Flyers_Page/marketing.dart';
import 'package:kpe/Policies_Remainder_Page/Policies_Remainder_Page.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Calculator_Page/Calculator_Page.dart';
import '../Marketing_Videos_Page/Marketing_Videos_Page.dart';
import '../Plan_Comb_Page/Plan_Comb_Page.dart';
import '../Plan_Compare_Page/Plan_Compare_Page.dart';
import '../Plan_Details_Page/Plan_Details_Page.dart';
import '../Polices_Form_Page/Polices_Form_Page.dart';
import '../Premium_Plan_Page/premium.dart';
import '../Profile_Page/Profile_Page.dart';
import '../Setting_Page/Setting_Page.dart';
import '../Translator_Module/Translator_Module_Page.dart';
import '../const File Page.dart';
import '../slider.dart';

class firstpage extends StatefulWidget {
  const firstpage({super.key});

  @override
  State<firstpage> createState() => _firstpageState();
}

class _firstpageState extends State<firstpage> {


  @override
  Widget build(BuildContext context) {
    var localizationDelegate = LocalizedApp.of(context).delegate;
    Locale currentLocale = localizationDelegate.currentLocale;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffF5F5F5),
        elevation: 0,
        title: Row(

          children: [
             Padding(
              padding:  EdgeInsets.only(left: width/102.857),
              child: SizedBox(
                width:width/1.418,
                child: Text(
                  'KALPANA ENTERPRISES',
                  style: TextStyle(
                      fontFamily: "Davish",
                      color: Colors.white,
                      fontSize: width/13.714,
                      letterSpacing: 0.3
                  ),
                ),
              ),
            ),
            SizedBox(width:width/8.228),

            GestureDetector(
              onTap:(){


                // Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeftJoined, ctx: context,
                //     alignment: Alignment.center,
                //     duration: Duration(seconds: 2),
                //     childCurrent:Container() ,
                //     curve: Curves.fastLinearToSlowEaseIn,
                //     child: Profile_Page()));
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Profile_Page(),));

              },
              child: Container(
                height: height / 24.3,
                width: width / 12.06,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(width / 12.06),
                  border: Border.all(color: const Color(0xffCFE8FF)),
                ),
                child: Image.asset("assets/pic.png"),
              ),
            ),
          ],
        ),
        automaticallyImplyLeading: false,
        toolbarHeight: height / 9.59,
        flexibleSpace: Container(
          height: height / 7.09,
          width: width / 3.92,
          decoration:  const BoxDecoration(
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
        foregroundColor: Colors.black,
      ),

      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics:const  BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Padding(
              padding: EdgeInsets.only(left: width / 26.1,
                  top: height / 25.95,bottom: height / 45.95),
              child: FittedBox(
                child: KText(
                 text: 'Latest Updates',
                  style: GoogleFonts.amaranth(
                      fontWeight: FontWeight.w500,
                      fontSize: width/15.824,
                      color: const Color(0xff000000)),
                ),
              ),
            ),

            SizedBox(
              height: height/4.283,
              width: double.infinity,
              child: BannerSlider(),
            ),

            Padding(
              padding:
              EdgeInsets.only(top: height / 127.95, left:
              width / 26.1,bottom: height/32.95),
              child: FittedBox(
                child: KText(
                  text:greeting().toString(),
                  style: GoogleFonts.amaranth(
                      fontWeight: FontWeight.w500,
                      fontSize: width/15.824,
                      color: const Color(0xff000000)),
                ),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                GestureDetector(
                  onTap: (){
                    mainTainsPopup();
                   // Navigator.push(context, MaterialPageRoute(builder: (context) => const plans(),));

                  },
                  child: Material(
                    elevation: 3,
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      height:height/8.62,
                      width:width/2.20 ,
                      decoration: BoxDecoration(
                          color: const Color(0xffE1F1FF),
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: width / 39.2),
                            child:  FittedBox(
                              fit: BoxFit.cover,
                              child: SizedBox(

                                width:width/4.0,
                                height: height/12.062,
                                child: const FittedBox(
                                  fit: BoxFit.contain,
                                  alignment: Alignment.centerLeft,
                                  child: KText(
                                    text: 'Premium\nPlans',
                                    style:TextStyle(
                                        fontFamily: "Davish",
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff3F7AFC)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                              height: height / 7.8,
                              width: width / 6.97,
                              child: Image.asset("assets/check.png")),
                        ],
                      ),
                    ),
                  ),
                ),

                GestureDetector(
                  onTap: (){
                    mainTainsPopup();
                    //Navigator.push(context, MaterialPageRoute(builder: (context) => const Plan_Details_Page(),));
                  },
                  child: Material(
                    elevation: 3,
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      height:height/8.62,
                      width:width/2.20 ,
                      decoration: BoxDecoration(
                          color: const Color(0xffD1F3E0),
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: width / 39.2),
                            child:  SizedBox(
                              width:width/4.0,
                              height: height/12.062,
                              child: const FittedBox(
                                alignment: Alignment.centerLeft,
                                fit: BoxFit.contain,
                                child: KText(
                                  text:'Plan\nDetails',
                                  style: TextStyle
                                    (
                                      fontFamily: "Davish",
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff3CB878)),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding:  EdgeInsets.only(left:width/51.428),
                            child: SizedBox(
                                height: height / 6.8,
                                width: width / 7.97,
                                child: Image.asset("assets/tick.png")),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: height/54.704,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

              children: [

                GestureDetector(
                  onTap: (){
                    mainTainsPopup();
                   // Navigator.push(context,MaterialPageRoute(builder: (context) =>const Plan_Comb_Page(),));
                  },
                  child: Material(
                    elevation: 3,
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      height:height/8.62,
                      width:width/2.20 ,
                      decoration: BoxDecoration(
                          color: const Color(0xffFFFF2D8),
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: width / 39.2),
                            child:  SizedBox(
                              width:width/4.0,
                              height: height/12.062,
                              child: const FittedBox(
                                fit: BoxFit.contain,
                                alignment: Alignment.centerLeft,
                                child: KText(
                                  text: 'Plan\nCombs',
                                  style: TextStyle(
                                      fontFamily: "Davish",
                                      fontWeight: FontWeight.w500,

                                      color: Color(0xffFFA104)),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding:  EdgeInsets.only(left:width/51.428),
                            child: SizedBox(
                                height: height / 7.52,
                                width: width / 9.27,
                                child: Image.asset("assets/build.png")),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                GestureDetector(
                  onTap: (){
                    mainTainsPopup();
                    //Navigator.push(context, MaterialPageRoute(builder: (context) =>const Plan_Compare_Page() ,));
                  },
                  child: Material(
                    elevation: 3,
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      height:height/8.62,
                      width:width/2.20 ,
                      decoration: BoxDecoration(
                          color: const Color(0xffE6D1F3),
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: width / 39.2),
                            child:  SizedBox(
                              width:width/4.0,
                              height: height/12.062,
                              child: const FittedBox(
                                alignment: Alignment.centerLeft,
                                fit: BoxFit.contain,
                                child: KText(
                                  text: 'Plan\nCompare',
                                  style: TextStyle(
                                      fontFamily: "Davish",
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff8B1ECD)),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding:  EdgeInsets.only(left:width/51.428),
                            child: SizedBox(
                                height: height / 17.97,
                                width: width / 8.8,
                                child: Image.asset("assets/file.png")),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: height/54.704,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

              children: [

                GestureDetector(
                  onTap: (){

                    Navigator.push(context, MaterialPageRoute(builder: (context) => const marketing(),));

                  },
                  child: Material(
                    elevation: 3,
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      height:height/8.62,
                      width:width/2.20 ,
                      decoration: BoxDecoration(
                          color: const Color(0xffC5FFF8),
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: width / 39.2),
                            child:  SizedBox(
                              width:width/4.0,
                              height: height/12.062,
                              child: const FittedBox(
                                fit: BoxFit.contain,
                                alignment: Alignment.centerLeft,
                                child: KText(
                                  text: 'Marketing\nFlyers',
                                  style: TextStyle(
                                      fontFamily: "Davish",
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff0B8D7E)),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding:  EdgeInsets.only(left:width/51.428),
                            child: SizedBox(
                                height: height / 18.97,
                                width: width / 9.8,
                                child: Image.asset("assets/sound.png")),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const Marketing_Videos_Page(),));
                  },
                  child: Material(
                    elevation: 3,
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      height:height/8.62,
                      width:width/2.20 ,
                      decoration: BoxDecoration(
                          color: const Color(0xffFFF495),
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: width / 35.2),
                            child:  SizedBox(
                              width:width/4.0,
                              height: height/12.062,
                              child: const FittedBox(
                                alignment: Alignment.centerLeft,
                                fit: BoxFit.contain,
                                child: KText(
                                  text:'Marketing\nVideos',
                                  style: TextStyle(
                                      fontFamily: "Davish",
                                      fontWeight: FontWeight.w500,

                                      color: Color(0xffD29E00)),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding:  EdgeInsets.only(left:width/51.428),
                            child: SizedBox(
                                height: height / 16.97,
                                width: width / 9.6,
                                child: Image.asset("assets/youtube.png",fit:
                                BoxFit.cover,)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: height/54.704,),

            Padding(
              padding:
              EdgeInsets.only(left: width / 26.1, top: height / 39.95),
              child: SizedBox(
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: KText(
                   text:'Agent Trainings',
                    style: GoogleFonts.amaranth(
                        fontWeight: FontWeight.w500,
                        fontSize: width/15.824,
                        color: const Color(0xff000000)),
                  ),
                ),
              ),
            ),

            SizedBox(height: height/82.057,),

            SizedBox(
              height: height/6.564,
              width: double.infinity,
              child: const Banner2(),
            ),

            ///Agent Utilities
            Padding(
              padding:
              EdgeInsets.only(left: width / 26.1, top: height / 36.95),
              child: KText(
               text: 'Agent Utilities',
                style: GoogleFonts.amaranth(
                    fontWeight: FontWeight.w500,
                    fontSize: width/15.824,
                    color: const Color(0xff000000)),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(left: width / 26.13, top: height/41.028),
              child: Material(
                borderRadius: BorderRadius.circular(10),
                color:  Colors.white,
                shadowColor: Colors.black12,
                elevation: 80,
                child: Container(
                  height: height / 2.53,
                  width: width / 1.09,
                  decoration: BoxDecoration(
                      color:  Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      SizedBox(height: height/71.028,),

                      Row(

                        children: [
                          SizedBox(width: width/30.714,),

                          ///polices Container
                          GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const Polices_Form_Page(),));
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                    height: height / 14.88,
                                    width: width / 7.68,
                                    child: Image.asset("assets/notes.png")),
                                SizedBox(height: height/164.114,),

                                SizedBox(

                                  width:width/3.8,
                                  height: height/25.062,
                                  child: FittedBox(
                                    alignment: Alignment.center,
                                    fit: BoxFit.contain,
                                    child: KText(
                                      text:'Polices\nForms',
                                      align: TextAlign.center,
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w600,
                                          color: const Color(0xff000000),
                                      textStyle: const TextStyle(overflow: TextOverflow.ellipsis)
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: width/16.714,),

                          ///other Calculator
                          GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) =>const  Calculator_Page(),));

                            },
                            child: Column(
                              children: [
                                SizedBox(
                                    height: height / 14.88,
                                    width: width / 7.68,
                                    child: Image.asset("assets/cal.png")),
                                SizedBox(height: height/164.114,),

                                SizedBox(

                                  width:width/3.8,
                                  height: height/25.062,
                                  child: FittedBox(
                                    fit: BoxFit.contain,
                                    alignment: Alignment.center,
                                    child: KText(
                                      text:'Other\nCalculators',
                                      align: TextAlign.center,
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w600,
                                          color: const Color(0xff000000),

                                          textStyle: const TextStyle(overflow: TextOverflow.ellipsis)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: width/46.714,),

                          ///agent Training
                          GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) =>const Agent_Training_Page(),));
                            },
                            child: Column(
                              children: [
                                SizedBox(
                                    height: height / 14.88,
                                    width: width / 7.68,
                                    child: Image.asset("assets/tube.png")),
                                SizedBox(height: height/164.114,),

                                SizedBox(
                                  width:width/3.8,
                                  height: height/25.062,
                                  child: FittedBox(
                                    alignment: Alignment.center,
                                    fit: BoxFit.contain,
                                    child: KText(
                                     text: 'Agent\nTraining',
                                      align: TextAlign.center,
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w600,
                                          color: const Color(0xff000000),
                                          textStyle: const TextStyle(overflow: TextOverflow.ellipsis)
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: height/71.028,),
                      Row(

                        children: [

                          SizedBox(width: width/10.714,),
                          ///share
                          GestureDetector(
                            onTap: (){
                              Share.share("Hello");
                            },
                            child: Column(
                              children: [
                                SizedBox(
                                    height: height / 14.88,
                                    width: width / 7.68,
                                    child: Image.asset("assets/share.png")),
                                SizedBox(height: height/164.114,),

                                SizedBox(
                                  width:width/11.0,
                                  height: height/35.062,
                                  child: FittedBox(
                                    fit: BoxFit.contain,
                                    alignment: Alignment.center,
                                    child: KText(
                                     text: 'Share',
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w600,
                                          color: const Color(0xff000000)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: width/7.714,),

                          ///policies remainder
                          GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const Policies_Remainder_Page(),));
                            },
                            child: Column(
                              children: [
                                SizedBox(
                                    height: height / 14.88,
                                    width: width / 7.68,
                                    child: Image.asset("assets/clock.png")),

                                SizedBox(height: height/164.114,),
                                SizedBox(
                                  width:width/3.8,
                                  height: height/25.062,
                                  child: FittedBox(
                                    alignment: Alignment.center,
                                    fit: BoxFit.contain,
                                    child: KText(
                                      text:'Policy\nRemainder',
                                      align: TextAlign.center,
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w600,
                                          color: const Color(0xff000000)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: width/14.714,),

                          ///setting
                          GestureDetector(
                            onTap: (){
                              Navigator.push(context,MaterialPageRoute(builder: (context) => const Setting_Page(),));
                            },
                            child: Column(
                              children: [
                                SizedBox(
                                    height: height / 14.88,
                                    width: width / 7.68,
                                    child: Image.asset("assets/settings.png")),
                                SizedBox(height: height/164.114,),
                                SizedBox(

                                  width: currentLocale.languageCode == "en"?  width/6.9 : width/5.0,
                                  height: height/35.062,
                                  child: FittedBox(
                                    fit: BoxFit.contain,
                                    alignment: Alignment.center,
                                    child: KText(
                                      text:'Settings',
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w600,
                                          color: const Color(0xff000000)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: height/71.028,),
                      Row(

                        children: [
                          SizedBox(width: width/13.714,),
                          ///contact us
                          GestureDetector(
                            onTap: (){
                              launch("tel:‎+91 1234567890");
                            },
                            child: Column(
                              children: [
                                SizedBox(
                                    height: height / 14.88,
                                    width: width / 7.68,
                                    child: Image.asset("assets/phone.png")),

                                SizedBox(height: height/164.114,),
                                SizedBox(
                                  width:width/6.0,
                                  height: height/25.062,
                                  child: FittedBox(
                                    alignment: Alignment.center,
                                    fit: BoxFit.contain,
                                    child: KText(
                                      text:'Contact\nUs',
                                      align: TextAlign.center,
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w600,

                                          color: const Color(0xff000000)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(width: width/6.9,),
                          /// log out
                          GestureDetector(

                           onTap: (){
                             print(currentLocale.languageCode);
                             siginoutpopup();
                           },
                            child: Column(
                              children: [
                                SizedBox(
                                    height: height / 14.88,
                                    width: width / 7.68,
                                    child: Image.asset("assets/onn.png")),
                                SizedBox(height: height/164.114,),
                                SizedBox(
                                  width: currentLocale.languageCode == "en"?  width/6.9 :  width/5.5,

                                  height: height/25.062,
                                  child: FittedBox(
                                    fit: BoxFit.contain,
                                    alignment: Alignment.center,
                                    child: KText(
                                      text:'Log out',
                                      align:TextAlign.center ,
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w600,
                                          color: const Color(0xff000000)),
                                    ),
                                  ),
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
            SizedBox(height: height/41.028,)

          ],
        ),
      ),
    );
  }


/// SignOut Popup

  Future<void> siginoutpopup() async {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return showDialog<void>(
      context: context,

      builder: (BuildContext context) {
        return AlertDialog(
          title: KText(
            text:"Are Your Want To Logout",
            align:  TextAlign.center,
            style: GoogleFonts.poppins(
              color: Colors.black,
              fontWeight: FontWeight.w800,
              fontSize: width / 20,
            ),
          ),
          content: SizedBox(
            height: height / 7.56,
            child: Column(
              children: [
                SizedBox(height: height/14.609,),
                Padding(
                  padding: EdgeInsets.only(left: width / 45),
                  child: GestureDetector(
                    onTap: (){
                      FirebaseAuth.instance.signOut();
                    },
                    child: Container(

                      height: height/17.531,
                      width: width/4.1143,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: const Color(0xff0C9346),
                      ),
                      child: Center(
                        child: KText(
                          text: "Yes",
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: width / 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          alignment: Alignment.center,
          actionsAlignment: MainAxisAlignment.center,
          titlePadding: EdgeInsets.symmetric(
              horizontal: width / 45, vertical: height / 94.5),
        );
      },
    );
  }

  String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning';
    }
    if (hour < 17) {
      return 'Good Afternoon';
    }
    return 'Good Evening';
  }

  ///maintence Popup


 mainTainsPopup(){
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return  AlertDialog(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Plans Are Under Updation",style: GoogleFonts.amaranth(
                    fontWeight: FontWeight.w500,
                    fontSize: width/20.824,
                    color: const Color(0xff000000)),),
              ],
            ),
            content: SizedBox(
              height: height/4.2,
              child: Column(
                children: [
                  SizedBox(height: height/5.8153,width: width/2.769,child: Lottie.asset(MainatainceLottie),),
                  SizedBox(height: height/50.4,),
                  Text("Will Notify You Once Available",style: GoogleFonts.amaranth(
                      fontWeight: FontWeight.w500,
                      fontSize: width/23.824,
                      color: const Color(0xff000000)),)
                ],
              ),
            ),
            actions: [
              GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Container(
                  height: height/21.6,
                  width: width/4,
                  decoration: BoxDecoration(
                    color: Color(0xff0C9346),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Center(
                    child: Text("Okay",style: GoogleFonts.amaranth(
                        fontWeight: FontWeight.w500,
                        fontSize: width/25.824,
                        color: const Color(0xffFFFFFF)),),
                  ),
                ),
              ),
            ],
          );



          //
          //   FancyAlertDialog(
          //   title: "Plans Are Under Updation",
          //   backgroundColor: Colors.white,
          //   message: "Will Notify You Once Available",
          //   negativeBtnText: "",
          //   positiveBtnBackground: Color(0xFF0C9346),
          //   positiveBtnText: "Okay",
          //   negativeBtnBackground: Colors.transparent,
          //   onPositiveClicked: () {
          //     // Positive button clicked action
          //     print("Rate");
          //   },
          //   onNegativeClicked: () {
          //     // Negative button clicked action
          //     print("Cancel");
          //   },
          // );
        },
      );

 }


}
