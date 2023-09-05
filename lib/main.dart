import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kpe/marketing.dart';
import 'package:kpe/premium%20plans.dart';
import 'package:kpe/premium.dart';

import 'Birthday.dart';
import 'Splash_Screen/Splash_Screen_Page.dart';
import 'firebase_options.dart';
import 'new endowment.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: homepage(),
    );
  }
}

