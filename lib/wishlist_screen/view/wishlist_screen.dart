import 'dart:math';

import 'package:flutter/material.dart';
import 'package:phonix_smartphone_store/utils/constant_colors.dart';
import 'package:phonix_smartphone_store/wishlist_screen/controller/wishlist_provider.dart';
import 'package:phonix_smartphone_store/wishlist_screen/services/wish_list_services.dart';
import 'package:provider/provider.dart';

/// This screen is used to display the items in the
/// wishlist and user can add the items to the cart if they
/// need. And user can delete the items from the wishlist.

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<WishListProvider>(context, listen: false)
        .getDataOfWishList(context);
    // This variable is used to calculate the size of the device.
    Size size = MediaQuery.of(context).size;
    // Provider variable
    // final providerValue = Provider.of<WishListProvider>(context, listen: false);

    return SizedBox(
      width: size.width,
      height: size.height,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
        child: Consumer<WishListProvider>(
          builder: (context, wishListProviderValue, child) => ListView(
            children: [
              Text(
                'Wishlist',
                style: TextStyle(fontSize: size.width * 0.06),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              wishListProviderValue.wishList[0].wishlist.items.isEmpty
                  ? Column(
                      children: [
                        SizedBox(
                          height: size.height * 0.33,
                        ),
                        const Center(
                          child: Text('WishList is empty'),
                        ),
                      ],
                    )
                  : GridView.builder(
                      itemCount: wishListProviderValue
                          .wishList[0].wishlist.items.length,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: size.width * 0.02,
                        crossAxisSpacing: size.width * 0.02,
                        childAspectRatio: 0.54,
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
                                wishListProviderValue.wishList[0].wishlist
                                    .items[index].productId.image[0].url,
                              ),
                            ),
                            Text(
                              wishListProviderValue.wishList[0].wishlist
                                  .items[index].productId.productname,
                              style: TextStyle(
                                fontSize: size.width * 0.04,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey.shade600,
                              ),
                            ),
                            Text(
                              wishListProviderValue.wishList[0].wishlist
                                  .items[index].productId.description,
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
                                      style: TextStyle(
                                        fontSize: size.width * 0.055,
                                        color:
                                            ConstantColors.constantBlackColor,
                                      ),
                                      text:
                                          '₹${wishListProviderValue.wishList[0].wishlist.items[index].productId.price}'),
                                  const WidgetSpan(
                                    alignment: PlaceholderAlignment.baseline,
                                    baseline: TextBaseline.alphabetic,
                                    child: SizedBox(width: 8),
                                  ),
                                  TextSpan(
                                    text:
                                        '₹${wishListProviderValue.wishList[0].wishlist.items[index].productId.mrp}',
                                    style: TextStyle(
                                      fontSize: size.width * 0.055,
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
                                    borderRadius: BorderRadius.circular(
                                        size.width * 0.02),
                                    border: Border.all(),
                                  ),
                                  height: size.height * 0.050,
                                  width: size.height * 0.050,
                                  child: IconButton(
                                    onPressed: () {
                                      wishListProviderValue.removeFromWishList(
                                          wishListProviderValue
                                              .wishList[0]
                                              .wishlist
                                              .items[index]
                                              .productId
                                              .id,
                                          context);
                                    },
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
                                            style:
                                                TextStyle(color: Colors.white),
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
      ),
    );
  }
}
