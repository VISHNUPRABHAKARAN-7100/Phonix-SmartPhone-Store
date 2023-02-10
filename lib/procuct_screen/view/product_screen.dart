// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:phonix_smartphone_store/home_screen/model/list_product_model.dart';
import 'package:phonix_smartphone_store/utils/constant_colors.dart';
import 'package:phonix_smartphone_store/wishlist_screen/controller/wishlist_provider.dart';
import 'package:phonix_smartphone_store/wishlist_screen/services/wish_list_services.dart';
import 'package:provider/provider.dart';

/// This screen is used to display the each
/// product information

class ProductScreen extends StatelessWidget {
  const ProductScreen({
    super.key,
    required this.products,
  });

  final Products products;

  @override
  Widget build(BuildContext context) {
    Provider.of<WishListProvider>(context, listen: false)
        .check(products.sId.toString());
    WidgetsFlutterBinding.ensureInitialized();
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
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  // ElevatedButton(
                  //     onPressed: () {
                  //       Provider.of<WishListProvider>(context, listen: false)
                  //           .check(products.sId);
                  //     },
                  //     child: const Text('ash')),
                  SizedBox(
                    width: size.width,
                    height: size.height * 0.35,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (context, index) => SizedBox(
                        width: size.width,
                        height: size.height * 0.5,
                        child: Image.network(
                          products.image![index].url.toString(),
                        ),
                      ),
                      scrollDirection: Axis.horizontal,
                      itemCount: products.image!.length,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          products.productname.toString(),
                          style: TextStyle(
                            fontSize: size.width * 0.05,
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: '₹${products.price}',
                                style: TextStyle(
                                  fontSize: size.width * 0.05,
                                  color: ConstantColors.constantBlackColor,
                                ),
                              ),
                              const WidgetSpan(
                                alignment: PlaceholderAlignment.baseline,
                                baseline: TextBaseline.alphabetic,
                                child: SizedBox(width: 8),
                              ),
                              TextSpan(
                                text: 'MRP ',
                                style: TextStyle(
                                  fontSize: size.width * 0.05,
                                  color: ConstantColors.constantBlackColor,
                                ),
                              ),
                              TextSpan(
                                text: ' ₹${products.mrp}',
                                style: TextStyle(
                                  fontSize: size.width * 0.05,
                                  color: ConstantColors.constantBlackColor,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Text(
                          products.description.toString(),
                          style: TextStyle(
                            fontSize: size.width * 0.05,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Consumer<WishListProvider>(
              builder: (context, wishListProviderValueOfButton, child) =>
                  Container(
                decoration: BoxDecoration(border: Border.all()),
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.07),
                height: size.height * 0.07,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: wishListProviderValueOfButton
                                .check(products.sId.toString())
                            ? () {
                                wishListProviderValueOfButton
                                    .removeFromWishList(
                                        products.sId.toString());
                                wishListProviderValueOfButton
                                    .getDataOfWishList(context);
                              }
                            : () {
                                Provider.of<WishListProvider>(context,
                                        listen: false)
                                    .addProductToWishlist(
                                        products.sId.toString());
                                wishListProviderValueOfButton
                                    .getDataOfWishList(context);
                              },
                        icon: wishListProviderValueOfButton
                                .check(products.sId.toString())
                            ? const Icon(Icons.favorite_rounded,
                                color: ConstantColors.constantRedColor)
                            : const Icon(Icons.favorite_border_outlined)),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ConstantColors.constantBlackColor,
                      ),
                      child: const Text('Add to Cart'),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
