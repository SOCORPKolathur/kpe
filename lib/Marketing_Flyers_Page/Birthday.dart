import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import '../Photo_View-Page/PhotoView_Page.dart';
import '../Translator_Module/Translator_Module_Page.dart';
import 'package:http/http.dart' as http;

import '../const File Page.dart';

class birthday extends StatefulWidget {
  String Type;

  birthday(this.Type);

  @override
  State<birthday> createState() => _birthdayState();
}

class _birthdayState extends State<birthday> {
  List<String> PortraitImagelist = [];
  List<String> landscapeImagelist = [];

  bool landscapeselcted = true;
  bool portratitselcted = false;

  getimagesizefunction() async {
    setState(() {
      PortraitImagelist.clear();
      landscapeImagelist.clear();
    });
    var getimagesize = await FirebaseFirestore.instance
        .collection("WishesImage")
        .where("type", isEqualTo: widget.Type)
        .get();
    for (int i = 0; i < getimagesize.docs.length; i++) {
      final response =
          await http.get(Uri.parse(getimagesize.docs[i]['img'].toString()));
      final bytes = response.bodyBytes;
      final decodedImage = await decodeImageFromList(bytes);

      if (decodedImage.width > decodedImage.height) {
        setState(() {
          PortraitImagelist.add(getimagesize.docs[i]['img'].toString());
        });
      } else {
        setState(() {
          landscapeImagelist.add(getimagesize.docs[i]['img'].toString());
        });
      }
    }
  }

  int documentLimit = 6;
  DocumentSnapshot? lastDocument;
  DocumentSnapshot? lastDocument1;
  bool isLoading1 = false;
  bool hasMore = true;
  ScrollController _scrollController = ScrollController();

  getUsers() async {
    print( widget.Type);
    print("Type++++++++++++++++++++++++++");
    print(usersList.length);
    print("User Listssssssssssssssssssssssssssssssssssssssssssssssssss");
    if (!hasMore) {
      print('No More Users');
      return;
    }
    if (isLoading1) {
      return;
    }
    setState(() {
      isLoading1 = true;
    });
    QuerySnapshot querySnapshot;
    if (lastDocument == null) {
      querySnapshot = await FirebaseFirestore.instance
          .collection('WishesImage')
          .where("type", isEqualTo: widget.Type)
          .limit(documentLimit)
          .get();
      print("IfFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF");
    }
    else {
      querySnapshot = await FirebaseFirestore.instance
          .collection('WishesImage')
          .where("type", isEqualTo: widget.Type)
          .startAfterDocument(lastDocument!)
          .limit(documentLimit)
          .get();
      print("Else Fucntion++++++++++++++++++++++++++++++++++++++++++++++++++++");
    }
    if (querySnapshot.docs.length < documentLimit) {
      hasMore = false;
    }
    lastDocument = querySnapshot.docs[querySnapshot.docs.length - 1];
    usersList.addAll(querySnapshot.docs);
    isLoading1 = false;

    print(usersList.length);
    print("User Listssssssssssssssssssssssssssssssssssssssssssssssssss");
  }

  String userName = "";
  String userEmail = "";
  String userImg = "";
  String userPhone = "";
  String companyName = "";
  String companyType = "";
  String companyIMage = "";

  List<DocumentSnapshot> usersList = [];

  @override
  void initState() {
    setState(() {
      isLoading1 = false;
    });
    //getimagesizefunction();
    getUsers();
    getDateFromUser();

    _scrollController.addListener(() {
      print("???????????????????????????????????????");
      double maxScroll = _scrollController.position.maxScrollExtent;
      double currentScroll = _scrollController.position.pixels;
      double delta = MediaQuery.of(context).size.height * 0.60;
      if ((maxScroll - currentScroll) <= delta) {
        getUsers();
      }
    });


    // TODO: implement initState
    super.initState();
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
                height: height / 30.062,
                width: width / 1.418,
                child: FittedBox(
                  alignment: Alignment.centerLeft,
                  fit: BoxFit.contain,
                  child: KText(
                    text: '${widget.Type} Flyers',
                    style: const TextStyle(
                        fontFamily: "Davish",
                        color: Colors.white,
                        letterSpacing: 0.3),
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
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          usersList.isEmpty?Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Material(
                  elevation: 1,
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                  shadowColor: Colors.green,
                  child: SizedBox(
                    height:height/3.024,
                    width: width/1.44,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: height/3.78,
                          width: width/1.8,
                          child: Lottie.asset(Nodatalottie,fit: BoxFit.cover),
                        ),
                        SizedBox(height: height/75.6,),
                        Text("No Data",style: TextStyle(fontSize: width/20,
                        fontFamily: "Davish",),)
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ):
          GridView.builder(
            shrinkWrap: true,
            controller: _scrollController,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 80 / 110),
            itemCount: usersList.length,
            itemBuilder: (context, index) {
              ImageModel image = ImageModel.fromJson(
                  usersList[index].data() as Map<String, dynamic>);

              return GestureDetector(
                onTap: () async {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Photo_View_Page(
                            image.Image.toString(),
                            userImg,
                            userName,
                            userPhone,
                            userEmail,
                            companyName,
                            companyType,
                            companyIMage),
                      ));
                },
                child: CachedNetworkImage(
                  imageUrl: image.Image.toString(),
                  imageBuilder: (context, imageProvider) => Container(
                    margin: const EdgeInsets.all(5),
                    height: height / 16.539,
                    width: width / 7.762,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: imageProvider,
                      ),
                    ),
                  ),
                  placeholder: (context, url) => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: height / 25.033,
                        width: width / 12,
                        child: const CircularProgressIndicator(),
                      ),
                    ],
                  ),
                  errorWidget: (context, url, error) =>
                  const Icon(Icons.error),
                ),
              );
            },
          ),
          isLoading1?Container(
            width: width/1,
            decoration: BoxDecoration(
              color: Color(0xff0C9346)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Loading",style:TextStyle(
              fontFamily: "Davish",color: Colors.white)),
                Lottie.asset(lottieLoading,height: height/15.12,),
              ],
            ),
          ):const SizedBox()
        ],
      )
    );
  }

  getDateFromUser() async {
    print("user+++++++++++++++++++++++++++++++++++++++");
    var getdata = await FirebaseFirestore.instance
        .collection("Users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    Map<String, dynamic>? value = getdata.data();
    setState(() {
      userName = value!['Name'];
      userEmail = value['Email'];
      userImg = value['Img'];
      userPhone = value['Phone'];
      companyName = value['companyName'];
      companyType = value['companyType'];
    });

    var companyData = await FirebaseFirestore.instance
        .collection("CompanyType")
        .where("Name", isEqualTo: companyType.toString())
        .get();

    if (companyData.docs.length > 0) {
      setState(() {
        companyIMage = companyData.docs[0]['Img'];
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

class ImageModel {
  String? Image;

  ImageModel({this.Image});

  ImageModel.fromJson(Map<String, dynamic> json) {
    Image = json['img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['img'] = this.Image;

    return data;
  }
}
