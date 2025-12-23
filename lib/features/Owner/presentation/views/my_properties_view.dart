import 'package:book_it/core/widgets/primary_text.dart';
import 'package:book_it/features/Authentication/data/models/user_model.dart';
import 'package:book_it/features/Home/data/models/property_features_model.dart';
import 'package:book_it/features/Home/data/models/property_model.dart';
import 'package:book_it/features/Home/presentation/widgets/property_container.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyPropertiesView extends StatelessWidget {
  const MyPropertiesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        actionsPadding: EdgeInsets.all(5),
        toolbarHeight: 80,
        title: PrimaryText(text: "My Properties"),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.add, size: 30)),
          IconButton(
            onPressed: () {
              context.push("/pendingrequests");
            },
            icon: Icon(Icons.pending_actions, size: 28),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 12),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 4,
                itemBuilder: (context, index) {
                  return PropertyContainer(
                    forOwner: true,
                    property: PropertyModel(
                      id: 1,
                      name: "Fancy Villa",
                      category: "Villa",
                      description: "testtest",
                      price: "10.00",
                      governorate: "Damascus",
                      city: "Mazzeh",
                      availability: true,
                      mainImage:
                          "https://tse3.mm.bing.net/th/id/OIP.JT0tJNPHdzVdaRvnoVfPCgHaE8?cb=ucfimg2&ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3",
                      features: PropertyFeaturesModel(
                        numberOfKitchens: 2,
                        numberOfBathrooms: 1,
                        numberOfBedrooms: 3,
                        area: 120,
                      ),
                      owner: UserModel(
                        profileImage:
                            "https://th.bing.com/th/id/R.415058df456a4e2fad958b7f05aa06a8?rik=sdiU4nxQeJtCwg&pid=ImgRaw&r=0",
                        idImage:
                            "https://th.bing.com/th/id/R.415058df456a4e2fad958b7f05aa06a8?rik=sdiU4nxQeJtCwg&pid=ImgRaw&r=0",
                        id: 1,
                        firstName: "test",
                        lastName: "test",
                        birthDate: "2000-1-1",
                        phoneNumber: "123456789",
                        role: "owner",
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
