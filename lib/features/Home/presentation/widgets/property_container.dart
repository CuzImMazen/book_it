import 'package:book_it/core/utils/helpers.dart';
import 'package:book_it/features/Home/data/models/property_model.dart';
import 'package:flutter/material.dart';

class PropertyContainer extends StatelessWidget {
  const PropertyContainer({
    super.key,
    required this.property,
    required this.forOwner,
    this.onDelete,
  });
  final PropertyModel property;
  final bool forOwner;
  final VoidCallback? onDelete;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.withAlpha(10),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            // Image
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: NetworkImage(property.mainImage),
                      fit: BoxFit.cover,
                    ),
                  ),
                  height: 250,
                ),
                if (forOwner)
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      onPressed: () {
                        showDeletePropertyDialog(
                          context: context,
                          onDelete: onDelete!,
                        );
                      },
                      icon: Icon(Icons.delete, color: Colors.red, size: 30),
                    ),
                  ),
              ],
            ),
            SizedBox(height: 10),

            // Name and price
            Directionality(
              textDirection: TextDirection.ltr,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 6.0),
                    child: Text(
                      property.name,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  Spacer(),
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: Text(
                      "\$${property.price}/Night",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5),
            // Location and availability
            Directionality(
              textDirection: TextDirection.ltr,
              child: Row(
                children: [
                  Icon(Icons.location_on, color: Color(0xff0987b6)),
                  Text(
                    "${property.governorate}, ${property.city}",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff0987b6),
                    ),
                  ),
                  Spacer(),
                  property.availability
                      ? Text(
                          "Available",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.green,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      : Text(
                          "Unavailable",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.red,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
