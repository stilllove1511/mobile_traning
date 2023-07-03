import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

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
        Uri.parse('https://dev-tradingview.datxasia.com/recommendation/?symbol='+widget.code),
      )
      //enable javascript
      ..setJavaScriptMode(JavaScriptMode.unrestricted);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: WebViewWidget(
          controller: controller,
        ),
      ),
    );
  }
}