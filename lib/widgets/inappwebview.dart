import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';






class kInAppWebView extends StatefulWidget {
  kInAppWebView({
    required this.link,
    required this.tabQuantity
});
  String link;
  int tabQuantity;

  @override
  State<kInAppWebView> createState() => _kInAppWebViewState();
}

class _kInAppWebViewState extends State<kInAppWebView> {


  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
        itemCount: widget.tabQuantity,
        padding: EdgeInsets.zero,
        // physics: const ScrollPhysics,
        gridDelegate:
        const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        itemBuilder: (context, index) {
          return SizedBox(
            height: 100,
            child: InAppWebView(
              initialOptions: InAppWebViewGroupOptions(
                  crossPlatform: InAppWebViewOptions(
                    cacheEnabled: false,
                    clearCache: true,
                    incognito: true,

                  )
              ),
              // initialData: "https://flutter.dev/",
              initialUrlRequest: URLRequest(url: Uri.parse(widget.link)),
            ),
          );
        });
  }
}
