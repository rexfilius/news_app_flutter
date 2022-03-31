import 'package:flutter/material.dart';
import 'package:news_app_flutter/news_app_lib.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:io';

class WebViewScreen extends StatefulWidget {
  const WebViewScreen({Key? key}) : super(key: key);

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  @override
  void initState() {
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final articleArgs = ModalRoute.of(context)!.settings.arguments as Article;
    return Scaffold(
      body: WebView(
        initialUrl: articleArgs.url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
