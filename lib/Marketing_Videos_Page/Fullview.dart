
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:video_player/video_player.dart';
import 'package:dio/dio.dart';
import 'package:image/image.dart' as img;
import 'package:flutter_ffmpeg/flutter_ffmpeg.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'package:widgets_to_image/widgets_to_image.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import '../Photo_View-Page/PhotoView_Page.dart';
import '../Translator_Module/Translator_Module_Page.dart';
import 'package:http/http.dart'as http;
import 'package:widgets_to_image/widgets_to_image.dart';

import '../const File Page.dart';
import 'dart:async';



class VideoPlayerFullview extends StatefulWidget {

  String ?videourl;
  String ?userImg;
  String ?userName;
  String ?userPhone;
  String ?userEmail;
  String ?companyName;
  String ?companyType;
  String ?companyIMage;
  VideoPlayerFullview(this.videourl,this.userImg,this.userName,this.userPhone,this.userEmail,this.companyName,this.companyType,this.companyIMage);

  @override
  _VideoPlayerFullviewState createState() => _VideoPlayerFullviewState();
}

class _VideoPlayerFullviewState extends State<VideoPlayerFullview> {

  late VideoPlayerController _controller;

  static const EventChannel _channel = EventChannel('video_editor_progress');
  late StreamSubscription _streamSubscription;
  double processPercentage = 0;

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
  EventListener _eventListener = EventListener();


  @override
  void initState() {
    super.initState();
    // Replace 'YOUR_NETWORK_VIDEO_URL' with the actual URL of the network video
    String networkVideoUrl = widget.videourl!;
    _initializeVideoPlayer(networkVideoUrl);
    createpath();
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
    _eventListener.onEvent.listen((event) {
      setState(() {
        processPercentage = event;
      });
    });
    //dropDownData();
  }

  void _simulateSendingEvents() async {
    for (int i = 0; i <= 100; i += 10) {
      await Future.delayed(Duration(seconds: 1));
      _eventListener.sendEvent(i.toDouble());
    }
  }

  void _initializeVideoPlayer(String networkVideoUrl) {
    _controller = VideoPlayerController.network(networkVideoUrl)
      ..initialize().then((_) {

        setState(() {});
      });

    _controller.addListener(() {
      if (_controller.value.isPlaying) {
        // Video is playing, you can overlay an image here
      }
    });
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

  void _enableEventReceiver() {

    _streamSubscription = _channel.receiveBroadcastStream().listen((dynamic event) {
          setState(() {
            processPercentage = (event.toDouble() * 100).round();
          });
        }, onError: (dynamic error) {
          print('Received error: ${error.message}');
        }, cancelOnError: true);
  }



  void Receiver() {
    // Simulate an event every second to increase the percentage value
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        processPercentage += 10.0;
        if (processPercentage < 100.0) {
          _enableEventReceiver(); // Continue simulating events
        }
      });
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
                    text: 'Video View',
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

