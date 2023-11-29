import 'package:carousel_slider/carousel_slider.dart';
import 'package:client/models/pagination.dart';
import 'package:client/models/slider.dart';
import 'package:client/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeSlider extends ConsumerWidget {
  const HomeSlider({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: Colors.white,
      child: _sliderList(ref),
    );
  }

  Widget _sliderList(WidgetRef ref) {
    final slider =
        ref.watch(slideProvider(PaginationModel(page: 1, pageSize: 10)));

    return slider.when(
      data: (list) {
        if (list != null && list.isNotEmpty) {
          return imageCarousel(list);
        } else {
          return const Center(
            child: Text("No slides available"),
          );
        }
      },
      error: (_, __) => const Center(
        child: Text("Error fetching slides"),
      ),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget imageCarousel(List<SlideModel> slideList) {
    return CarouselSlider(
      items: slideList
          .map((model) => Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(model.fullImagePath),
                    fit: BoxFit.contain,
                  ),
                ),
              ))
          .toList(),
      options: CarouselOptions(
        enlargeCenterPage: true,
        autoPlay: true,
        aspectRatio: 16 / 9,
        autoPlayCurve: Curves.decelerate,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        viewportFraction: 0.8,
      ),
    );
  }
}
