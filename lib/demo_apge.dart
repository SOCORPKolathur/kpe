/*
import 'dart:async';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:http/http.dart'as http;
import 'package:permission_handler/permission_handler.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:tapioca/tapioca.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  final navigatorKey = GlobalKey<NavigatorState>();
  late XFile _video;
  bool isLoading = false;
  static const EventChannel _channel =
      const EventChannel('video_editor_progress');
  late StreamSubscription _streamSubscription;
  int processPercentage = 0;

  @override
  void initState() {
    super.initState();
    _enableEventReceiver();
  }

  @override
  void dispose() {
    super.dispose();
    _disableEventReceiver();
  }

  void _enableEventReceiver() {
    _streamSubscription =
        _channel.receiveBroadcastStream().listen((dynamic event) {
      setState(() {
        processPercentage = (event.toDouble() * 100).round();
      });
    }, onError: (dynamic error) {
      print('Received error: ${error.message}');
    }, cancelOnError: true);
  }

  void _disableEventReceiver() {
    _streamSubscription.cancel();
  }

  String url= "https://firebasestorage.googleapis.com/v0/b/kp-enterpries.appspot.com/o/big_buck_bunny_480p_10mb.mp4?alt=media&token=4499feea-6797-4192-9baf-ad3b2f579623";

  _pickVideo() async {
    try {
      final ImagePicker _picker = ImagePicker();
      XFile? video = await _picker.pickVideo(source: ImageSource.gallery);
      if (video != null) {
        setState(() {
          _video = video;
          isLoading = true;
        });
      }
    } catch (error) {
      print(error);
    }
  }


  _asyncMethod() async {
    String firebaseVideoUrl="https://firebasestorage.googleapis.com/v0/b/kp-enterpries.appspot.com/o/big_buck_bunny_480p_10mb.mp4?alt=media&token=4499feea-6797-4192-9baf-ad3b2f579623";
    var tempDir = await getTemporaryDirectory();
    final path = '${tempDir.absolute.path}/${DateTime.now().millisecondsSinceEpoch}result.mp4';
    final imageBitmap = (await rootBundle.load("assets/76.png")).buffer.asUint8List();

    print(tempDir);
    print(imageBitmap);
    print(path);
    print("++++++++++++++++++++++++++++++++++++++++++oooooooooooooooooooooooooooooooooooo+");

    try {
      final firebaseStorage = FirebaseStorage.instance;
      assert(firebaseStorage.refFromURL(firebaseVideoUrl) != null, 'Invalid Firebase Storage URL');
      final ref = firebaseStorage.refFromURL(firebaseVideoUrl);
      File? videoFile = File(path);
      print("File Type into Firebase Storage======================++++++++++++++++++++");
      print(videoFile.runtimeType);
      //await ref.writeToFile(videoFile);
      final success= await ref.writeToFile(videoFile);
      print("File write into File successfully)))))))))))))))))))))))))))))))))))((((");
      final tapiocaBalls = [
        TapiocaBall.imageOverlay(imageBitmap, 600, 600),
      ];
      print("Staus Code in firebase++++++++++++++++++++++++++++++++++++");
      print(success.state);
      if (success != null) {
        print("Sucesssssssss ============================Write File+++++++++++++++++++++++++++");

        print(videoFile.path);
        final cup = Cup(Content(videoFile.path), tapiocaBalls);
        print(tapiocaBalls.length);
        print("Number of Tapioca Balls: ${cup.tapiocaBalls.length}");
        print("Resulting Video Path: $path");
        print(cup.content.name.toString());
        cup.suckUp(path);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VideoScreen(path)),
          );

      }

*/
/*      print("File Convert Successfully+++++++++++++++++++++++++++++++++++++++++++");
       print(videoFile.path.toString());
       print("Video File Path++++++++++++++++++++++++++++++++++++++++++++");


      print("Tapioca Balls: $tapiocaBalls");
      print("Will start processing ----------------------------------------");
      final cup = Cup(Content(videoFile.path), tapiocaBalls);
      print(tapiocaBalls.length);
      print("Number of Tapioca Balls: ${cup.tapiocaBalls.length}");
      print("Resulting Video Path: $path");
      print(cup.content.name.toString());
      print("Video Processing Start+++++++++++++++++++++++++++++++++++++++++++++++++++");
      cup.suckUp(path).then((value) {
        print("${value}6666666666666666666666666666666666666666666666666666666");
        print("Processing finished");
        setState(() {
          processPercentage = 0;
        });
        print("Saving video to gallery...");
        GallerySaver.saveVideo(path).then((bool? success) {
          print("Video saved to gallery: $success");
        });
        final currentState = navigatorKey.currentState;
        if (currentState != null) {
          currentState.push(
            MaterialPageRoute(
              builder: (context) => VideoScreen(path),
            ),
          );
        }
        setState(() {
          isLoading = false;
        });
      }).
      catchError((error) {
        print('Error during video processing: $error');
        print("Processing error: $error");
        setState(() {
          isLoading = false;
        });
      });*//*

    }
    on PlatformException
    catch (platformException) {
      print(
          "PlatForm_____________________________________________");
      print("Platform Exception: ${platformException.message}");
      print("Platform Exception: ${platformException.code}");
      print(
          "Error during video processing: $platformException");
      setState(() {
        isLoading = false;
      });
    } catch (error, stackTrace) {
      print('Unexpected Error: $error');
      print("rrrrrrrrrrrrrrrrrrrrrrr$stackTrace");
      setState(() {
        isLoading = false;
      });
    }


  }


  Future<XFile?> downloadVideoAndConvertToFile(String videoUrl) async {
    try {
      // Fetch the video bytes
      final http.Response response = await http.get(Uri.parse(videoUrl));
      final Uint8List videoBytes = response.bodyBytes;

      // Create a temporary file to save the video
      final File tempFile = File('${DateTime.now().millisecondsSinceEpoch}.mp4');
      await tempFile.writeAsBytes(videoBytes);

      // Convert the file path to XFile
      final XFile xFile = XFile(tempFile.path);

      return xFile;
    } catch (e) {
      print('Error downloading and converting video: $e');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: isLoading
              ? Column(mainAxisSize: MainAxisSize.min, children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 10),
                  Text(
                    processPercentage.toString() + "%",
                    style: TextStyle(fontSize: 20),
                  ),
                ])
              : ElevatedButton(
                  child: Text("Pick a video and Edit it"),
                   onPressed: () async {
                     _asyncMethod();
                  },

                 */
