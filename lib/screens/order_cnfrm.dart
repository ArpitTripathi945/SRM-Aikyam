import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class OrderCnfrm extends StatelessWidget {
  const OrderCnfrm({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Center(
        child: Text("Order placed succesfully"),
      ),
    );
  }
}
