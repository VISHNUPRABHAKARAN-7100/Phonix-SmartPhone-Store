import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:phonix_smartphone_store/home_screen/controller/carousel_widget_provider.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CarouselWidget extends StatelessWidget {
  const CarouselWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Consumer<CarouselWidgetProvider>(
        builder: (context, carouselProviderValue, child) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CarouselSlider.builder(
              itemCount: carouselProviderValue.urlImages.length,
              itemBuilder: (context, index, realIndex) {
                final urlImage = carouselProviderValue.urlImages[index];
                return Container(
                  // margin: const EdgeInsets.symmetric(horizontal: 12),
                  color: Colors.grey,
                  child: Image.network(
                    urlImage,
                    fit: BoxFit.cover,
                  ),
                );
              },
              options: CarouselOptions(
                height: size.height * .2,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 2),
                viewportFraction: 1,
                onPageChanged: (index, reason) {
                  carouselProviderValue.activeIndexChanger(index);
                },
              ),
            ),
            SizedBox(
              height: size.height * .01,
            ),
            AnimatedSmoothIndicator(
              activeIndex: carouselProviderValue.activeIndex,
              count: carouselProviderValue.urlImages.length,
              effect: ExpandingDotsEffect(
                dotWidth: size.height * .01,
                dotHeight: size.height * .01,
              ),
            )
          ],
        ),
      ),
    );
  }
}
