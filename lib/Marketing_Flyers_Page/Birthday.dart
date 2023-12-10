import 'dart:async';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import '../Photo_View-Page/PhotoView_Page.dart';
import '../Translator_Module/Translator_Module_Page.dart';
import 'package:http/http.dart'as http;


class birthday extends StatefulWidget {
  String Type;
   birthday(this.Type);

  @override
  State<birthday> createState() => _birthdayState();
}

class _birthdayState extends State<birthday> {



  List <String> PortraitImagelist=[];
  List <String> landscapeImagelist=[];

  bool landscapeselcted=true;
  bool portratitselcted=false;



  getimagesizefunction() async {
    setState(() {
      PortraitImagelist.clear();
      landscapeImagelist.clear();
    });
    var getimagesize=await FirebaseFirestore.instance.collection("WishesImage").where("type",isEqualTo:widget.Type).get();
    for(int i=0;i<getimagesize.docs.length;i++){

      final response = await http.get(Uri.parse(getimagesize.docs[i]['img'].toString()));
      final bytes = response.bodyBytes;
      final decodedImage = await decodeImageFromList(bytes);


      if(decodedImage.width>decodedImage.height){
        setState(() {
          PortraitImagelist.add(getimagesize.docs[i]['img'].toString());
        });
      }
      else{
        setState(() {
          landscapeImagelist.add(getimagesize.docs[i]['img'].toString());
        });
      }

    }


  }


  String userName="";
  String userEmail="";
  String userImg="";
  String userPhone="";
  String companyName="";
  String companyType="";
  String companyIMage="";

  @override
  void initState() {
    getimagesizefunction();
    getDateFromUser();
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;


    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffF5F5F5),
        elevation: 0,
        title: Row(

          children: [
            InkWell(
              onTap: (){
                Navigator.of(context).pop();
              },
              child: Padding(
                padding:  EdgeInsets.only(left:width/102.857),
                child:  const Icon(Icons.arrow_back_ios_new_rounded),

              ),
            ),
             Padding(
              padding:  EdgeInsets.only(left: width/27.428),
              child: SizedBox(
                height: height/30.062,
                width:width/1.418,
                child: FittedBox(
                  alignment: Alignment.centerLeft,
                  fit: BoxFit.contain,
                  child:
                  KText(
                    text: '${widget.Type} Flyers',
                    style: const TextStyle(
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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child:
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          //  FirebaseFirestore.instance.collection("WishesImage").where("type",isEqualTo:widget.Type)
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection("WishesImage").where("type",isEqualTo:widget.Type).snapshots(),
              builder:(context, snapshot) {

                if(snapshot.hasData==null){
                  return  Center(
                    child: CircularProgressIndicator(color :Color(0xff0C9346),strokeCap: StrokeCap.square,
                      strokeWidth: 5,)
                  );
                }
                if(!snapshot.hasData){

                  return  Center(
                      child: CircularProgressIndicator(color :Color(0xff0C9346),strokeCap: StrokeCap.square,
                        strokeWidth: 5,)
                  );
                }

                return
                  GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 65/110
                    ),
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      var Value=snapshot.data!.docs[index];

                      return GestureDetector(
                        onTap: () async {
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>
                              Photo_View_Page(Value['img'].toString(),userImg,userName,userPhone,userEmail,companyName,companyType,companyIMage),));
                        },
                        child: Container(
                          margin:EdgeInsets.all(5),
                            height:height/16.539,
                            width: width/7.762,
                            decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius:  BorderRadius.circular(8),
                              image:DecorationImage(
                                fit:BoxFit.cover,
                                image:NetworkImage(Value['img'].toString())
                              )
                            ),

                        ),
                      );


                    },);
              }, ),

