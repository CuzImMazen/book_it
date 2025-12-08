import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BackButtonRow extends StatelessWidget {
  const BackButtonRow({super.key, this.onTap});
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GestureDetector(
          onTap:
              onTap ??
              () {
                FocusScope.of(context).unfocus();
                context.pop();
              },
          child: Icon(Icons.arrow_back),
        ),

        // SizedBox(width: 10),
        // Text(
        //   "Back",
        //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        // ),
      ],
    );
  }
}
