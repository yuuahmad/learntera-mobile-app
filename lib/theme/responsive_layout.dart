import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileBody;
  final Widget tabletBody;
  final Widget latopBody;
  const ResponsiveLayout({Key? key, required this.mobileBody, required this.tabletBody, required this.latopBody})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth < 500) {
          return mobileBody;
        } else if (constraints.maxWidth >= 500 && constraints.maxWidth <= 800) {
          return tabletBody;
        } else {
          return latopBody;
        }
      },
    );
  }
}
