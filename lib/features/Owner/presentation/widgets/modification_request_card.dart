import 'package:book_it/features/Owner/presentation/widgets/accept_button.dart';
import 'package:book_it/features/Owner/presentation/widgets/reject_button.dart';
import 'package:flutter/material.dart';

class ModificationRequestCard extends StatelessWidget {
  const ModificationRequestCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Card(
        elevation: 15,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                "https://tse3.mm.bing.net/th/id/OIP.JT0tJNPHdzVdaRvnoVfPCgHaE8?cb=ucfimg2&ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3",
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "House",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),

                  Icon(Icons.person_2),
                  SizedBox(width: 7),
                  Text(
                    "Mazen AlRefai",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w900),
                  ),
                ],
              ),
            ),
            SizedBox(height: 3),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      overflow: TextOverflow.ellipsis,
                      "Damascus,Mazzeh",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  Text(
                    "\$120.00/Night",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  Text(
                    "Original Date:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 18),
                  Icon(Icons.calendar_month_outlined, color: Colors.grey),
                  SizedBox(width: 5),
                  Text(
                    "5 Dec - 10 Dec",
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  Text(
                    "Adjusted Date:",
                    style: TextStyle(fontWeight: FontWeight.w800),
                  ),
                  SizedBox(width: 10),
                  Icon(Icons.calendar_month_outlined, color: Colors.black87),
                  SizedBox(width: 5),
                  Text(
                    "12 Dec - 25 Dec",
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [AcceptButton(), SizedBox(width: 25), RejectButton()],
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
