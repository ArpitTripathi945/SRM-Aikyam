import 'package:flutter/material.dart';

class Spinner extends StatelessWidget {
  Spinner({
    Key? key,
    this.primary = true,
  }) : super(key: key);

  bool? primary;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: Colors.white,
      ),
    );
  }
}
