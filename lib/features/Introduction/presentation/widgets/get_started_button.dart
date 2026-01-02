import 'package:book_it/core/extensions/localization_extension.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment(0, 0.77),
      child: GestureDetector(
        onTap: () {
          context.push('/signin');
        },
        child: Container(
          height: 50,
          width: 225,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: Color(0xffeeeeee),
          ),
          child: Center(
            child: Text(
              context.welcome.getStarted,
              style: TextStyle(
                fontSize: 18,
                color: Color(0xff203234),
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
