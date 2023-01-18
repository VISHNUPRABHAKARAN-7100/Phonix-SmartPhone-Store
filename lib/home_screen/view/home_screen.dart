import 'package:flutter/material.dart';
import 'package:phonix_smartphone_store/home_screen/controller/home_sceen_provider.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
      child: ListView(
        children: [
          Provider.of<HomeScreenProvider>(
                    context,
                  ).isShimmerOfBanner ==
                  false
              ? const ShimmerWidget()
              : const HomeScreenAfterShimmer()
        ],
      ),
    );
  }
}

class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Container(
              color: Colors.white,
              width: size.width,
              height: size.height * .2,
            ),
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              height: size.height * 0.06,
              width: size.width / 2,
            ),
          ),
          SizedBox(
            height: size.height * .01,
          ),
          Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: size.width * 0.02,
                crossAxisSpacing: size.width * 0.02,
                childAspectRatio: 1,
              ),
              itemCount: 4,
              itemBuilder: (context, index) {
                return Container(
                  height: 100,
                  width: 100,
                  color: Colors.white,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class HomeScreenAfterShimmer extends StatelessWidget {
  const HomeScreenAfterShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: size.width,
            height: size.height * .2,
            child: const Image(
              fit: BoxFit.cover,
              image: NetworkImage(
                'https://images.pexels.com/photos/5082579/pexels-photo-5082579.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          Text(
            'New Arrival',
            style: TextStyle(
              fontSize: size.height * 0.035,
            ),
          ),
          SizedBox(
            height: size.height * .01,
          ),
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: size.width * 0.02,
              crossAxisSpacing: size.width * 0.02,
              childAspectRatio: 1,
            ),
            itemCount: 4,
            itemBuilder: (context, index) {
              return Container(
                height: 100,
                width: 100,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      'https://images.pexels.com/photos/6279108/pexels-photo-6279108.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
