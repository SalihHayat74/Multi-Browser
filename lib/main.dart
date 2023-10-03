// import 'package:applovin_max/applovin_max.dart';
import 'package:applovin_max/applovin_max.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'screens/homescreen.dart';
import 'dart:io';
import 'package:animated_splash_screen/animated_splash_screen.dart';


List<String> testDeviceIds = ['825CB1F97AE1B8C6FBD9ADDA720F1BF3'];
final InAppLocalhostServer localhostServer = InAppLocalhostServer();

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  Map? sdkConfiguration = await AppLovinMAX.initialize("T0v8G_Hq1GwqqPMOuOSR_ib9TSbFc4NQwJiCvgfdaxK1mJuJBDCFTv39PkS1gHybTy8J8mORTM4aPndJzpTpQl");


  await localhostServer.start();


  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);

  if (Platform.isAndroid) {
    // WebStorageManager webStorageManager = WebStorageManager.instance();

    await AndroidInAppWebViewController.setWebContentsDebuggingEnabled(true);

    var swAvailable = await AndroidWebViewFeature.isFeatureSupported(
        AndroidWebViewFeature.SERVICE_WORKER_BASIC_USAGE);
    var swInterceptAvailable = await AndroidWebViewFeature.isFeatureSupported(
        AndroidWebViewFeature.SERVICE_WORKER_SHOULD_INTERCEPT_REQUEST);

    if (swAvailable && swInterceptAvailable) {
      AndroidServiceWorkerController serviceWorkerController =
      AndroidServiceWorkerController.instance();

      await serviceWorkerController
          .setServiceWorkerClient(AndroidServiceWorkerClient(
        shouldInterceptRequest: (request) async {
          return null;
        },
      ));
    }
  }

  // RequestConfiguration configuration = RequestConfiguration(testDeviceIds: testDeviceIds);

  // AppLovinMAX.setTestDeviceAdvertisingIds(testDeviceIds);
  // ?RequestConfiguration configuration = Builder().setTestDeviceIds(Arrays.asList("825CB1F97AE1B8C6FBD9ADDA720F1BF3"));
  //RequestConfiguration.Builder().setTestDeviceIds(Arrays.asList("825CB1F97AE1B8C6FBD9ADDA720F1BF3"));
  // RequestConfiguration configuration = RequestConfiguration(testDeviceIds: testDeviceIds);
  // MobileAds.instance.updateRequestConfiguration(configuration);


  // await Firebase.initializeApp();

  runApp(MyApp());

}

class MyApp extends StatelessWidget {MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print("I am at material app");
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: AnimatedSplashScreen(

          backgroundColor: Colors.white,
          duration: 1000,
          splash: const Image(image: AssetImage('assets/multi_tabber_icon.png'),),
          nextScreen: MyHomePage(),
          // nextScreen: YoutubeDownloaderPage(),
        )

    );
  }
}
