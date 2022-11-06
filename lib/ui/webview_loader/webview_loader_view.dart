import 'dart:async';

import 'dart:io';

import 'package:devraphe/ui/webview_loader/webview_loader_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewLoader extends StatefulWidget {
  const WebViewLoader({
    Key? key,
    required this.title,
    required this.url,
  }) : super(key: key);
  final String title;
  final String url;

  @override
  WebViewLoaderState createState() => WebViewLoaderState();
}

class WebViewLoaderState extends State<WebViewLoader> {
  bool isBusy = true;
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  final UniqueKey _key = UniqueKey();
  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<WebViewLoaderViewModel>.reactive(
      viewModelBuilder: () => WebViewLoaderViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
            title: Text(widget.title),
            backgroundColor: Theme.of(context).colorScheme.primary),
        body: Stack(
          children: [
            WebView(
              key: _key,
              initialUrl: widget.url,
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (WebViewController controller) {
                _controller.complete(controller);
              },
              onPageStarted: model.onPageStarted,
              onPageFinished: model.onPageFinished,
            ),
            if (isBusy)
              LoadingIndicator(color: Theme.of(context).colorScheme.primary)
          ],
        ),
      ),
    );
  }
}

class LoadingIndicator extends StatelessWidget {
  final Color color;
  const LoadingIndicator({
    Key? key,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitDualRing(
        color: color,
      ),
    );
  }
}
