import 'package:book_it/features/Home/data/models/location_model.dart';
import 'package:book_it/features/Home/data/models/owner_model.dart';
import 'package:book_it/features/Home/data/models/property_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PropertyContainer extends StatelessWidget {
  const PropertyContainer({super.key});
  final PropertyModel testProperty = const PropertyModel(
    name: "Fancy House",
    description:
        "A stunning, modern mansion featuring elegant architecture and spacious interiors. Large windows fill the home with natural light, highlighting premium finishes and high-end amenities. Surrounded by beautifully landscaped gardens, it offers luxury, comfort, and style in every detail.",
    price: "250.000",
    location: Location(city: "AlShalaan", governorate: "Damascus"),
    availability: true,
    mainImage: "assets/images/house5.avif",
    numberOfKitchens: 2,
    numberOfBaths: 2,
    numberOfBedrooms: 4,
    area: 500,
    owner: OwnerModel(
      image: "assets/images/profile.jpg",
      firstName: "Mazen",
      lastName: "Alrefai",
      phone: "0947476626",
    ),
    images: [
      "assets/images/house5.avif",
      "assets/images/inside1.jpg",
      "assets/images/inside2.jpg",
      "assets/images/inside3.jpg",
    ],
  );
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push("/propertydetail", extra: testProperty);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.withAlpha(10),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              // Image
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: AssetImage(testProperty.mainImage),
                    fit: BoxFit.cover,
                  ),
                ),
                height: 250,
              ),
              SizedBox(height: 10),

              // Name and price
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 6.0),
                    child: Text(
                      testProperty.name,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  Spacer(),
                  Text(
                    "Sp.${testProperty.price}/Night",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              SizedBox(height: 5),
              // Location and availability
              Row(
                children: [
                  Icon(Icons.location_on, color: Color(0xff0987b6)),
                  Text(
                    "${testProperty.location.governorate}, ${testProperty.location.city}",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff0987b6),
                    ),
                  ),
                  Spacer(),
                  testProperty.availability
                      ? Text(
                          "Available",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.green,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      : Text(
                          "unavailable",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.red,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
