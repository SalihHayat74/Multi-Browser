import 'dart:ui';

import 'package:applovin_max/applovin_max.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:multitabber2023/admob%20ads/banner%20ads.dart';
import 'package:multitabber2023/admob%20ads/interstial%20ads.dart';
import 'package:multitabber2023/admob%20ads/reward%20ads.dart';
import 'package:multitabber2023/app%20lovin%20ads/bannerAds.dart';
import 'package:multitabber2023/app%20lovin%20ads/mrec%20ad%20applovin.dart';
import '../app lovin ads/applovin interstital ad.dart';
import '../privacy policy.dart';
import '../widgets/account_one_webview.dart';
import '../widgets/inappwebview.dart';

const int maxFailedLoadAttempts = 3;


class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  final BannerAd myBanner = BannerAd(
    adUnitId: 'ca-app-pub-5228453034289149/4191722373',
    size: AdSize.banner,
    request: const AdRequest(),
    listener: const BannerAdListener(),
  );

  final AdSize adSize = AdSize(width:300,height: 50);

  final BannerAdListener listener = BannerAdListener(
    // Called when an ad is successfully received.
    onAdLoaded: (Ad ad) => print('Ad loaded.'),
    // Called when an ad request failed.
    onAdFailedToLoad: (Ad ad, LoadAdError error) {
      // Dispose the ad here to free resources.
      ad.dispose();
      print('Ad failed to load: $error');
    },
    // Called when an ad opens an overlay that covers the screen.
    onAdOpened: (Ad ad) => print('Ad opened.'),
    // Called when an ad removes an overlay that covers the screen.
    onAdClosed: (Ad ad) => print('Ad closed.'),
    // Called when an impression occurs on the ad.
    onAdImpression: (Ad ad) => print('Ad impression.'),
  );


  late String link ;
  late String webLink;

  // Future<void> clearCookies()async {
  //   await CookieManager.instance().deleteAllCookies();
  // }




  bool isLoading=true;
  bool initialized = false;
  // = 'https://youtu.be/wb7MDY-uOGM'
  @override
  initState(){
    MyApplovinBannerAds().initializeBannerAds();
    MyAppLovinInterstialAd().initializeInterstitialAds();
    MrecAd().initializeMRecAds();
    // clearCookies();
    // AppLovinMAX.showBanner('665c6d5ac255ace8');
    // MyAdmobInterstitialAds().interStitialAd();
    // myBanner.load();
    initialized = true;
    // MyAdmobRewardAds().rewardedAd();
    // MrecAd().initializeMRecAds();
    super.initState();

    // FetchLink();
}

    // void FetchLink() async{
    //
    //   // DocumentSnapshot blogLink = await FirebaseFirestore.instance.collection('Blog link').doc('1').get();
    //   DocumentSnapshot ytLink = await FirebaseFirestore.instance.collection('Youtube link').doc('1').get();
    //   link = ytLink.get('link');
    //   // webLink = blogLink.get('link');
    //   linkInitialized = true;
    //     isLoading=false;
    //
    //   setState(() {});
    // }

  TextEditingController url = TextEditingController();

  bool linkInitialized = true;
  bool defaultTab = true;
  bool tenTab = false;
  bool twentyTab = false;
  bool thirtyTab = false;
  bool fiftyTab = false;
  bool hundredTabs = false;
  bool visible = false;
  bool goPressed= false;

  var id = "1st WebView Id";

  @override
  Widget build(BuildContext context) {


    // InAppWebView _accountOne = InAppWebView(
    //   initialUrlRequest: URLRequest(url: Uri.parse(link)),
    // );
    // InAppWebView _accountTwo = InAppWebView(
    //   initialUrlRequest: URLRequest(url: Uri.parse(link)),
    // );

    final AdWidget adWidget = AdWidget(ad: myBanner);

    final Container adContainer = Container(
      alignment: Alignment.center,

      // width: MyAdmobBannerAds().myBanner.size.width.toDouble(),
      // height: MyAdmobBannerAds().myBanner.size.height.toDouble(),
      child: adWidget,
    );


    return Scaffold(
      bottomNavigationBar: MaxAdView(
          adUnitId: "665c6d5ac255ace8",
          adFormat: AdFormat.banner,
          listener: AdViewAdListener(onAdLoadedCallback: (ad) {

          }, onAdLoadFailedCallback: (adUnitId, error) {

          }, onAdClickedCallback: (ad) {

          }, onAdExpandedCallback: (ad) {

          }, onAdCollapsedCallback: (ad) {

          })
      ),
      // bottomNavigationBar:
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                border: Border(),
                borderRadius: BorderRadius.horizontal(left: Radius.circular(10),right: Radius.circular(10)),
                color: Colors.red,
              ),
              child: Center(child: Text('Multi Tabber 2023')),
            ),
            ListTile(
              title: const Text('Privacy Policy'),
              onTap: () {
                showDialog(context: context, builder: (context){
                  return AlertDialog(
                    content: SingleChildScrollView(child: Text(privacy)),
                  );
                });
                // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DischargedPatients(user: user,)));
              },
            ),
            MaxAdView(
                adUnitId: "37de30427233c136",
                adFormat: AdFormat.mrec,
                listener: AdViewAdListener(onAdLoadedCallback: (ad) {

                }, onAdLoadFailedCallback: (adUnitId, error) {

                }, onAdClickedCallback: (ad) {

                }, onAdExpandedCallback: (ad) {

                }, onAdCollapsedCallback: (ad) {

                })
            ),
            const Align(
                alignment: Alignment.bottomCenter,
                child: Text('Version 1.2'))
          ],
        ),
      ),
      appBar: AppBar(
        // leading: const Image(image: AssetImage('assets/images/ic_launcher.jpg')),
        leading: Builder(
          builder: (context){
            return IconButton(onPressed: ()=>Scaffold.of(context).openDrawer(),
              icon: const Icon(Icons.more_vert),);
          },
        ),
        backgroundColor: Colors.red,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Center(child: Text('Multi Tabber 2023')),
      ),
      body: Stack(
        children: [

          // if(linkInitialized)Column(
          //   children: [
          //     SizedBox(
          //         height: 200,
          //         width: 200,
          //         child: _accountOne),
          //     const SizedBox(height: 10,),
          //     SizedBox(
          //       height: 200,
          //       width: 200,
          //       child: InAppWebView(
          //         // windowId: 2,
          //         initialOptions: InAppWebViewGroupOptions(
          //             crossPlatform: InAppWebViewOptions(
          //
          //               // clearCache: true,
          //               // incognito: true,
          //
          //             )
          //         ),
          //         // initialData: "https://flutter.dev/",
          //         initialUrlRequest: URLRequest(url: Uri.parse("http://localhost:8080/assets/index.html")),
          //         onWebViewCreated: (controller) {},
          //         onLoadStart: (controller, url) {},
          //         onLoadStop: (controller, url) {},
          //       ),
          //     )
          //   ],
          // ),




          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(8),
            child: Column(

              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                          controller: url,

                          decoration: const InputDecoration(
                            label: Text('URL'),
                            hintText: 'Paste link here',
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  style: BorderStyle.none,
                                  color: Colors.black
                              ),

                            ),
                          )
                      ),
                    ),
                    const SizedBox(width: 10,),
                    ElevatedButton(

                        onPressed: () async{
                          MyAppLovinInterstialAd().isAdReady();

                          if(initialized== true) {
                            // MyAdmobInterstitialAds().interStitialAd();
                            // MyAdmobRewardAds().rewardedAd();
                          }
                          if (url.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Link is required",),
                                  backgroundColor: Colors.red,));
                          } else {
                            hundredTabs = false;
                            twentyTab = false;
                            thirtyTab = false;
                            fiftyTab = false;
                            tenTab = false;
                            linkInitialized = false;
                            visible = true;
                            goPressed = true;
                            setState(() {});
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red
                        ),
                        child: const Text('Go'))
                  ],
                ),
                visible?Visibility(
                  visible: visible,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(

                          onPressed: () {
                            // MyAppLovinInterstialAd().isAdReady();
                            hundredTabs = false;
                            twentyTab = false;
                            thirtyTab = false;
                            fiftyTab = false;
                            defaultTab = false;
                            link = url.text;
                            tenTab = true;

                            setState(() {});
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red
                          ),
                          child: SizedBox(
                            width: MediaQuery
                                .of(context)
                                .size
                                .width * .1,
                            child: const Text('10 tabs'),
                          )),
                      ElevatedButton(

                          onPressed: () {
                            // MyAppLovinInterstialAd().isAdReady();
                            hundredTabs = false;
                            tenTab = false;
                            thirtyTab = false;
                            fiftyTab = false;
                            defaultTab = false;
                            twentyTab = true;
                            link = url.text;
                            setState(() {});
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red
                          ),
                          child: SizedBox(
                            width: MediaQuery
                                .of(context)
                                .size
                                .width * .1,
                            child: const Text('20 tabs'),
                          )),
                      ElevatedButton(

                          onPressed: () {
                            // MyAppLovinInterstialAd().isAdReady();
                            hundredTabs = false;
                            twentyTab = false;
                            fiftyTab = false;
                            tenTab = false;
                            defaultTab = false;
                            thirtyTab = true;
                            link = url.text;
                            setState(() {});
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red
                          ),
                          child: SizedBox(
                            width: MediaQuery
                                .of(context)
                                .size
                                .width * .1,
                            child: const Text('30 tabs'),
                          )),
                      ElevatedButton(

                          onPressed: () {
                            // MyAppLovinInterstialAd().isAdReady();
                            setState(() {
                              hundredTabs = false;
                              twentyTab = false;
                              thirtyTab = false;
                              tenTab = false;
                              defaultTab = false;
                              fiftyTab = true;
                              link = url.text;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red
                          ),
                          child: SizedBox(
                            width: MediaQuery
                                .of(context)
                                .size
                                .width * .1,
                            child: const Text('50 tabs'),
                          )),
                      ElevatedButton(

                          onPressed: () {
                            // MyAppLovinInterstialAd().isAdReady();
                            setState(() {
                              twentyTab = false;
                              thirtyTab = false;
                              tenTab = false;
                              defaultTab = false;
                              fiftyTab = false;
                              hundredTabs = true;
                              link = url.text;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red
                          ),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * .08,
                            child: const Text('100 tabs'),
                          ))

                    ],
                  ),

                ):
                Text(instructions),
                MaxAdView(
                    adUnitId: "37de30427233c136",
                    adFormat: AdFormat.mrec,
                    listener: AdViewAdListener(onAdLoadedCallback: (ad) {

                    }, onAdLoadFailedCallback: (adUnitId, error) {

                    }, onAdClickedCallback: (ad) {

                    }, onAdExpandedCallback: (ad) {

                    }, onAdCollapsedCallback: (ad) {

                    })
                ),
                const SizedBox(height: 10,),
                tenTab ? Flexible(
                  child: kInAppWebView(link: link, tabQuantity: 10,),) :
                twentyTab ? Flexible(
                    child: kInAppWebView(link: link, tabQuantity: 20)) :
                thirtyTab ? Flexible(
                    child: kInAppWebView(link: link, tabQuantity: 30)) :
                fiftyTab ? Flexible(
                    child: kInAppWebView(link: link, tabQuantity: 50)) :
                hundredTabs ? Flexible(
                  child: kInAppWebView(link: link,tabQuantity: 100,),) :
                // linkInitialized?Flexible(
                //   child: kInAppWebView(
                //     tabQuantity: 10,
                //     link: link,
                //   ),
                // ):
                goPressed?const Center(
                    child: FittedBox(
                        child: Text('Press Tabs button to load tabs',))):SizedBox(),
                // const CircularProgressIndicator(),

                // SizedBox(
                //   height: 300,
                //   child: InAppWebView(
                //     initialOptions: InAppWebViewGroupOptions(
                //       crossPlatform: InAppWebViewOptions(
                //         cacheEnabled: false,
                //         clearCache: true,
                //         incognito: true,
                //
                //       )
                //     ),
                //     // initialData: "https://flutter.dev/",
                //     initialUrlRequest: URLRequest(url: Uri.parse(link)),
                //   )
                // ),


                // MaxAdView(
                //     adUnitId: "665c6d5ac255ace8",
                //     adFormat: AdFormat.banner,
                //     listener: AdViewAdListener(onAdLoadedCallback: (ad) {
                //
                //     }, onAdLoadFailedCallback: (adUnitId, error) {
                //
                //     }, onAdClickedCallback: (ad) {
                //
                //     }, onAdExpandedCallback: (ad) {
                //
                //     }, onAdCollapsedCallback: (ad) {
                //
                //     })
                // ),

              ],
            ),
          ),
        ]
      )
    );


              }

            }