/* onPressed: () async {
                    print("clicked!");

                    await _pickVideo();
                    //XFile? xFile = await downloadVideoAndConvertToFile(videoUrl);

                   //  String firebaseVideoUrl =
                   //      "https://firebasestorage.googleapis.com/v0/b/kp-enterpries.appspot.com/o/big_buck_bunny_480p_10mb.mp4?alt=media&token=4499feea-6797-4192-9baf-ad3b2f579623";
                     var tempDir = await getTemporaryDirectory();
                     final path = '${tempDir.absolute.path}/${DateTime.now().millisecondsSinceEpoch}result.mp4';
                     final imageBitmap = (await rootBundle.load("assets/76.png")).buffer.asUint8List();
                   //
                     print(tempDir);
                     print(imageBitmap);
                     print(path);
                     print(
                        "++++++++++++++++++++++++++++++++++++++++++oooooooooooooooooooooooooooooooooooo+");

                    try {

                     // final firebaseStorage = FirebaseStorage.instance;
                     //
                     // assert(firebaseStorage.refFromURL(firebaseVideoUrl) != null, 'Invalid Firebase Storage URL');
                     //
                     // final ref = firebaseStorage.refFromURL(firebaseVideoUrl);
                     // final videoFile = File(path);

                   //  print("File Type into Firebase Storage======================");
                     // print(videoFile.runtimeType);
                     //  if(await videoFile.existsSync()){
                     //    print(videoFile.absolute.path);
                     //    print(videoFile.path);
                     //    print(videoFile.uri.path);
                     //    print("Path is Craeteeeeeeeeeeeeeeeeeeeeeeeeeddddd");
                     //  }
                     //  else{
                     //    print("Path is Invaliddddddddddddddddddddddd");
                     //    print(videoFile.absolute.path);
                     //    print(videoFile.path);
                     //    print(videoFile.uri.path);
                     //    print('/////////////////////////////////////////');
                     //  }
                   //   await ref.writeToFile(videoFile);

                    //  print(videoFile.path.toString());
                      final tapiocaBalls = [
                        TapiocaBall.imageOverlay(imageBitmap, 600, 600),
                      ];

                      print("Tapioca Balls: $tapiocaBalls");
                      print("Will start processing ----------------------------------------");


                      final cup = Cup(Content(_video.path), tapiocaBalls);
                      print(tapiocaBalls.length);
                      print(
                          "Number of Tapioca Balls: ${cup.tapiocaBalls.length}");
                      print("Resulting Video Path: $path");

                      print(cup.content.name.toString());

                      cup.suckUp(path).then((value) {
                        print(
                            "${value}6666666666666666666666666666666666666666666666666666666");
                        print("Processing finished");
                        setState(() {
                          processPercentage = 0;
                        });
                        print("Saving video to gallery...");
                        // GallerySaver.saveVideo(path).then((bool? success) {
                        //   print("Video saved to gallery: $success");
                        // });

                        final currentState = navigatorKey.currentState;
                        if (currentState != null) {
                          currentState.push(
                            MaterialPageRoute(
                              builder: (context) => VideoScreen(path),
                            ),
                          );
                        }

                        setState(() {
                          isLoading = false;
                        });
                      }).
                      catchError((error) {
                        print('Error during video processing: $error');
                        print("Processing error: $error");
                        setState(() {
                          isLoading = false;
                        });
                      });
                    }
                    on PlatformException
                    catch (platformException) {
                      print(
                          "PlatForm_____________________________________________");
                      print("Platform Exception: ${platformException.message}");
                      print("Platform Exception: ${platformException.code}");
                      print(
                          "Error during video processing: $platformException");
                      setState(() {
                        isLoading = false;
                      });
                    } catch (error, stackTrace) {
                      print('Unexpected Error: $error');
                      print("rrrrrrrrrrrrrrrrrrrrrrr$stackTrace");
                      setState(() {
                        isLoading = false;
                      });
                    }
                  },*//*

                ),
        ),
      ),
    );
  }

  Vieoofunc() async {
    await _pickVideo();
    print("clicked!");
    String firebaseVideoUrl =
        "https://firebasestorage.googleapis.com/v0/b/kp-enterpries.appspot.com/o/big_buck_bunny_480p_10mb.mp4?alt=media&token=4499feea-6797-4192-9baf-ad3b2f579623";
    var tempDir = await getTemporaryDirectory();
    final path =
        '${tempDir.path}/${DateTime.now().millisecondsSinceEpoch}result.mp4';
    final imageBitmap =
        (await rootBundle.load("assets/76.png")).buffer.asUint8List();

    try {
      print("11111111111111111111111111111111111111");
      final firebaseStorage = FirebaseStorage.instance;
      print("2222222222222222222222222222222222222222");
      final ref = firebaseStorage.refFromURL(firebaseVideoUrl);
      print("33333333333333333333333333333333");
      final videoFile = File(path);
      print("444444444444444444444444444");
      print(videoFile);
      print("}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}");

      await ref.writeToFile(videoFile);
      print("55555555555555555555555555");
      final tapiocaBalls = [
        TapiocaBall.imageOverlay(imageBitmap, 600, 600),
      ];
      print("666666666666666666666666666666666666666666");

      print("Firebase Video URL: $firebaseVideoUrl");
      print("Tapioca Balls: $tapiocaBalls");
      print("Video File: $videoFile");
      print("Will start processing ----------------------------------------");
      print("Video File Path: ${videoFile.path}");
      print("777777777777777777777777777777777777777777777777");
      final cup = Cup(Content(_video.path), tapiocaBalls);
      print("888888888888888888888888888888888888888888888888");
      print(tapiocaBalls.length);
      print("Number of Tapioca Balls: ${cup.tapiocaBalls.length}");
      print("Resulting Video Path: $path");
      print("9999999999999999999999999999999999999999");
      await cup.suckUp(path);
      print("1000000000000000100000000000000000000000000");
      print("Processing finished");
      setState(() {
        processPercentage = 0;
      });

      print("Saving video to gallery...");
      GallerySaver.saveVideo(path).then((bool? success) {
        print("Video saved to gallery: $success");
      });

      final currentState = navigatorKey.currentState;
      if (currentState != null) {
        currentState.push(
          MaterialPageRoute(
            builder: (context) => VideoScreen(path),
          ),
        );
      }

      setState(() {
        isLoading = false;
      });
    } on PlatformException catch (platformException) {
      print("Platform Exception: ${platformException.message}");
      setState(() {
        isLoading = false;
      });
    } catch (error, stackTrace) {
      print('Unexpected Error: $error');
      print('Stack Trace: $stackTrace');
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> processVideo() async {
    try {
      String firebaseVideoUrl =
          "https://firebasestorage.googleapis.com/v0/b/kp-enterpries.appspot.com/o/big_buck_bunny_480p_10mb.mp4?alt=media&token=4499feea-6797-4192-9baf-ad3b2f579623";

      // Get the temporary directory for storing the downloaded video
      var tempDir = await getTemporaryDirectory();
      final path =
          '${tempDir.path}/${DateTime.now().millisecondsSinceEpoch}result.mp4';
      final imageBitmap =
          (await rootBundle.load("assets/76.png")).buffer.asUint8List();

      // Download video from Firebase Storage
      await downloadVideo(firebaseVideoUrl, path);

      // List of TapiocaBalls for modifications
      final tapiocaBalls = [
        TapiocaBall.imageOverlay(imageBitmap, 600, 600),
      ];

      // Create a Cup with original content and modifications
      final cup = Cup(Content(path), tapiocaBalls);
      await cup.suckUp(path);
      // Further use of the cup, e.g., cup.suckUp(outputPath);

      print("Video processing completed.");
    } catch (e) {
      print("Error processing video: $e");
    }
  }

  Future<void> downloadVideo(String firebaseUrl, String localPath) async {
    try {
      final firebaseStorage = FirebaseStorage.instance;
      final ref = firebaseStorage.refFromURL(firebaseUrl);
      final videoFile = File(localPath);

      // Download the video from Firebase Storage
      await ref.writeToFile(videoFile);

      print("Video downloaded to $localPath");
    } catch (e) {
      print("Error downloading video: $e");
      throw e; // Rethrow the exception to indicate the failure
    }
  }
}

class VideoScreen extends StatefulWidget {
  final String path;

  VideoScreen(this.path);

  @override
  _VideoAppState createState() => _VideoAppState(path);
}

class _VideoAppState extends State<VideoScreen> {
  final String path;

  _VideoAppState(this.path);

  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.file(File(path))
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: _controller.value.isInitialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
            : Container(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            if (!_controller.value.isPlaying &&
                _controller.value.isInitialized &&
                (_controller.value.duration == _controller.value.position)) {
              _controller.initialize();
              _controller.play();
            } else {
              _controller.value.isPlaying
                  ? _controller.pause()
                  : _controller.play();
            }
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
*/



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




