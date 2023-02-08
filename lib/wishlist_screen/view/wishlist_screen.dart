import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:phonix_smartphone_store/home_screen/controller/home_sceen_provider.dart';
import 'package:phonix_smartphone_store/home_screen/view/home_screen.dart';
import 'package:phonix_smartphone_store/utils/constant_colors.dart';
import 'package:phonix_smartphone_store/wishlist_screen/controller/wishlist_provider.dart';
import 'package:phonix_smartphone_store/wishlist_screen/model/show_wishlist_model.dart';
import 'package:phonix_smartphone_store/wishlist_screen/services/wish_list_services.dart';
import 'package:provider/provider.dart';

/// This screen is used to display the items in the
/// wishlist and user can add the items to the cart if they
/// need. And user can delete the items from the wishlist.

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // This variable is used to calculate the size of the device.
    Size size = MediaQuery.of(context).size;
    // Provider variable
    final providerValue = Provider.of<WishListProvider>(context);

    return SizedBox(
      width: size.width,
      height: size.height,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
        child: ListView(
          children: [
            Text(
              'Wishlist',
              style: TextStyle(fontSize: size.width * 0.06),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            providerValue.wishListModel!.wishlist.items.isEmpty
                ? const Text('data')
                : GridView.builder(
                    itemCount:
                        providerValue.wishListModel!.wishlist.items.length,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: size.width * 0.02,
                      crossAxisSpacing: size.width * 0.02,
                      childAspectRatio: 0.55,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(size.width * 0.04),
                            ),
                            height: size.height * 0.3,
                            child: Image.network(
                              providerValue.wishListModel!.wishlist.items[index]
                                  .productId.image[index].url
                                  .toString(),
                            ),
                          ),
                          Text(
                            providerValue.wishListModel!.wishlist.items[index]
                                .productId.productname,
                            style: TextStyle(
                              fontSize: size.width * 0.04,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey.shade600,
                            ),
                          ),
                          Text(
                            providerValue.wishListModel!.wishlist.items[index]
                                .productId.description,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: size.width * 0.04,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey.shade600,
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  style: const TextStyle(
                                    color: ConstantColors.constantBlackColor,
                                  ),
                                  text:
                                      '₹${providerValue.wishListModel!.wishlist.items[index].productId.price}',
                                ),
                                const WidgetSpan(
                                  alignment: PlaceholderAlignment.baseline,
                                  baseline: TextBaseline.alphabetic,
                                  child: SizedBox(width: 8),
                                ),
                                TextSpan(
                                  text:
                                      '₹${providerValue.wishListModel!.wishlist.items[index].productId.mrp}',
                                  style: const TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    color: ConstantColors.constantBlackColor,
                                  ),
                                )
                              ],
                            ),
                          ),
                          const Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(size.width * 0.02),
                                  border: Border.all(),
                                ),
                                height: size.height * 0.050,
                                width: size.height * 0.050,
                                child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.delete_outline_outlined,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: ConstantColors.constantBlackColor,
                                    borderRadius: BorderRadius.circular(
                                      size.width * 0.02,
                                    ),
                                    border: Border.all(),
                                  ),
                                  width: 130,
                                  height: size.height * 0.050,
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: const [
                                        Icon(
                                          Icons.shopping_bag_outlined,
                                          color: Colors.white,
                                        ),
                                        Text(
                                          'Add to Cart',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      );
                    },
                  ),
          ],
        ),
      ),
    );
  }
}
