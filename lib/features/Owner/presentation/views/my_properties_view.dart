import 'package:book_it/core/widgets/primary_text.dart';
import 'package:book_it/features/Owner/presentation/widgets/my_properties_body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyPropertiesView extends StatelessWidget {
  const MyPropertiesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        actionsPadding: EdgeInsets.all(5),
        toolbarHeight: 80,
        title: Align(
          alignment: Alignment.center,
          child: PrimaryText(text: "My Properties"),
        ),
        actions: [
          IconButton(
            onPressed: () {
              context.push('/main/myproperties/createproperty');
            },
            icon: const Icon(Icons.add, size: 30),
          ),
          IconButton(
            onPressed: () {
              context.push('/main/pendingrequests');
            },
            icon: Icon(Icons.pending_actions, size: 28),
          ),
        ],
      ),
      body: MyPropertiesBody(),
    );
  }
}
