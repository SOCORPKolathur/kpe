import 'dart:io';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kpe/Landing%20Screen/Landing-Screen_Page.dart';
import 'package:lottie/lottie.dart';
import '../Translator_Module/Translator_Module_Page.dart';
import '../const File Page.dart';

class SetProfile_Page extends StatefulWidget {
  String? UserDocid;
  String? UserPhoneNumber;

  SetProfile_Page({this.UserDocid,this.UserPhoneNumber});

  @override
  State<SetProfile_Page> createState() => _SetProfile_PageState();
}

class _SetProfile_PageState extends State<SetProfile_Page> {
  List<String> comPanyTypeList = ["Select Company Type"];
  TextEditingController Namecon = TextEditingController();
  TextEditingController Phonecon = TextEditingController();
  TextEditingController emailcon = TextEditingController();
  TextEditingController companyNamecon = TextEditingController();
  TextEditingController companyTypecon =
      TextEditingController(text: "Select Company Type");

  @override
  void initState() {
    setState(() {
      Phonecon.text=widget.UserPhoneNumber.toString();
    });
    // TODO: implement initState
    dropDownData();

    super.initState();
  }

  dropDownData() async {
    var document = await FirebaseFirestore.instance.collection("CompanyType").orderBy("Name").get();
    print(document.docs.length);
    for (int j = 0; j < document.docs.length; j++) {
      setState(() {
        comPanyTypeList.add(document.docs[j]['Name']);
      });
    }
    print(comPanyTypeList);
  }


