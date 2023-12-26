



import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:video_player/video_player.dart';
import 'package:dio/dio.dart';
import 'package:image/image.dart' as img;
import 'package:flutter_ffmpeg/flutter_ffmpeg.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'package:widgets_to_image/widgets_to_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import '../const File Page.dart';
import 'Photo_View-Page/PhotoView_Page.dart';




class MyVideoPlayer extends StatefulWidget {

  String ?videourl;
  String ?userImg;
  String ?userName;
  String ?userPhone;
  String ?userEmail;
  String ?companyName;
  String ?companyType;
  String ?companyIMage;
  MyVideoPlayer(this.videourl,this.userImg,this.userName,this.userPhone,this.userEmail,this.companyName,this.companyType,this.companyIMage);

  @override
  _MyVideoPlayerState createState() => _MyVideoPlayerState();
}

class _MyVideoPlayerState extends State<MyVideoPlayer> {
  late VideoPlayerController _controller;

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

  @override
  void initState() {
    super.initState();
    // Replace 'YOUR_NETWORK_VIDEO_URL' with the actual URL of the network video
    String networkVideoUrl = "https://firebasestorage.googleapis.com/v0/b/kp-enterpries.appspot.com/o/Marketing_video%2FWhatsApp%20Video%202023-12-07%20at%2012.05.47%20PM.mp4?alt=media&token=d5759e00-3da7-4fbc-ab6c-f87adb4e1395";
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
    //dropDownData();
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

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(


      appBar: AppBar(
        title: InkWell(
            onTap: (){
              print(height);

            },
            child: const Text('Video Player')),
      ),
      body: Center(
        child: isloading==false?_controller.value.isInitialized
            ? Stack(
              children: [
                Container(

                  child: AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
          child: VideoPlayer(_controller),
        ),
                ),
                WidgetsToImage(
                    controller: controller,
                    child:
                    GestureDetector
                      (
                        onTap:(){
                          print(height);
                          print(width);
                        },
                        child:
                        Container(
                          height:height/2.22,
                          width: width/1.01,
                          decoration: BoxDecoration(

                            // image: DecorationImage(
                            //   fit: BoxFit.contain,
                            //   image: NetworkImage(widget.img.toString(),),
                            // )
                          ),
                          child:
                          Align(
                              alignment: Alignment.bottomLeft,
                              child:
                              Stack(
                                alignment: Alignment.bottomLeft,
                                children: [


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
                                      margin:EdgeInsets.only(bottom:height/50.55),
                                      child:CustomPaint(
                                        size: Size(width,(width*0.833333333333334).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                                        painter: RPSCustomPainter2(
                                        ),
                                      )
                                  ),

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




                                ],
                              )),
                        ))
                ),
              ],
            )
            : const CircularProgressIndicator()
            : const CircularProgressIndicator(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {

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
    try {
      // Download the overlay image
      final http.Response response = await http.get(Uri.parse(networkImageUrl));
      final Uint8List imageBytes = response.bodyBytes;

      // Decode the image using the image package
      final img.Image? image = img.decodeImage(bytes!);

      // Resize the image to the specified width and height
      final img.Image resizedImage =
      img.copyResize(image!,  height: 363,
        width: _controller.value.size.width.round(),);

      // Convert the resized image to bytes
      final Uint8List resizedImageBytes = Uint8List.fromList(img.encodePng(resizedImage));

      File overlayImageFile = File('${outputFilePath}_overlay.png');

      await overlayImageFile.writeAsBytes(resizedImageBytes);

      await _flutterFFmpeg.execute(
        '-i ${_controller.dataSource} -i ${overlayImageFile.path} -filter_complex "[0:v][1:v]overlay" -c:a copy $outputFilePath',
      );
      // Delete the temporary overlay image file
      await overlayImageFile.delete();
      print('Video with overlay saved successfully at $outputFilePath');
      setState(() {
        isloading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Video Saved Sucessfully")));
    } catch (error) {
      print('Error: Failed to overlay image on video: $error');
    }
  }


  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
