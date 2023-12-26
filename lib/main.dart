import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'Auth Pages/Login_Page.dart';
import 'Landing Screen/Landing-Screen_Page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'firebase_options.dart';


Future<void>_firebasemesssaghandler(RemoteMessage message)async{
  await Firebase.initializeApp();
  print(message.messageId);
  print("Messinginggggggggggggggggggggggggggggggggg");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseAppCheck.instance.activate();
  FirebaseMessaging.onBackgroundMessage(_firebasemesssaghandler);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
  var delegate = await LocalizationDelegate.create(
      basePath: 'assets/i18n/',
      fallbackLocale: 'en_US',
      supportedLocales: ['ta','te','ml','kn','en_US','bn','hi','es','pt','fr','nl','de','it','sv']);
  await FlutterDownloader.initialize(
      debug: true, // optional: set false to disable printing logs to console
    ignoreSsl:true ,
  );
  FontLoader fontLoader = FontLoader('Davish.ttf');
  fontLoader.addFont(load('assets/fonts/Davish.ttf'));
  fontLoader.load();
  runApp(LocalizedApp(delegate, MyApp()));
}

Future<ByteData> load(String asset) async {
  return await rootBundle.load(asset);
}
class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    var localizationDelegate = LocalizedApp.of(context).delegate;
    return LocalizationProvider(
      state: LocalizationProvider.of(context).state,
      child: MaterialApp(
        title: 'KALPANA ENTERPRISES',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle.dark,
          ),
        ),
        home:
        //Demo_Page(),
       FirebaseAuth.instance.currentUser==null?const loginpage(): firstpage(),
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          localizationDelegate
        ],
        supportedLocales: localizationDelegate.supportedLocales,
        locale: localizationDelegate.currentLocale,
      ),
    );
  }
}