           /* Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [

                GestureDetector(
                  onTap: (){
                    setState(() {
                      landscapeselcted = true;
                      portratitselcted = false;
                    });
                  },
                  child: Container(
                    height: height/21.914,
                    width: width/4.114,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xff0C9346), Color(0xff008069)
                        ],
                      ),
                    ),
                    child:  Center(
                      child: KText(
                        text: 'Landscape',
                        style: TextStyle(
                            fontFamily: "Davish",
                            color: landscapeselcted==true?Colors.white:Colors.black,
                            letterSpacing: 0.3,
                            fontSize: 18
                        ),
                      ),
                    ),
                  ),
                ),

                GestureDetector(
                  onTap: (){

                    setState(() {
                      landscapeselcted = false;
                      portratitselcted = true;
                    });

                  },
                  child: Container(
                    height: height/21.914,
                    width: width/4.114,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xff0C9346),
                          Color(0xff008069)
                        ],
                      ),
                    ),
                    child:
                    Center(
                      child: KText(
                        text: 'Portrait',
                        style: TextStyle(
                            fontFamily: "Davish",
                            color:portratitselcted==true?Colors.white: Colors.black,
                            letterSpacing: 0.3,
                            fontSize: 18
                        ),
                      ),
                    ),
                  ),
                ),


              ],
            ),


            ///Portarait list view Builder
            portratitselcted==true?
            GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 65/110
              ),
              physics: const BouncingScrollPhysics(),
              itemCount: landscapeImagelist.length,
              itemBuilder:(context, index) {

                return GestureDetector(
                  onTap: (){

                    Navigator.push(context, MaterialPageRoute(builder: (context) =>  Photo_View_Page(landscapeImagelist[index],"Port",userImg,userName,userPhone,userEmail),));

                  },
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: CachedNetworkImage(
                      imageUrl:landscapeImagelist[index].toString() ,
                      placeholder: (context, url) {
                        return  Shimmer(
                          enabled: true,
                          child: Container(
                            width: width/2.0571,
                            height: height/4.382,
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.4),
                                borderRadius: BorderRadius.circular(5)
                            ),
                          ),
                        );
                      },
                      ),
                    ),
                );
              },):
            ///landscape list view Builder
            landscapeselcted==true?
            ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: PortraitImagelist.length,
              itemBuilder:(context, index) {

                return GestureDetector(
                  onTap: (){

                    Navigator.push(context, MaterialPageRoute(builder: (context) =>  Photo_View_Page(PortraitImagelist[index],"Land",userImg,userName,userPhone,userEmail),));

                  },
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: SizedBox(
                      width: width/2.0571,
                      height: height/4.382,
                      child: CachedNetworkImage(
                        imageUrl: PortraitImagelist[index].toString(),
                        placeholder:(context, url) =>
                            Shimmer(
                          enabled: true,
                          child: Container(
                            width: width/2.0571,
                            height: height/4.382,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(5)
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },):const SizedBox(),*/
          ],
        ),
      ),
    );
  }

  getDateFromUser() async {
    print("user+++++++++++++++++++++++++++++++++++++++");
    var getdata=await FirebaseFirestore.instance.collection("Users").doc(FirebaseAuth.instance.currentUser!.uid).get();

    Map<String,dynamic>?value=getdata.data();
    setState(() {
      userName=value!['Name'];
      userEmail=value['Email'];
      userImg=value['Img'];
      userPhone=value['Phone'];
       companyName=value['companyName'];
       companyType=value['companyType'];
    });

    var companyData=await FirebaseFirestore.instance.collection("CompanyType").where("Name",isEqualTo:companyType.toString()).get();

    if(companyData.docs.length>0){
      setState((){
        companyIMage=companyData.docs[0]['Img'];
      });
    }

    print(userName);
    print(userEmail);
    print(userImg);
    print(userPhone);
    print(companyName);
    print(companyType);
    print('Company Image File success');
    print(companyIMage);
  }
}

class ImageDetail {
  final int width;
  final int height;
  final Uint8List? bytes;

  ImageDetail({required this.width, required this.height, this.bytes});
}