      body: Center(
        child: isloading==false?_controller.value.isInitialized
            ? Container(
               height:(MediaQuery.of(context).size.width)/16*9+height/10.3,
                width: width/1,
              color: Colors.red,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [

              AspectRatio(
                  aspectRatio:16/9,
                  child: VideoPlayer(_controller)),


              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  WidgetsToImage(
                    controller: controller,
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          _controller.play();
                        });
                      },
                      child: Container(
                        color: Colors.transparent,
                        width:width/1,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Padding(
                              padding:  EdgeInsets.only(top:height/3.8086),
                              child: Container(
                                  height:height/13.5,
                                  color: Colors.transparent,
                                  // margin:EdgeInsets.only(bottom:height/50.55),
                                  child:CustomPaint(
                                    size: Size(width,(width*0.833333333333334).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                                    painter: RPSCustomPainter3(
                                    ),
                                  )
                              ),
                            ),
                            Padding(
                                padding:EdgeInsets.only(top:height/19,right:width/4.11,left:width/6.044117647058824),
                                child:
                                SizedBox(
                                    child:Stack(
                                        alignment: Alignment.centerLeft,
                                        children:[
                                          CustomPaint(

                                            size: Size(width,(width*0.333333333333334).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                                            painter: painter,
                                          ),
                                          Padding(
                                              padding:EdgeInsets.only(left:width/45.7,top:height/7.5),
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
                                          ),
                                        ]
                                    )
                                )
                            ),
                            Padding(
                              padding:EdgeInsets.only(top:height/4.4,left:width/45.66666666666667),
                              child:
                              Row(
                                  children:[
                                    GestureDetector(
                                      onTap: (){
                                        print(height);
                                        print(width);
                                      },
                                      child: Container(
                                        height:height/13.8,
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
                              padding:  EdgeInsets.only(left:width/5.7,top:height/4.2),
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
                                padding:  EdgeInsets.only(left:width/5.7,top:height/3.5),
                                child:
                                Row(
                                    children:[
                                      Container(
                                          height: height/42.57894736842105,
                                          width: width/3.1,
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
                                                              height:height/41.2380,
                                                              width:width/19.5714,
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
                            Padding(
                              padding:  EdgeInsets.only(top:height/3.0),
                              child: Container(
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
            )
            :  Shimmer(
          color: Colors.white54,
              child: Material(
                        elevation: 5,
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(18),
                        child: Container(
                height:height/2.8866,
                width:width/1.37,
                decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(18)
                ),
                child: Column(
                  children: [
                    Lottie.asset(dataLoadingLottie),
                    KText(
                      text: "Loading "+processPercentage.toString() + "%",
                      style: TextStyle(
                          fontFamily: "Davish",
                          color: Colors.black,
                          fontSize: width/22.8333,
                          letterSpacing: 0.3
                      ),
                    ),
                  ],
                )),
                      ),
            )
            : Shimmer(
              color: Colors.white54,
          child: Material(
               elevation: 5,
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(18),
                child: Container(
                height:height/2.8866,
                width:width/1.37,
                           decoration: BoxDecoration(
                 color: Colors.grey.shade100,
                 borderRadius: BorderRadius.circular(18)
                           ),
                child: Column(
                  children: [
                    Lottie.asset(dataLoadingLottie),
                     KText(
                      text: "Loading "+processPercentage.toString() + "%",
                      style: TextStyle(
                          fontFamily: "Davish",
                          color: Colors.black,
                          fontSize: width/22.8333,
                          letterSpacing: 0.3
                      ),
                    ),
                  ],
                )),
              ),
            )
      ),

      floatingActionButton:

      FloatingActionButton(

        onPressed: () async {
          Receiver();
          print("))))))))))))))))))))))))))))))))))))))");

          String networkImageUrl = 'https://firebasestorage.googleapis.com/v0/b/kp-enterpries.appspot.com/o/Images%2Fpngwing.com%20(3).png?alt=media&token=d332615e-286d-4e9a-bd12-d78877009e0d';

          String path = '$filepath/${DateTime.now().millisecondsSinceEpoch}result.mp4';
          String outputFilePath = path;

          await _overlayImageOnVideo(networkImageUrl, outputFilePath);
        },
        child: const Icon(Icons.save),
      ),


    );
  }


  final Dio dio = Dio();
  bool loading = false;
  double progress = 0;
  var filepath;

  Future<bool> createpath() async {
    print("Creating");
    Directory directory;
    try {
      if (Platform.isAndroid) {
        print("Android");
        print(_requestPermission(Permission.manageExternalStorage));
        if (await _requestPermission(Permission.manageExternalStorage)) {
          directory = (await getExternalStorageDirectory())!;
          String newPath = "";
          print(directory);
          List<String> paths = directory.path.split("/");
          for (int x = 1; x < paths.length; x++) {
            String folder = paths[x];
            if (folder != "Android") {
              newPath += "/" + folder;
            } else {
              break;
            }
          }
          newPath = newPath + "/KPE";
          directory = Directory(newPath);
        } else {
          return false;
        }
      }
      else {
        if (await _requestPermission(Permission.manageExternalStorage)) {
          directory = await getTemporaryDirectory();
        } else {
          return false;
        }
      }
      setState(() {
        filepath = directory.path;
      });
      print(directory.path);
      if (!await directory.exists()) {
        await directory.create(recursive: true);
      }
      if (await directory.exists()) {
        setState(() {
          filepath = directory.path;
        });
        print(directory.path);
      }
      return true;
    }
    catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> _requestPermission(Permission permission) async {

    if (await permission.isGranted) {
      return true;
    }
    else {
      print("reyyyyy");
      print(PermissionStatus.granted);
      var result = await permission.request();
      if (result == true) {
        return true;
      }
    }
    return false;
  }

  bool isloading = false;

    Future<void> _overlayImageOnVideo(String networkImageUrl, String outputFilePath) async {
      _simulateSendingEvents();

      double height=MediaQuery.of(context).size.height;
      double width=MediaQuery.of(context).size.width;

      print(_controller.value.size.height.round());
      print(_controller.value.size.width.round());

      print("controller valueeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee");

    FlutterFFmpeg _flutterFFmpeg = FlutterFFmpeg();

    setState(() {
      isloading = true;
    });

    final bytes = await controller.capture();

    setState(() {
      this.bytes = bytes;
    });


      print("bytes__________________________________________");
      print(bytes);
      print(bytes!.lengthInBytes.toString());
      print("Iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii");
      print(bytes.length);

    try {
      final img.Image? image = img.decodeImage(bytes!,frame: 60,);


      final img.Image resizedImage = img.copyResize(image!,  height: _controller.value.size.height.round(), width: _controller.value.size.width.round(),);

      final Uint8List resizedImageBytes = Uint8List.fromList(img.encodePng(resizedImage,));

      File overlayImageFile = File('${outputFilePath}_overlay.png');

      await overlayImageFile.writeAsBytes(resizedImageBytes);

      print(resizedImageBytes.length);

      await _flutterFFmpeg.execute('-i ${_controller.dataSource} -i ${overlayImageFile.path} -filter_complex "[0:v][1:v]overlay" -c:a copy $outputFilePath');

      await overlayImageFile.delete();

      print('Video with overlay saved successfully at $outputFilePath');

      setState(() {
        isloading = false;
        processPercentage=0;
        _eventListener.dispose();
      });
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Video Saved Successfully")));

    } catch (error) {

      print('Error: Failed to overlay image on video: $error');

    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _eventListener.dispose();
    //_disableEventReceiver();
    super.dispose();
  }


}



class RPSCustomPainter3 extends CustomPainter{

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
    path_0.moveTo(size.width*0.0019870,size.height*0.1);
    path_0.lineTo(size.width*0.2499344,size.height*0.1);
    path_0.lineTo(size.width*0.4855032,size.height*0.1);
    path_0.lineTo(size.width*0.6909379,size.height*0.1);
    path_0.lineTo(size.width*0.8625348,size.height*0.1);
    path_0.lineTo(size.width*1.0068356,size.height*0.8539849);
    path_0.lineTo(size.width*0.8644223,size.height*0.8539849);
    path_0.lineTo(size.width*0.6001767,size.height*0.8585738);
    path_0.lineTo(size.width*0.3653432,size.height*0.8606276);
    path_0.lineTo(size.width*0.2113933,size.height*0.8619084);
    path_0.lineTo(size.width*0.0589653,size.height*0.8642035);
    path_0.lineTo(size.width*-0.0009003,size.height*0.8642870);
    path_0.lineTo(size.width*0.0019870,size.height*0.9938873);
    path_0.close();

    canvas.drawPath(path_0, paint_fill_0);


    // Layer 1

    Paint paint_stroke_0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
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


class EventListener {
  final StreamController<double> _controller = StreamController<double>();
  Stream<double> get onEvent => _controller.stream;

  void sendEvent(double event) {
    _controller.add(event);
  }

  void dispose() {
    _controller.close();
  }
}


