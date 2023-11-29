
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import '../Translator_Module/Translator_Module_Page.dart';
import 'package:http/http.dart'as http;
import 'package:widgets_to_image/widgets_to_image.dart';

class Photo_View_Page extends StatefulWidget {
  String ?img;
  Photo_View_Page(this.img,);

  @override
  State<Photo_View_Page> createState() => _Photo_View_PageState();
}



class _Photo_View_PageState extends State<Photo_View_Page> {


  bool shareisclisked=false;
  // WidgetsToImageController to access widget
  WidgetsToImageController controller = WidgetsToImageController();
// to save image bytes of widget
  Uint8List? bytes;
  String userName="";
  String userEmail="";
  String userImg="";
  String userPhone="";


  @override
  void initState() {
    getDateFromUser();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return
      Scaffold(
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
                  padding:  EdgeInsets.only(left:width/27.428),
                  child: SizedBox(
                    width:width/1.6457,
                    height: height/35.062,
                    child:
                    const FittedBox(

                      fit: BoxFit.contain,
                      alignment: Alignment.centerLeft,
                      child: KText(
                        text: 'Photo View',
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
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: height/1.26,
                width: double.infinity,
                child: WidgetsToImage(
                  controller: controller,
                  child:Container(
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: height/3.9,
                              width: width/1.0588,
                              child: InteractiveViewer(
                                maxScale: 5.0,
                                child: Image.network(widget.img.toString(),
                                  height: double.infinity,
                                  width: double.infinity,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              height:60,
                              width: 60,
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(8)
                              ),
                            ),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      color: Colors.red,
                                      width: 140,
                                      child: Row(
                                        children: [
                                          Icon(Icons.person),
                                          SizedBox(width: width/203.2,),
                                          Text("${userName.toString()}", style: TextStyle(
                                              fontFamily: "Davish",
                                              color: Colors.black,
                                              letterSpacing: 0.3
                                          ),),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      color: Colors.yellow,
                                      width: 100,
                                      child: Row(
                                        children: [
                                          Icon(Icons.phone),
                                          SizedBox(width: width/203.2,),
                                          Text("${userPhone.toString()}", style: TextStyle(
                                              fontFamily: "Davish",
                                              color: Colors.black,
                                              letterSpacing: 0.3
                                          ),),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.mail),
                                    SizedBox(width: width/273.2,),
                                    Text(" ${userEmail.toString()}",style: TextStyle(
                                        fontFamily: "Davish",
                                        color: Colors.black,
                                        letterSpacing: 0.3
                                    ),),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),



                      ]
                    ),
                  )
                ),
              ),

              shareisclisked==true?const CircularProgressIndicator(
                strokeWidth: 5,
                strokeCap: StrokeCap.butt,
                backgroundColor: Color(0xff008069),
                color: Colors.white,
              ):const SizedBox()


            ],
          ),

        bottomNavigationBar: BottomAppBar(
          clipBehavior: Clip.antiAlias,
             height: 60,
            surfaceTintColor: Colors.red,
            color: const Color(0xff0C9346),
            child:
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xff0C9346), Color(0xff008069)],
                ),
              ),
              child: GestureDetector(
                onTap: () async {
                  final bytes = await controller.capture();
                  setState(() {
                    this.bytes = bytes;
                    shareisclisked=true;
                  });
                  print("bytes__________________________________________");
                  print(bytes);
                 shareImageToWhatsApp2222(widget.img.toString(),bytes);
                  ///image to share in share plus methods...
                  //Share.share(widget.img.toString(),subject: "Image Link ",sharePositionOrigin: Rect.largest);
                //  shareImageToWhatsApp(widget.img.toString());
                  //shareImageOnWhatsApp(widget.img.toString());
                  print("Cilked");


                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.share,color: Colors.white,),
                    const SizedBox(width: 10,),
                    SizedBox(
                      width:width/6.0,
                      height: height/35.062,
                      child: const FittedBox(
                        alignment: Alignment.center,
                        fit: BoxFit.contain,
                        child: KText(
                          text: 'Share',
                          style: TextStyle(
                              fontFamily: "Davish",
                              color: Colors.white,
                              letterSpacing: 0.3
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            )),


      );
  }


///iamge to send on whats app function
  Future<void> shareImageToWhatsApp(String imagePath) async {

    final url=Uri.parse(imagePath);
    final res =await http.get(url);
    final bytes=res.bodyBytes;
    final temp=await getTemporaryDirectory();
    final path="${temp.path}/image.jpg";
    File(path).writeAsBytesSync(bytes);
    await Share.shareFiles([path]);
    setState(() {
      shareisclisked=false;
    });

  }

  Future<void> shareImageToWhatsApp2222(String imagePath,bytes2) async {

    // final url=Uri.parse(imagePath);
    // final res =await http.get(url);
    // final bytes=res.bodyBytes;
    final temp=await getTemporaryDirectory();
    final path="${temp.path}/image.jpg";
    File(path).writeAsBytesSync(bytes2);
    await Share.shareFiles([path]);
    setState(() {
      shareisclisked=false;
    });

  }



  Widget buildImage(Uint8List bytes) => Image.memory(bytes);


  getDateFromUser() async {
    print("user+++++++++++++++++++++++++++++++++++++++");
    var getdata=await FirebaseFirestore.instance.collection("Users").doc(FirebaseAuth.instance.currentUser!.uid).get();

    Map<String,dynamic>?value=getdata.data();
    setState(() {
      userName=value!['Name'];
      userEmail=value['Email'];
     // userImg=value['img'];
      userPhone=value['Phone'];
    });
    print(userName);
    print(userEmail);
    print(userImg);
    print(userPhone);
  }

}
