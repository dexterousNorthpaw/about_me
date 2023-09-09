import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewApp extends StatefulWidget {
  const WebViewApp({super.key});

  @override
  State<WebViewApp> createState() => _WebViewAppState();
}

class _WebViewAppState extends State<WebViewApp> {
  var loading = 0;
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setNavigationDelegate(NavigationDelegate(onPageStarted: (url) {
        setState(() {
          loading = 0;
        });
      }, onProgress: (progress) {
        setState(() {
          loading = progress;
        });
      }, onPageFinished: (url) {
        setState(() {
          loading = 100;
        });
      }))
      ..loadRequest(
        Uri.parse('https://github.com/dexterousNorthpaw'),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My GitHub'),
      ),
      body: Stack(children: [
        WebViewWidget(
          controller: controller,
        ),
        if (loading <100)
          Center(
            child: CircularProgressIndicator(
              value: loading/100.0,
            ),
          )
      ]),
    );
  }
}
