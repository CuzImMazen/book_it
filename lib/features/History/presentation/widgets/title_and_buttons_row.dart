import 'package:book_it/core/style/colors.dart';
import 'package:flutter/material.dart';

class TitleAndButtonsRow extends StatelessWidget {
  const TitleAndButtonsRow({super.key, required this.status});
  final String status;
  @override
  Widget build(BuildContext context) {
    if (status == "Active") {
      return Padding(
        padding: const EdgeInsets.only(right: 8.0, bottom: 4),
        child: Row(
          children: [
            Expanded(
              child: Text(
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                "Fancy House",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(width: 8),
            Icon(Icons.edit, color: kPrimaryColor.withAlpha(125), size: 22),
            SizedBox(width: 12),
            Icon(Icons.cancel, color: Colors.red, size: 22),
          ],
        ),
      );
    } else if (status == "Completed") {
      return Padding(
        padding: const EdgeInsets.only(right: 8.0, bottom: 4),
        child: Row(
          children: [
            Expanded(
              child: Text(
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                "Fancy House",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
            ),
            Icon(Icons.star, color: Colors.yellow, size: 30),
          ],
        ),
      );
    } else if (status == "Canceled") {
      return Padding(
        padding: const EdgeInsets.only(right: 8.0, bottom: 4),
        child: Row(
          children: [
            Expanded(
              child: Text(
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                "Fancy House",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
            ),

            SizedBox(width: 8),
          ],
        ),
      );
    } else {
      return const Text("Wrong status");
    }
  }
}
