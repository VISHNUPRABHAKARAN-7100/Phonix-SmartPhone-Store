import 'package:flutter/material.dart';
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
          Shimmer.fromColors(
            baseColor: Colors.black,highlightColor: Colors.yellow,
            child: SizedBox(
              width: size.width,
              height: size.height * .2,
              child: const Image(
                fit: BoxFit.cover,
                image: NetworkImage(
                  'https://images.pexels.com/photos/5082579/pexels-photo-5082579.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                ),
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
          )
        ],
      ),
    );
  }
}
