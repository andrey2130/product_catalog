import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MiniBrowser extends StatefulWidget {
  const MiniBrowser({super.key});

  @override
  State<MiniBrowser> createState() => _MiniBrowserState();
}

class _MiniBrowserState extends State<MiniBrowser> {
  late final WebViewController _controller;
  double _progress = 0;
  bool _hasError = false;

  final String initialUrl = 'https://www.google.com';

  @override
  void initState() {
    super.initState();
    _initController();
  }

  void _initController() {
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (progress) {
            setState(() {
              _progress = progress / 100;
            });
          },
          onPageStarted: (_) {
            setState(() {
              _hasError = false;
              _progress = 0;
            });
          },
          onPageFinished: (_) {
            setState(() {
              _progress = 0;
            });
          },
         onWebResourceError: (error) {
  if (error.errorCode != -999) {
    setState(() {
      _hasError = true;
    });
  }
},
        ),
      )
      ..loadRequest(Uri.parse(initialUrl));
  }

  void _reload() {
    setState(() {
      _hasError = false;
    });
    _controller.loadRequest(Uri.parse(initialUrl));
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Міні-браузер'),
          bottom: _progress < 1.0
              ? PreferredSize(
                  preferredSize: const Size.fromHeight(3),
                  child: LinearProgressIndicator(
                    value: _progress,
                    backgroundColor: Colors.transparent,
                    color: Colors.blueAccent,
                  ),
                )
              : null,
        ),
        body: SafeArea(
          child: _hasError
              ? Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text('Не вдалося завантажити'),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: _reload,
                        child: const Text('Спробувати знову'),
                      ),
                    ],
                  ),
                )
              : WebViewWidget(controller: _controller),
        ),
        bottomNavigationBar: SafeArea(
          child: Container(
            height: 56,
            decoration: BoxDecoration(
              color: Theme.of(context).appBarTheme.backgroundColor ??
                  Theme.of(context).primaryColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 4,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () async {
                    if (await _controller.canGoBack()) {
                      _controller.goBack();
                    }
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
                IconButton(
                  onPressed: () async {
                    if (await _controller.canGoForward()) {
                      _controller.goForward();
                    }
                  },
                  icon: const Icon(Icons.arrow_forward),
                ),
                IconButton(
                  onPressed: _reload,
                  icon: const Icon(Icons.refresh),
                ),
                IconButton(
                  onPressed: () => context.pop(),
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}