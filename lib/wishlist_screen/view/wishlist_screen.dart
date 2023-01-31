import 'package:flutter/material.dart';
import 'package:phonix_smartphone_store/utils/constant_colors.dart';

/// This screen is used to display the items in the
/// wishlist and user can add the items to the cart if they
/// need. And user can delete the items from the wishlist.

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // This variable is used to calculate the size of the device.
    Size size = MediaQuery.of(context).size;
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
            GridView.builder(
              itemCount: 10,
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
                        borderRadius: BorderRadius.circular(size.width * 0.04),
                      ),
                      height: size.height * 0.3,
                      child: Image.network(
                          'https://m.media-amazon.com/images/I/81UT07JsBqL._SX679_.jpg'),
                    ),
                    Text(
                      'Product Name',
                      style: TextStyle(
                        fontSize: size.width * 0.04,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    Text(
                      'Description',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: size.width * 0.04,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            style: TextStyle(
                              color: ConstantColors.constantBlackColor,
                            ),
                            text: 'MRP',
                          ),
                          WidgetSpan(
                            alignment: PlaceholderAlignment.baseline,
                            baseline: TextBaseline.alphabetic,
                            child: SizedBox(width: 8),
                          ),
                          TextSpan(
                            text: 'Actual price',
                            style: TextStyle(
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
                              color: Colors.black,
                              borderRadius:
                                  BorderRadius.circular(size.width * 0.02),
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
