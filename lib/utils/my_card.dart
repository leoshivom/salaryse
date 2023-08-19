import 'package:flutter/material.dart';

import 'app_colors.dart';

class MyCard extends StatelessWidget {
  final Widget child;

  const MyCard({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 0.5,
              blurRadius: 2,
              offset: const Offset(0.2, 0.2),
            ),
          ]),
      child: Card(
          shadowColor: AppColors.black.withOpacity(0.5),
          surfaceTintColor: AppColors.white,
          child: child),
    );
  }
}
