





import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class AccountOneWebView extends StatefulWidget {
  final String link;
  const AccountOneWebView({super.key, required this.link});


  @override
  State<AccountOneWebView> createState() => _AccountOneWebViewState();
}

class _AccountOneWebViewState extends State<AccountOneWebView> {
  @override
  Widget build(BuildContext context) {
    return InAppWebView(
      initialUrlRequest: URLRequest(url: Uri.parse(widget.link)),
    );
  }
}
