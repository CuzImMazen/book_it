import 'package:book_it/core/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PropertyImages extends StatefulWidget {
  const PropertyImages({super.key, required this.images});
  final List<String> images;
  @override
  State<PropertyImages> createState() => _PropertyImagesState();
}

class _PropertyImagesState extends State<PropertyImages> {
  final PageController _imageController = PageController();

  @override
  void dispose() {
    _imageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SizedBox(
          height: 375,
          child: PageView.builder(
            controller: _imageController,
            itemCount: widget.images.length,
            itemBuilder: (context, index) {
              return Image.network(
                widget.images[index],
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              );
            },
          ),
        ),
        Positioned(
          bottom: MediaQuery.of(context).size.height / 2.9,
          left: 1,
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: IconButton(
              onPressed: () {
                context.pop();
              },
              icon: Icon(Icons.arrow_back, color: Colors.black),
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          child: SmoothPageIndicator(
            effect: WormEffect(
              dotHeight: 8,
              dotWidth: 8,
              spacing: 8,
              activeDotColor: kPrimaryColor.withAlpha(125),
            ),
            controller: _imageController,
            count: widget.images.length,
          ),
        ),
      ],
    );
  }
}
