// ignore: avoid_web_libraries_in_flutter
import 'package:flutter/material.dart';

import 'dart:html' as html;
import 'dart:ui_web' as ui;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Roraima 2030',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: corAzul,
          brightness: Brightness.light,
        ),
      ),
      home: const HomeScreen(),
      //home: LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

const Color corAzul = Color(0xff0B62A7);

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final String viewType = 'powerbi-embed';

  @override
  void initState() {
    super.initState();
    _registerIframe();
  }

  void _registerIframe() {
    const String powerBIUrl =
        'https://app.powerbi.com/view?r=eyJrIjoiMmE3MTNiZmQtZWJhOC00NjQ5LWI1ZTctNWViZGNiZmFjMGQ1IiwidCI6IjNhZmRhZWZjLTc0ZjQtNGE4MC1hNGJjLTdmZjQ2OGNhOTUyMyJ9&filterPaneEnabled=false&navContentPaneEnabled=false&bookmarkPaneEnabled=false&embed=true';

    ui.platformViewRegistry.registerViewFactory(
      viewType,
      (int viewId) => html.IFrameElement()
        ..src = powerBIUrl
        ..style.border = 'none'
        ..width = '100%'
        ..height = '100%',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Center(
              child: HtmlElementView(
                viewType: viewType,
              ),
            ),
            Positioned(
              bottom: 0.0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 40,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
