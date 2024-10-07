
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import '../Translator_Module/Translator_Module_Page.dart';
import 'package:http/http.dart'as http;
import 'package:widgets_to_image/widgets_to_image.dart';

import '../const File Page.dart';

class Photo_View_Page extends StatefulWidget {
  String ?img;
  String ?userImg;
  String ?userName;
  String ?userPhone;
  String ?userEmail;
  String ?companyName;
  String ?companyType;
  String ?companyIMage;
  Photo_View_Page(this.img,this.userImg,this.userName,this.userPhone,this.userEmail,this.companyName,this.companyType,this.companyIMage);

  @override
  State<Photo_View_Page> createState() => _Photo_View_PageState();
}



class _Photo_View_PageState extends State<Photo_View_Page> {


  bool shareisclisked=false;
  bool dropdownClicked=false;
  List<String>comPanyTypeList=["Select Company Type"];

  String DropdownImage="";
  TextEditingController companyTypecon=TextEditingController(text:"Select Company Type");
  // WidgetsToImageController to access widget
  WidgetsToImageController controller = WidgetsToImageController();
// to save image bytes of widget
  Uint8List? bytes;
  Color pickerColor = Color(0xff000000);

  Color currentColor = Color(0xff000000);


  int redColor=0;
  int blueColor=0;
  int greenColor=0;
  double adjustableheight=0;

  bool heightcalculate=false;