  File? imageFile;
  String Uploadimage = '';
  FirebaseStorage fs = FirebaseStorage.instance;
  bool Loading = false;

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
                Navigator.pop(context);
              },
              child: Padding(
                padding: EdgeInsets.only(left: width / 102.857),
                child: const Icon(Icons.arrow_back_ios_new_rounded),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: width / 27.428),
              child: SizedBox(
                //  width:width/1.6457,
                height: height / 30.062,
                width: width / 1.418,
                child: const FittedBox(
                  alignment: Alignment.centerLeft,
                  fit: BoxFit.contain,
                  child: KText(
                    text: 'Set Profile',
                    style: TextStyle(
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
        alignment: Alignment.centerLeft,
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    imageFile == null
                        ? SizedBox(
                            height: height / 4.7,
                            width: width / 1.6457,
                            child: Lottie.asset(
                              profile,
                              fit: BoxFit.fill,
                            ))
                            : Container(
                                height: height / 6.0,
                                width: width / 2.9,
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade300,
                                    borderRadius: BorderRadius.circular(100),
                                    image: DecorationImage(
                                        image: FileImage(imageFile!),
                                        fit: BoxFit.cover)),
                              ),
                    GestureDetector(
                      onTap: () {
                        imageFromGallery();
                      },
                      child: Padding(
                        padding: EdgeInsets.only(
                          bottom:
                              imageFile == null ? height / 80.6 : height / 90.6,
                          left: width / 5.0,
                        ),
                        child: Material(
                          elevation: 15,
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.white,
                          child: SizedBox(
                            child: Icon(Icons.edit),
                            height: height / 20.0,
                            width: width / 10,
                          ),
                        ),
                      ),
                    )
                  ],
                ),

                ///name controller
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: width / 1.6457,
                          height: height / 35.062,
                          child: const FittedBox(
                            fit: BoxFit.contain,
                            alignment: Alignment.centerLeft,
                            child: KText(
                              text: "Name",
                              style: TextStyle(
                                fontFamily: "Davish",
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height / 87.657,
                        ),
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
                                fontSize: width / 25.402,
                                color: Colors.grey),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.only(
                                  left: width / 41.143,
                                )),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: height / 58.438,
                ),

                ///Phone controller
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: width / 1.6457,
                          height: height / 35.062,
                          child: const FittedBox(
                            alignment: Alignment.centerLeft,
                            fit: BoxFit.contain,
                            child: KText(
                              text: "Phone",
                              style: TextStyle(
                                fontFamily: "Davish",
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height / 87.657,
                        ),
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
                                fontSize: width / 25.402,
                                color: Colors.grey),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.only(
                                  left: width / 41.143,
                                )),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: height / 58.438,
                ),

                ///email controller
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: width / 1.6457,
                          height: height / 35.062,
                          child: const FittedBox(
                            fit: BoxFit.contain,
                            alignment: Alignment.centerLeft,
                            child: KText(
                              text: "Email",
                              style: TextStyle(
                                fontFamily: "Davish",
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height / 87.657,
                        ),
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
                                fontSize: width / 25.402,
                                color: Colors.grey),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.only(
                                  left: width / 41.143,
                                )),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: height / 58.438,
                ),

                ///Company Name

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: width / 1.6457,
                          height: height / 35.062,
                          child: const FittedBox(
                            fit: BoxFit.contain,
                            alignment: Alignment.centerLeft,
                            child: KText(
                              text: "Company Name",
                              style: TextStyle(
                                fontFamily: "Davish",
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height / 87.657,
                        ),
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
                            controller: companyNamecon,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: width / 25.402,
                                color: Colors.grey),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.only(
                                  left: width / 41.143,
                                )),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: height / 58.438,
                ),

                ///COmpany Type

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: width / 1.6457,
                          height: height / 35.062,
                          child: const FittedBox(
                            fit: BoxFit.contain,
                            alignment: Alignment.centerLeft,
                            child: KText(
                              text: "Company Type",
                              style: TextStyle(
                                fontFamily: "Davish",
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height / 87.657,
                        ),
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
                          child: DropdownButtonHideUnderline(
                            child: DropdownButtonFormField2<String>(
                              isExpanded: true,
                              hint: Text(
                                'Select Company Type',
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontSize: width / 25.402,
                                    color: Colors.grey),
                              ),
                              items: comPanyTypeList
                                  .map(
                                      (String item) => DropdownMenuItem<String>(
                                            value: item,
                                            child: Text(
                                              item,
                                              style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: width / 25.402,
                                                  color: Colors.grey),
                                            ),
                                          ))
                                  .toList(),
                              value: companyTypecon.text,
                              onChanged: (String? value) {
                                setState(() {
                                  companyTypecon.text = value!;
                                });
                              },
                              buttonStyleData: ButtonStyleData(
                                padding: EdgeInsets.symmetric(
                                    horizontal: width / 22.5),
                                height: height / 18.9,
                                width: width / 2.571,
                              ),
                              menuItemStyleData: MenuItemStyleData(
                                height: height / 18.9,
                              ),
                              decoration:
                                  InputDecoration(border: InputBorder.none),
                            ),
                          ),
                          /*  TextField(
                                controller: companyTypecon,
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontSize: width/25.402,
                                    color: Colors.grey),
                                decoration:
                                InputDecoration(border: InputBorder.none,
                                    contentPadding: EdgeInsets.only(left: width/41.143,
                                    )
                                ),
                              ),*/
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: height / 29.219,
                ),

                ///submit button

                GestureDetector(
                  onTap: () {
                    setState(() {
                      Loading = true;
                    });
                    userdataupdata();
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
                    child: Center(
                      child: SizedBox(
                        width: width / 1.6457,
                        height: height / 35.062,
                        child: const FittedBox(
                          alignment: Alignment.center,
                          fit: BoxFit.contain,
                          child: KText(
                              text: "Submit",
                              style: TextStyle(
                                fontFamily: "Davish",
                                fontWeight: FontWeight.w500,
                                color: Color(0xffffffff),
                              )),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height / 29.219,
                ),
              ],
            ),
          ),
          Loading == true
              ? Padding(
                  padding: EdgeInsets.only(left: width / 3.266),
                  child: Material(
                    elevation: 50,
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(8),
                    shadowColor: Colors.black12,
                    child: Container(
                      width: width / 2.45,
                      height: height / 5.0125,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(8)),
                      child: Column(
                        children: [
                          Lottie.asset(OverAllLoading,
                              fit: BoxFit.fill,
                              width: width / 2.45,
                              height: height / 7.29090),
                          KText(
                            text: 'Please Wait',
                            style: TextStyle(
                                fontFamily: "Davish",
                                color: Colors.black,
                                fontSize: width / 23.058,
                                letterSpacing: 0.3),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              : const SizedBox()
        ],
      ),
    );
  }

  ///userdata Update Fucntion
  userdataupdata() async {
    if (imageFile != null) {
      print("Image FIle FUnction Entered dddddd");
      print(imageFile);
      var ref = FirebaseStorage.instance
          .ref()
          .child('Images')
          .child("$imageFile.jpg");
      var uploadTask =
          await ref.putFile(imageFile!).catchError((error) async {});
      var image = await uploadTask.ref.getDownloadURL();
      setState(() {
        Uploadimage = image;
      });
      print("Upload Images++++++++++++++++++++++++++++++++++++++");
      print(Uploadimage);
      FirebaseFirestore.instance
          .collection("Users")
          .doc(widget.UserDocid)
          .update({
        "Name": Namecon.text,
        "Email": emailcon.text,
        "Phone": Phonecon.text,
        "companyType": companyTypecon.text,
        "companyName": companyNamecon.text,
        "Img": Uploadimage
      });
      clearcontroller();
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => firstpage(),));
    }

    else  {
      FirebaseFirestore.instance.collection("Users")
          .doc(widget.UserDocid)
          .update({
        "Name": Namecon.text,
        "Email": emailcon.text,
        "Phone": Phonecon.text,
        "companyType": companyTypecon.text,
        "companyName": companyNamecon.text,
        "Img": Uploadimage
      });
      clearcontroller();
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => firstpage(),));
    }
  }

  clearcontroller() {
    Namecon.clear();
    emailcon.clear();
    Phonecon.clear();
    companyNamecon.clear();
    setState(() {
      companyTypecon.text = "Select Company Type";
      Loading = false;
    });
  }

  imageFromGallery() async {
    var pickedFile =
        (await ImagePicker().pickImage(source: ImageSource.gallery));
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }
}
