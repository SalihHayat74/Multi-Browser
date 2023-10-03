


import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class FirstWebView extends InAppWebView{


  InAppWebView firstWebView = InAppWebView(
    initialUrlRequest: URLRequest(url: Uri.parse("")),
  );
}
