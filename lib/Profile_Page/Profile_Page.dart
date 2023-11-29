import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import '../Translator_Module/Translator_Module_Page.dart';
import '../const File Page.dart';

class Profile_Page extends StatefulWidget {
  const Profile_Page({Key? key}) : super(key: key);

  @override
  State<Profile_Page> createState() => _Profile_PageState();
}

class _Profile_PageState extends State<Profile_Page> {

  String userid= FirebaseAuth.instance.currentUser!.uid;

  TextEditingController Namecon=TextEditingController();
  TextEditingController Phonecon=TextEditingController();
  TextEditingController emailcon=TextEditingController();


  @override
  void initState() {
    // TODO: implement initState
    Userdata();
    super.initState();
  }

  Userdata()async{

    var User=await FirebaseFirestore.instance.collection("Users").doc(userid).get();

    Map<String,dynamic>?values=User.data();
    setState(() {
      Namecon.text=values!["Name"];
      emailcon.text=values["Email"];
      Phonecon.text=values["Phone"];
    });

  }


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
              onTap: (){
                // Navigator.pop(context, PageTransition(type: PageTransitionType.rightToLeftJoined, ctx: context,
                //     alignment: Alignment.center,
                //     duration: Duration(seconds: 2),
                //     childCurrent:Container() ,
                //     curve: Curves.fastOutSlowIn,
                //     child: firstpage()));
                Navigator.pop(context);

              },
              child: Padding(
                padding:  EdgeInsets.only(left:width/102.857),
                child:  const Icon(Icons.arrow_back_ios_new_rounded),

              ),
            ),
            Padding(
              padding:  EdgeInsets.only(left:width/27.428),
              child: SizedBox(
              //  width:width/1.6457,
                height: height/30.062,
                   width:width/1.418,
                child: const FittedBox(
                  alignment: Alignment.centerLeft,
                  fit: BoxFit.contain,

                  child: KText(
                    text: 'My Profile',
                    style: TextStyle(
                        fontFamily: "Davish",
                        color: Colors.white,
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
      ),
      body:
      SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            FutureBuilder<dynamic>(
              future: FirebaseFirestore.instance.collection("Users").doc(userid).get(),
              builder:(context, snapshot) {

                if(snapshot.hasData ==null){
                  return const Center(child: CircularProgressIndicator(),);
                }
                if(!snapshot.hasData){
                  return const Center(child: CircularProgressIndicator(),);
                }
               var value=snapshot.data.data();

                return
                  Column(
                  children: [
                    SizedBox(
                        height:height/4.869,
                        width: width/1.6457,
                        child: Lottie.asset(profile,fit: BoxFit.fill,)),

                    ///name controller
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width:width/1.6457,
                              height: height/35.062,
                              child: const FittedBox(
                                fit: BoxFit.contain,
                                alignment: Alignment.centerLeft,
                                child:  KText(text: "Name",
                                  style: TextStyle(fontFamily: "Davish",

                                ),),
                              ),
                            ),
                            SizedBox(height: height/87.657,),
                            Container(
                              height: height / 15.3,
                              width: width / 1.2,
                              decoration: BoxDecoration(
                                color: const Color(0xffffffff),
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: const Color(0xffD1CDCD),
                                ),
                              ),
                              child: TextField(
                                controller: Namecon,
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontSize: width/25.402,
                                    color: Colors.grey),
                                decoration:
                                InputDecoration(border: InputBorder.none,
                                    contentPadding: EdgeInsets.only(left: width/41.143,
                                        )
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: height/58.438,),


                    ///Phone controller
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width:width/1.6457,
                              height: height/35.062,
                              child: const FittedBox(
                                alignment: Alignment.centerLeft,
                                fit: BoxFit.contain,
                                child: KText(text:"Phone",
                                  style: TextStyle(fontFamily: "Davish",

                                  ),),
                              ),
                            ),
                            SizedBox(height: height/87.657,),
                            Container(
                              height: height / 15.3,
                              width: width / 1.2,
                              decoration: BoxDecoration(
                                color: const Color(0xffffffff),
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: const Color(0xffD1CDCD),
                                ),
                              ),
                              child: TextField(
                                readOnly: true,
                                controller: Phonecon,
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontSize: width/25.402,
                                    color: Colors.grey),
                                decoration:
                                InputDecoration(border: InputBorder.none,
                                    contentPadding: EdgeInsets.only(left: width/41.143,
                                    )
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: height/58.438,),
                    ///email controller
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width:width/1.6457,
                              height: height/35.062,
                              child: const FittedBox(

                                fit: BoxFit.contain,
                                alignment: Alignment.centerLeft,

                                child: KText(text: "Email",
                                  style: TextStyle(fontFamily: "Davish",

                                  ),),
                              ),
                            ),
                            SizedBox(height: height/87.657,),
                            Container(
                              height: height / 15.3,
                              width: width / 1.2,
                              decoration: BoxDecoration(
                                color: const Color(0xffffffff),
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: const Color(0xffD1CDCD),
                                ),
                              ),
                              child: TextField(
                                controller: emailcon,
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontSize: width/25.402,
                                    color: Colors.grey),
                                decoration:
                                InputDecoration(border: InputBorder.none,
                                    contentPadding: EdgeInsets.only(left: width/41.143,
                                      )
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: height/29.219,),


                    ///submit button

                    GestureDetector(
                      onTap:(){
                        userdataupdata();
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
                        child:  Center(
                          child: SizedBox(
                            width:width/1.6457,
                            height: height/35.062,
                            child: const FittedBox(
                              alignment: Alignment.center,
                              fit: BoxFit.contain,
                              child: KText(
                                  text: "Submit",
                                  style:TextStyle(
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
                );
              },)

          ],
        ),
      ),
    );
  }

  ///userdata Update Fucntion
userdataupdata(){

  FirebaseFirestore.instance.collection("Users").doc(userid).update({
    "Name":Namecon.text,
    "Email":emailcon.text,
    "Phone":Phonecon.text,
  });
  clearcontroller();
}

clearcontroller(){
    Namecon.clear();
    emailcon.clear();
    Phonecon.clear();
}


}
