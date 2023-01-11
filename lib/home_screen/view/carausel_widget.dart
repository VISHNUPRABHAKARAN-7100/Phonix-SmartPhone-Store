import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CarouselWidget extends StatefulWidget {
  const CarouselWidget({super.key});

  @override
  State<CarouselWidget> createState() => _CarouselWidgetState();
}

List<String> urlImages = [
  'https://images.pexels.com/photos/1049298/pexels-photo-1049298.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
  'https://images.pexels.com/photos/1450353/pexels-photo-1450353.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
  'https://images.pexels.com/photos/14527986/pexels-photo-14527986.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
];
int activeIndex = 0;

class _CarouselWidgetState extends State<CarouselWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CarouselSlider.builder(
            itemCount: urlImages.length,
            itemBuilder: (context, index, realIndex) {
              final urlImage = urlImages[index];
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 12),
                color: Colors.grey,
                child: Image.network(
                  urlImage,
                  fit: BoxFit.cover,
                ),
              );
            },
            options: CarouselOptions(
              height: 400,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 2),
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                setState(() {
                  activeIndex = index;
                });
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          AnimatedSmoothIndicator(
            activeIndex: activeIndex,
            count: urlImages.length,
            effect: const ExpandingDotsEffect(
              dotWidth: 10,
              dotHeight: 10,
            ),
          )
        ],
      ),
    );
  }
}
