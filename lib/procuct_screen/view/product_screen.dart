import 'package:flutter/material.dart';
import 'package:phonix_smartphone_store/utils/constant_colors.dart';

/// This screen is used to display the each
/// product information

class ProductScreen extends StatelessWidget {
  const ProductScreen({
    super.key,
    required this.productName,
    required this.description,
    required this.price,
    required this.mrp,
  });

  final String productName;
  final String description;
  final String price;
  final String mrp;

  @override
  Widget build(BuildContext context) {
    // Variable to find the size of the device.
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(),
        elevation: 0,
        backgroundColor: ConstantColors.appBackgroundColor,
      ),
      backgroundColor: ConstantColors.appBackgroundColor,
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(
              width: 100,
              height: size.height * 0.35,
              child: ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) => SizedBox(
                  width: size.width,
                  height: size.height / 2,
                  child: const Icon(Icons.umbrella),
                ),
                scrollDirection: Axis.horizontal,
                itemCount: 20,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productName,
                    style: TextStyle(
                      fontSize: size.width * 0.05,
                    ),
                  ),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: size.width * 0.05,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '₹$price',
                          style: const TextStyle(color: Colors.black),
                        ),
                        const WidgetSpan(
                          alignment: PlaceholderAlignment.baseline,
                          baseline: TextBaseline.alphabetic,
                          child: SizedBox(width: 8),
                        ),
                        const TextSpan(
                          text: 'MRP ',
                          style: TextStyle(color: Colors.black),
                        ),
                        TextSpan(
                          text: ' ₹$mrp',
                          style: const TextStyle(
                            color: Colors.black,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
