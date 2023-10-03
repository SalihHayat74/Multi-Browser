


import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebViewModel{

  List<InAppWebView> inAppWebView = [
  InAppWebView(
  initialUrlRequest: URLRequest(url: Uri.parse("https://youtu.be/Z9XxKPelEsU")),
  ),
    InAppWebView(
      initialUrlRequest: URLRequest(url: Uri.parse("https://youtu.be/Z9XxKPelEsU")),
    ),
    InAppWebView(
      initialUrlRequest: URLRequest(url: Uri.parse("https://youtu.be/Z9XxKPelEsU")),
    ),



  ];



}