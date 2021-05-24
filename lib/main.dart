import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf_viewer_example/api/pdf_api.dart';
import 'package:pdf_viewer_example/page/pdf_viewer_page.dart';
import 'package:pdf_viewer_example/widget/button_widget.dart';

void main() {

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'PDF Viewer';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(
          primaryColor: Colors.blue,
        ),
        home: MainPage(),
      );
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(32),
                child: ButtonWidget(
                  text: 'Asset PDF',
                  onClicked: () async {
                    final path = 'assets/book.pdf';
                    final file = await PDFApi.loadAsset(path);
                    openPDF(context, file);
                  },
                ),
            ),
          ),
      );

  void openPDF(BuildContext context, File file) => Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => PDFViewerPage(file: file)),
      );
}