class MyVideoPlayer extends StatefulWidget {
  @override
  _MyVideoPlayerState createState() => _MyVideoPlayerState();
}

class _MyVideoPlayerState extends State<MyVideoPlayer> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    // Replace 'YOUR_NETWORK_VIDEO_URL' with the actual URL of the network video
    String networkVideoUrl = "https://firebasestorage.googleapis.com/v0/b/kp-enterpries.appspot.com/o/big_buck_bunny_480p_10mb.mp4?alt=media&token=4499feea-6797-4192-9baf-ad3b2f579623";
    _initializeVideoPlayer(networkVideoUrl);
    createpath();
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
    return Scaffold(
      appBar: AppBar(
        title: InkWell(
            onTap: (){

            },
            child: const Text('Video Player')),
      ),
      body: Center(
        child: isloading==false?_controller.value.isInitialized
            ? AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
          child: VideoPlayer(_controller),
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
    try {
      // Download the overlay image
      final http.Response response = await http.get(Uri.parse(networkImageUrl));
      final Uint8List imageBytes = response.bodyBytes;

      // Decode the image using the image package
      final img.Image? image = img.decodeImage(imageBytes);

      // Resize the image to the specified width and height
      final img.Image resizedImage =
      img.copyResize(image!, width: 50, height: 50);

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
