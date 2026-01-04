import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:book_it/features/Favourites/presentation/viewModel/cubit/favourites_cubit.dart';
import 'package:book_it/features/Favourites/presentation/viewModel/cubit/favourites_state.dart';
import 'package:book_it/features/Home/data/models/property_model.dart';
import 'package:book_it/core/style/colors.dart';

class PropertyImages extends StatefulWidget {
  final PropertyModel property;

  const PropertyImages({super.key, required this.property});

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
    // final images = widget.property.images?.isNotEmpty == true
    //     ? widget.property.images!
    //     : [''];

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SizedBox(
          height: 375,
          child: PageView.builder(
            controller: _imageController,
            itemCount: widget.property.images?.length ?? 0,
            itemBuilder: (context, index) {
              final url = widget.property.images![index];

              if (url.isEmpty) {
                return Container(
                  color: Colors.grey[300],
                  alignment: Alignment.center,
                  child: const Icon(Icons.image_not_supported, size: 50),
                );
              }

              return Image.network(
                url,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  color: Colors.grey[300],
                  alignment: Alignment.center,
                  child: const Icon(Icons.broken_image, size: 50),
                ),
              );
            },
          ),
        ),

        PositionedDirectional(
          top: 40,
          start: 8,
          child: IconButton(
            onPressed: () => context.pop(),
            icon: const Icon(Icons.arrow_back, color: Colors.black, size: 26),
          ),
        ),

        PositionedDirectional(
          top: 40,
          end: 8,
          child: BlocBuilder<FavouritesCubit, FavouritesState>(
            buildWhen: (previous, current) =>
                previous is FavouritesLoaded || current is FavouritesLoaded,
            builder: (context, state) {
              final isFav = context.read<FavouritesCubit>().isFavourite(
                widget.property.id,
              );

              return IconButton(
                onPressed: () {
                  context.read<FavouritesCubit>().toggleFavourite(
                    widget.property,
                  );
                },
                // icon: isFav
                //     ? const Icon(Icons.favorite, size: 32, color: Colors.red)
                //     : const Icon(Icons.favorite, size: 32, color: Colors.grey),
                icon: Icon(
                  isFav ? Icons.favorite : Icons.favorite_border,
                  color: Colors.red,
                  size: 32,
                ),
              );
            },
          ),
        ),

        Positioned(
          bottom: 10,
          child: SmoothPageIndicator(
            controller: _imageController,
            count: widget.property.images?.length ?? 0,
            effect: WormEffect(
              dotHeight: 8,
              dotWidth: 8,
              spacing: 8,
              activeDotColor: kPrimaryColor.withAlpha(125),
            ),
          ),
        ),
      ],
    );
  }
}
