import 'package:flutter/material.dart';
import 'package:mobile_traning/utils/logger.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class Detail extends StatefulWidget {
  const Detail({super.key, required this.code});

  final String code;

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..loadRequest(
        Uri.parse(
            'https://dev-tradingview.datxasia.com/recommendation/?symbol=' +
                widget.code),
      )
      //enable javascript
      ..setJavaScriptMode(JavaScriptMode.unrestricted);
  }

  InAppWebViewController? webViewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: InAppWebView(
          initialUrlRequest: URLRequest(url: Uri.parse('http://10.0.2.2:3000/register-collaborator')),
          onWebViewCreated: (controller) {
            webViewController = controller;
            webViewController?.addJavaScriptHandler(
              handlerName: 'backToApp',
              callback: (a) {
                // Handle the JavaScript call here
                appLogger.e('backToApp');
              },
            );
          },
        ),
      ),
    );
  }
}