  @override
  void initState() {
    getimagesizefunction();
    if(widget.companyType!=""){
      setState(() {
        DropdownImage="";
        dropdownClicked=true;
        companyTypecon.text=widget.companyType.toString();
      });
    }
    else{
      setState(() {
        companyTypecon.text="Select Company Type";
      });
    }
    dropDownData();
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
            actions: [
              GestureDetector(
                  onTap: (){
                    colorPickerPopup();
                  },
                  child: Tooltip(
                    message: "Poster background Color",
                    child: Padding(
                      padding:  EdgeInsets.symmetric(
                        horizontal: width/51.375,
                        vertical: height/108.25
                      ),
                      child: Icon(Icons.color_lens,color: Colors.white,),
                    ),
                  )),

            ],
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
          SizedBox(
            width: width/1,
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        WidgetsToImage(
                          controller: controller,
                          child:
                          Container(
                            height:height/1.59+height/adjustableheight,
                            width: width/1.03885,
                            decoration: BoxDecoration(
                                color: Colors.white,
                            ),
                            child:
                            Align(
                              alignment: Alignment.bottomLeft,
                              child:
                            Stack(
                              alignment: Alignment.bottomLeft,
                              children: [

                                Padding(
                                  padding:  EdgeInsets.only(bottom: height/10.7),
                                  child: heightcalculate==false?
                                    Container(
                                    height:height/1.59+height/adjustableheight,
                                     // height:height/2.0,
                                      width: width/1.03885,
                                      decoration: BoxDecoration(
                                        color:Colors.white,
                                        image:
                                        DecorationImage(
                                          fit: BoxFit.fill,
                                          image: NetworkImage(widget.img.toString(),),
                                        )
                                      ),
                                  ):
                                     Container(
                                       height:height/1.59,
                                       width: width/1.03885,
                                    color:Colors.white,
                                    child: const Center(child: CircularProgressIndicator()),
                                  )
                                ),

                                Padding(
                                  padding:EdgeInsets.only(bottom:height/14.1967,right:width/4.11,left:width/6.044117647058824),
                                  child:
                                  SizedBox(
                                    child:Stack(
                                        alignment: Alignment.bottomCenter,
                                        children:[
                                          CustomPaint(

                                            size: Size(width,(width*0.333333333333334).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                                            painter: painter,
                                          ),
                                          Align(
                                              alignment: Alignment.bottomLeft,
                                              child:Padding(
                                                  padding:EdgeInsets.only(left:width/50.2),
                                                  child:
                                                  FittedBox(
                                                    child:Row(
                                                        children:[

                                                          Icon(Icons.circle,color:Colors.white,size:width/38.1),
                                                          Padding(
                                                              padding:EdgeInsets.only(left:width/50.2),
                                                              child: Text(widget.companyName.toString(),style: TextStyle(
                                                                color: Colors.white,
                                                                letterSpacing: 0.3,
                                                                fontWeight:FontWeight.w500,
                                                                fontSize:width/27.0126,

                                                              ),)
                                                          )
                                                        ]
                                                    ),
                                                  )
                                              )),

                                        ]
                                    )
                                  )
                                ),

                                Container(
                                  height:height/2.9862,
                                    width: width/1.03885,
                                  margin:EdgeInsets.only(bottom:height/50.55),
                                    child:CustomPaint(
                                      size: Size(width,(width*0.833333333333334).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                                      painter: RPSCustomPainter2(
                                      ),
                                    )
                                ),
                                //image
                                Padding(
                                  padding:EdgeInsets.only(bottom:height/33.7521,left:width/45.66666666666667),
                                  child:
                                  Row(
                                      children:[
                                        GestureDetector(
                                          onTap: (){
                                            print(height);
                                            print(width);
                                          },
                                          child: Container(
                                            height:height/14.6779,
                                            width: width/6.96610,
                                            decoration: BoxDecoration(
                                                color: Colors.grey.shade300,
                                                border: Border.all(color: pickerColor),
                                                borderRadius: BorderRadius.circular(5),
                                                image: widget.userImg==""?
                                                DecorationImage(image: AssetImage(AvatorImg)):
                                                DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: NetworkImage(widget.userImg.toString())
                                                )
                                            ),
                                          ),
                                        ),
                                      ]
                                  ),
                                ),

                                Padding(
                                  padding:  EdgeInsets.only(left:width/5.7,bottom:height/22.0),
                                  child:
                                  Row(
                                    children: [

                                      Container(
                                          height: height/42.57894736842105,
                                          width: width/3.0,
                                          color:Colors.white,

                                          child:Align(
                                              alignment: Alignment.centerLeft,
                                              child:
                                              FittedBox(
                                                  child:Row(
                                                      children:[
                                                        Icon(Icons.person,color:pickerColor,size:width/22.1),

                                                        Padding(
                                                          padding:EdgeInsets.only(left:width/82.2),
                                                          child:Text("${widget.userName.toString()}", style: TextStyle(
                                                              color: pickerColor,
                                                              letterSpacing: 0.3,
                                                              overflow: TextOverflow.ellipsis
                                                          ),),
                                                        )
                                                      ]
                                                  )
                                              ))
                                      ),

                                      Container(
                                          height: height/42.57894736842105,
                                          width: width/2.78,
                                          color:Colors.white,
                                          child:
                                          Align(
                                              alignment: Alignment.centerLeft,
                                              child:
                                              FittedBox(
                                                  child:Row(
                                                      children:[
                                                        Icon(Icons.mail,color:pickerColor,size:width/22.1),
                                                        Padding(
                                                          padding:EdgeInsets.only(left:width/82.2),
                                                          child:Text("${widget.userEmail.toString()}", style: TextStyle(

                                                              color: pickerColor,
                                                              letterSpacing: 0.3,
                                                              overflow: TextOverflow.ellipsis
                                                          ),),
                                                        )
                                                      ]
                                                  )
                                              ))
                                      ),
                                    ],
                                  ),
                                ),

                                Padding(
                                    padding:  EdgeInsets.only(left:width/5.7,bottom:height/46.8),
                                    child:
                                    Row(
                                        children:[
                                          Container(
                                              height: height/42.57894736842105,
                                              width: width/3.2,
                                              color:Colors.white,
                                              child:
                                              Align(
                                                alignment: Alignment.centerLeft,
                                                child:FittedBox(
                                                    child:Row(
                                                        children:[
                                                          Icon(Icons.phone,color:pickerColor,size:width/22.1),
                                                          Padding(
                                                              padding:  EdgeInsets.only(left:width/1000.44),
                                                              child:Text(" ${widget.userPhone.toString()}",style: TextStyle(

                                                                  color: pickerColor,
                                                                  letterSpacing: 0.3,
                                                                  overflow: TextOverflow.ellipsis
                                                              ),)
                                                          )
                                                        ]
                                                    )
                                                ),
                                              )
                                          ),

                                          Container(
                                              color:Colors.white,
                                              height: height/42.57894736842105,
                                              width: width/2.68,
                                              child:
                                              Align(
                                                  alignment: Alignment.centerLeft,
                                                  child:
                                                  FittedBox(
                                                      child:
                                                      Row(
                                                          children:[
                                                            Padding(
                                                              padding:  EdgeInsets.only(left:width/68.5),
                                                              child: Container(
                                                                  height:height/38.2,
                                                                  width:width/16.5,
                                                                alignment: Alignment.center,
                                                                decoration:BoxDecoration(
                                                                    color: Colors.transparent,
                                                                  image:DecorationImage(
                                                                    fit:BoxFit.contain,
                                                                    image:NetworkImage(
                                                                        DropdownImage==""?
                                                                        widget.companyIMage.toString():DropdownImage.toString())
                                                                  )
                                                                )
                                                              ),
                                                            ),
                                                            Container(
                                                              color:Colors.white,
                                                            //    margin: EdgeInsets.only(left:width/25.44),
                                                                height: height/42.57894736842105,
                                                              width: width/2.68,
                                                              child:Padding(
                                                                  padding:  EdgeInsets.only(left:width/1000.44),
                                                                  child:Text(" ${ companyTypecon.text.toString()}",style: TextStyle(

                                                                      color: pickerColor,
                                                                      letterSpacing: 0.3,
                                                                      overflow: TextOverflow.ellipsis
                                                                  ),)
                                                              )

                                                            )
                                                          ]
                                                      )
                                                  ))
                                          ),
                                        ]
                                    )
                                ),

                                Container(
                                    height: height/45.111,

                                    color:
                                    pickerColor,
                                    width: double.infinity,
                                    padding: EdgeInsets.only(left: width/78.4,right:width/78.4,
                                    ),
                                    child:Align
                                      (   alignment: Alignment.centerLeft,
                                        child:FittedBox(
                                          child:Text(shareImgQuote.toString(),style: TextStyle(
                                              color: Colors.white,
                                              letterSpacing: 0.3,
                                              fontWeight:FontWeight.w500,
                                              overflow: TextOverflow.ellipsis
                                          ),),
                                        ))
                                ),

                                Container(
                                  child: Image.asset("assets/image_bg.png"),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child:FittedBox(
                                      child:Row(
                                          children:[
                                            Icon(Icons.phone,color:pickerColor,size:width/22.1),
                                            Padding(
                                                padding:  EdgeInsets.only(left:width/1000.44),
                                                child:Text(" ${widget.userPhone.toString()}",style: TextStyle(

                                                    color: pickerColor,
                                                    letterSpacing: 0.3,
                                                    overflow: TextOverflow.ellipsis
                                                ),)
                                            )
                                          ]
                                      )
                                  ),
                                )


                              ],
                            )),
                          )
                        ),
                      ],
                    ),

                    heightcalculate==true||shareisclisked==true?const CircularProgressIndicator(
                      strokeWidth: 5,
                      strokeCap: StrokeCap.butt,
                      backgroundColor: Color(0xff008069),
                      color: Colors.white,
                    ):const SizedBox()


                  ],
                ),
                Padding(
                  padding:  EdgeInsets.only(top:height/108.25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Company Name :   ",style: TextStyle(
                        color: Colors.black,
                        letterSpacing: 0.3,
                        fontWeight:FontWeight.w500,
                        fontSize:width/27.0126,

                      ),),
                      Container(
                        width:width/2.055,
                        height:height/19.2444,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.black)
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButtonFormField2<String>(
                            isExpanded: true,
                            hint:Text(
                              'Select Company Type',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black),
                            ),
                            items: comPanyTypeList.map((String item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                   item,
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black),
                              ),
                            ))
                                .toList(),
                            value: companyTypecon.text,
                            onChanged: (String? value) {
                              setState(() {
                                companyTypecon.text = value!;
                              });
                              dropDownDataImageFuntion(value.toString());


                            },
                            buttonStyleData:  ButtonStyleData(
                            ),decoration: InputDecoration(
                              border: InputBorder.none
                          ),

                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

        bottomNavigationBar: GestureDetector(
          onTap: () async {
            setState(() {
              shareisclisked=true;
            });
            final bytes = await controller.capture();
            setState(() {
              this.bytes = bytes;
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
          child: BottomAppBar(
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
              )),
        ),


      );
  }

  dropDownData()async{
    var document =await FirebaseFirestore.instance.collection("CompanyType").orderBy("Name").get();
    print(document.docs.length);
    for(int j=0;j<document.docs.length;j++){
      setState((){
        comPanyTypeList.add(document.docs[j]['Name']);
      });

    }

    print(comPanyTypeList);
  }

  dropDownDataImageFuntion(Name)async{
    var document =await FirebaseFirestore.instance.collection("CompanyType").where("Name",isEqualTo:Name).get();
    print(document.docs.length);
   if(document.docs.length>0){
     setState((){
       DropdownImage=document.docs[0]['Img'];
       dropdownClicked=false;
     });

   }

    print(DropdownImage);
  }


  getimagesizefunction() async {

    setState(() {
      heightcalculate=true;
    });

    final response = await http.get(Uri.parse(widget.img.toString()));
    final bytes = response.bodyBytes;
    final decodedImage = await decodeImageFromList(bytes);
    setState(() {
      adjustableheight= double.parse(decodedImage.height.toString());
      heightcalculate=false;
    });

    print(adjustableheight);
    print("Adjustable Height+++++++++++++++++++++++++++++++++++++++++++++");

  }


  colorPickerPopup(){
    return showDialog(
      context: context,
      builder: (context) {
        return  AlertDialog(
          title: const Text('Pick a color!'),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: pickerColor,
              onColorChanged: changeColor,
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('Got it'),
              onPressed: () {
                setState(() => currentColor = pickerColor);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },

    );
  }

  // create some values

  RPSCustomPainter painter = RPSCustomPainter(fillColor: Colors.black);

// ValueChanged<Color> callback
  void changeColor(Color color) {
    setState((){
      pickerColor = color;
       painter = RPSCustomPainter(fillColor: pickerColor);
      redColor=color.red;
      blueColor=color.blue;
      greenColor=color.green;
    });
    print("Hassss");
    print(redColor);
    print(blueColor);
    print(greenColor);
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
   Future.delayed(Duration(seconds: 10),(){
     setState(() {
       shareisclisked=false;
     });
   });
  }



  Widget buildImage(Uint8List bytes) => Image.memory(bytes);




}



class RPSCustomPainter extends CustomPainter {
  final Color fillColor;

  RPSCustomPainter({required this.fillColor});

  @override
  void paint(Canvas canvas, Size size) {
    // Layer 1
    Paint paintFill = Paint()
      ..color = fillColor // Use the provided color for filling
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    Path path_0 = Path();
    path_0.moveTo(size.width*0.0015921,size.height*0.8518822);
    path_0.lineTo(size.width*0.2518915,size.height*0.8491570);
    path_0.lineTo(size.width*0.3241509,size.height*0.8491570);
    path_0.lineTo(size.width*0.3917008,size.height*0.8494688);
    path_0.lineTo(size.width*0.4568115,size.height*0.8491570);
    path_0.lineTo(size.width*0.5010075,size.height*0.8476674);
    path_0.lineTo(size.width*0.5495507,size.height*0.8482679);
    path_0.lineTo(size.width*0.5824442,size.height*0.8491570);
    path_0.lineTo(size.width*0.9034090,size.height*0.8494688);
    path_0.lineTo(size.width*0.9983702,size.height*1.0014550);
    path_0.lineTo(size.width*0.7986909,size.height*1.0014550);
    path_0.lineTo(size.width*0.6013543,size.height*1.0017667);
    path_0.lineTo(size.width*0.5501545,size.height*1.0005543);
    path_0.lineTo(size.width*0.4846574,size.height*1.0020785);
    path_0.lineTo(size.width*0.4496145,size.height*1.0030023);
    path_0.lineTo(size.width*0.4002502,size.height*1.0030023);
    path_0.lineTo(size.width*0.3516587,size.height*1.0032910);
    path_0.lineTo(size.width*0.3163984,size.height*1.0026905);
    path_0.lineTo(size.width*0.2528817,size.height*1.0030023);
    path_0.lineTo(size.width*0.2015128,size.height*1.0017667);
    path_0.lineTo(size.width*0.0020027,size.height*1.0026905);
    path_0.lineTo(size.width*0.0015921,size.height*0.8518822);
    path_0.close();

    canvas.drawPath(path_0, paintFill);

    // Layer 1
    Paint paintStroke = Paint()
      ..color = fillColor // Use the provided color for stroking
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    canvas.drawPath(path_0, paintStroke);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}


/*class RPSCustomPainter extends CustomPainter{


  @override
  void paint(Canvas canvas, Size size) {



    // Layer 1

    Paint paint_fill_0 = Paint()
      ..color = const Color.fromARGB(255, 0, 0, 0)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width*0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;


    Path path_0 = Path();
    path_0.moveTo(size.width*0.0015921,size.height*0.8518822);
    path_0.lineTo(size.width*0.2518915,size.height*0.8491570);
    path_0.lineTo(size.width*0.3241509,size.height*0.8491570);
    path_0.lineTo(size.width*0.3917008,size.height*0.8494688);
    path_0.lineTo(size.width*0.4568115,size.height*0.8491570);
    path_0.lineTo(size.width*0.5010075,size.height*0.8476674);
    path_0.lineTo(size.width*0.5495507,size.height*0.8482679);
    path_0.lineTo(size.width*0.5824442,size.height*0.8491570);
    path_0.lineTo(size.width*0.9034090,size.height*0.8494688);
    path_0.lineTo(size.width*0.9983702,size.height*1.0014550);
    path_0.lineTo(size.width*0.7986909,size.height*1.0014550);
    path_0.lineTo(size.width*0.6013543,size.height*1.0017667);
    path_0.lineTo(size.width*0.5501545,size.height*1.0005543);
    path_0.lineTo(size.width*0.4846574,size.height*1.0020785);
    path_0.lineTo(size.width*0.4496145,size.height*1.0030023);
    path_0.lineTo(size.width*0.4002502,size.height*1.0030023);
    path_0.lineTo(size.width*0.3516587,size.height*1.0032910);
    path_0.lineTo(size.width*0.3163984,size.height*1.0026905);
    path_0.lineTo(size.width*0.2528817,size.height*1.0030023);
    path_0.lineTo(size.width*0.2015128,size.height*1.0017667);
    path_0.lineTo(size.width*0.0020027,size.height*1.0026905);
    path_0.lineTo(size.width*0.0015921,size.height*0.8518822);
    path_0.close();

    canvas.drawPath(path_0, paint_fill_0);


    // Layer 1

    Paint paint_stroke_0 = Paint()
      ..color = const Color.fromARGB(255, 0, 0, 0)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width*0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;



    canvas.drawPath(path_0, paint_stroke_0);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}*/

class RPSCustomPainter2 extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {



    // Layer 1

    Paint paint_fill_0 = Paint()
      ..color = const Color.fromARGB(255, 255, 255, 255)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width*0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;


    Path path_0 = Path();
    path_0.moveTo(size.width*0.0015921,size.height*0.8518822);
    path_0.lineTo(size.width*0.2518915,size.height*0.8491570);
    path_0.lineTo(size.width*0.3241509,size.height*0.8491570);
    path_0.lineTo(size.width*0.3917008,size.height*0.8494688);
    path_0.lineTo(size.width*0.4568115,size.height*0.8491570);
    path_0.lineTo(size.width*0.5010075,size.height*0.8476674);
    path_0.lineTo(size.width*0.5495507,size.height*0.8482679);
    path_0.lineTo(size.width*0.5824442,size.height*0.8491570);
    path_0.lineTo(size.width*0.9034090,size.height*0.8494688);
    path_0.lineTo(size.width*0.9983702,size.height*1.0014550);
    path_0.lineTo(size.width*0.7986909,size.height*1.0014550);
    path_0.lineTo(size.width*0.6013543,size.height*1.0017667);
    path_0.lineTo(size.width*0.5501545,size.height*1.0005543);
    path_0.lineTo(size.width*0.4846574,size.height*1.0020785);
    path_0.lineTo(size.width*0.4496145,size.height*1.0030023);
    path_0.lineTo(size.width*0.4002502,size.height*1.0030023);
    path_0.lineTo(size.width*0.3516587,size.height*1.0032910);
    path_0.lineTo(size.width*0.3163984,size.height*1.0026905);
    path_0.lineTo(size.width*0.2528817,size.height*1.0030023);
    path_0.lineTo(size.width*0.2015128,size.height*1.0017667);
    path_0.lineTo(size.width*0.0020027,size.height*1.0026905);
    path_0.lineTo(size.width*0.0015921,size.height*0.8518822);
    path_0.close();

    canvas.drawPath(path_0, paint_fill_0);


    // Layer 1

    Paint paint_stroke_0 = Paint()
      ..color = const Color.fromARGB(255, 0, 0, 0)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width*0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;



    canvas.drawPath(path_0, paint_stroke_0);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }



}



