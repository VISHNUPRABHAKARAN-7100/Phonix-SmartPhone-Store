import 'package:flutter/material.dart';
import 'package:phonix_smartphone_store/home_screen/controller/home_sceen_provider.dart';
import 'package:phonix_smartphone_store/home_screen/view/shimmer_widget.dart';
import 'package:phonix_smartphone_store/procuct_screen/view/product_screen.dart';
import 'package:phonix_smartphone_store/wishlist_screen/controller/wishlist_provider.dart';
import 'package:provider/provider.dart';

/// This screen is used to display the details of
/// new products.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      Provider.of<HomeScreenProvider>(context, listen: false)
          .getDataOfProducts(context);
      Provider.of<HomeScreenProvider>(context, listen: false)
          .getBanner(context);
      Provider.of<WishListProvider>(context, listen: false)
          .getDataOfWishList(context);
    });
    // This variable is used to calculate the size of the device.
    Size size = MediaQuery.of(context).size;
    return Consumer<HomeScreenProvider>(
      builder: (context, productValue, child) {
        // print(productValue.bannerModels?.image.first.url.toString());
        return productValue.bannerModels != null
            ? ListView(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Provider.of<WishListProvider>(context, listen: false)
                            .getDataOfWishList(context);
                      },
                      child: Text('ah')),
                  SizedBox(
                    width: size.width,
                    height: size.height * .2,
                    child: Image(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        productValue.bannerModels!.banner.first.image.first.url
                            .toString(),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.02),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                          physics: const ScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: size.width * 0.02,
                            crossAxisSpacing: size.width * 0.02,
                            childAspectRatio: 0.95,
                          ),
                          itemCount:
                              productValue.productModels?.products?.length ?? 0,
                          itemBuilder: (context, index) {
                            final data =
                                productValue.productModels?.products?[index];
                            return GestureDetector(
                              onTap: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => ProductScreen(
                                    products: data,
                                  ),
                                ),
                              ),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.width * 0.01),
                                height: size.height * 0.05,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: size.width * 0.33,
                                      child: Image.network(
                                        data!.image!.first.url.toString(),
                                      ),
                                    ),
                                    Text(data.productname.toString()),
                                    Text(
                                      data.description.toString(),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      '₹ ${data.price}',
                                      style: TextStyle(
                                          fontSize: size.width * 0.05),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  )
                ],
              )
            : const ShimmerWidget();
      },
    );
  }
}
