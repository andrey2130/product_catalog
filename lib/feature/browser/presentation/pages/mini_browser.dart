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

  Future<void> _handleGoBack() async {
    if (await _controller.canGoBack()) {
      _controller.goBack();
    }
  }

  Future<void> _handleGoForward() async {
    if (await _controller.canGoForward()) {
      _controller.goForward();
    }
  }

  Widget _buildProgressIndicator() {
    if (_progress == 0 || _progress == 1) {
      return const SizedBox.shrink();
    }
    return LinearProgressIndicator(
      value: _progress,
      backgroundColor: Colors.grey[300],
      valueColor: AlwaysStoppedAnimation<Color>(
        Theme.of(context).primaryColor,
      ),
    );
  }

  Widget _buildErrorWidget() {
    return Center(
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
    );
  }

  Widget _buildBody() {
    return SafeArea(
      child: Column(
        children: [
          _buildProgressIndicator(),
          Expanded(
            child: _hasError
                ? _buildErrorWidget()
                : WebViewWidget(controller: _controller),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return SafeArea(
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
              onPressed: _handleGoBack,
              icon: const Icon(Icons.arrow_back),
            ),
            IconButton(
              onPressed: _handleGoForward,
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: _buildBody(),
        bottomNavigationBar: _buildBottomNavigationBar(context),
      ),
    );
  }
}