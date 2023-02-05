import 'package:flutter/material.dart';

class DefaultLayout extends StatelessWidget {
  final Widget child;
  final Color? backgroundColor;

  const DefaultLayout({
    required this.child,
    Key? key, this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:backgroundColor ?? Colors.white,
      body: child,
    );
  }
}
