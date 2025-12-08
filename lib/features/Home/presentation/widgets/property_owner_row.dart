import 'package:book_it/features/Home/data/models/owner_model.dart';
import 'package:flutter/material.dart';

class OwnerRow extends StatelessWidget {
  const OwnerRow({super.key, required this.propertyOwner});
  final OwnerModel propertyOwner;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 15,
            backgroundImage: AssetImage("assets/images/profile.jpg"),
          ),
          SizedBox(width: 10),
          Text(
            "Mazen Alrefai",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Spacer(),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.phone, size: 20),
            ),
          ),
        ],
      ),
    );
  }
}
