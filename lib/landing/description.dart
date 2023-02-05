import 'package:app/landing/landing_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html';

import '../utilities/app_constants.dart';
import 'widgets/delayed_widget.dart';

class PortfolioDescription extends StatelessWidget {
  const PortfolioDescription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      DelayedWidget(
        delayDuration: const Duration(milliseconds: 2800),
        from: DelayFrom.bottom,
        child: Row(
          children: [
            const SelectableText(
              AppConstants.portfolioTitle,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 8.0),
            //cv download icon
            IconButton(
              onPressed: download,
              icon: const Icon(
                Icons.open_in_new,
                color: Colors.white,
                size: 20.0,
              ),
            ),
          ],
        ),
      ),
      const SizedBox(height: 16.0),
      const DelayedWidget(
        delayDuration: Duration(milliseconds: 2900),
        from: DelayFrom.bottom,
        child: Divider(
          thickness: 1.75,
          color: dividerColor,
        ),
      ),
      const SizedBox(height: 16.0),
      const DelayedWidget(
        delayDuration: Duration(milliseconds: 3000),
        from: DelayFrom.bottom,
        child: SelectableText(
          AppConstants.portfolioDescription,
          style: TextStyle(
            fontSize: 17.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 1.8,
          ),
        ),
      ),
    ]);
  }

  void download() async {
    // Load the file from assets
    List<int> bytes = (await rootBundle.load('assets/cv-word_compressed.pdf'))
        .buffer
        .asUint8List();
    var downloadName = 'youssef-ali.pdf';
    // Encode our file in base64
    final base64 = base64Encode(bytes);
    // Create the link with the file
    final anchor =
        AnchorElement(href: 'data:application/octet-stream;base64,$base64')
          ..target = 'blank';
    // add the name
    // if (downloadName != null) {
    anchor.download = downloadName;
    // }
    // trigger download
    document.body?.append(anchor);
    anchor.click();
    anchor.remove();
    return;
  }
}
