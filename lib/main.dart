import 'package:flutter/material.dart';
import 'package:flutter_prueba_webview/src/menu.dart';
import 'package:webview_flutter/webview_flutter.dart'; // ADD

import 'src/navigation_controls.dart'; // ADD
import 'src/web_view_stack.dart';

void main() {
  runApp(
    const MaterialApp(
      home: WebViewApp(),
    ),
  );
}

class WebViewApp extends StatefulWidget {
  const WebViewApp({super.key});

  @override
  State<WebViewApp> createState() => _WebViewAppState();
}

class _WebViewAppState extends State<WebViewApp> {
  // Add from here...
  late final WebViewController controller;
  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..loadRequest(
        Uri.parse('https://esgrima-fae.com.ar/new'),
      );
  }
  // ...to here.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter WebView'),
        // Add from here...
        actions: [
          NavigationControls(controller: controller),
          Menu(controller: controller)
        ],
        // ...to here.
      ),
      body: WebViewStack(controller: controller), // MODIFY
    );
  }
}
