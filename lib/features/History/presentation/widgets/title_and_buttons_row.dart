import 'package:book_it/core/style/colors.dart';
import 'package:flutter/material.dart';

class TitleAndButtonsRow extends StatelessWidget {
  const TitleAndButtonsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0, bottom: 4),
      child: Row(
        children: [
          Expanded(
            child: Text(
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              "Fancy Houseeeeeeeeeeeee",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
          ),
          SizedBox(width: 8),
          Icon(Icons.edit, color: kPrimaryColor.withAlpha(125)),
          SizedBox(width: 12),
          Icon(Icons.cancel, color: Colors.red),

          // IconButton(
          //   onPressed: () {},
          //   icon: Icon(Icons.edit, color: kPrimaryColor.withAlpha(125)),
          // ),
          // IconButton(
          //   onPressed: () {},
          //   icon: Icon(Icons.cancel, color: Colors.red),
          // ),
        ],
      ),
    );
  }
}
