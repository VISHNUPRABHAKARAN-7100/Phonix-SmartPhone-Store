import 'package:flutter/material.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // This variable is used to calculate the size of the device.
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: size.height,
      child: ListView(
        children: [
          const Text('Wishlist'),
          // GridView.builder(
          //   physics: const NeverScrollableScrollPhysics(),
          //   shrinkWrap: true,
          //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //     crossAxisCount: 2,
          //     mainAxisSpacing: size.width * 0.02,
          //     crossAxisSpacing: size.width * 0.02,
          //     childAspectRatio: 1,
          //   ),
          //   itemBuilder: (BuildContext context, int index) {
          //     return Container(
          //       height: 100,
          //       color: Colors.amber,
          //     );
          //   },
          // ),
        ],
      ),
    );
  }
}
