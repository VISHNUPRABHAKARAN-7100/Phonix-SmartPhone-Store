import 'package:flutter/material.dart';
import 'package:phonix_smartphone_store/cart_sceen/controller/cart_provider.dart';
import 'package:provider/provider.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<CartProvider>(context, listen: false).getDataOfCart();
    // Variable for calculating the dimension of device.
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Text(
                  'Cart',
                  style: TextStyle(fontSize: size.width * 0.06),
                ),
                ListView.builder(
                  itemCount: Provider.of<CartProvider>(context)
                      .cartModel
                      ?.cart
                      .cartItems
                      .length,
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemBuilder: (context, index) {
                    final cartProduct =
                        Provider.of<CartProvider>(context, listen: false)
                            .cartModel;
                    return Card(
                      elevation: 8,
                      shadowColor: Colors.blue,
                      child: Container(
                        width: size.width,
                        height: size.height * 0.2323,
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            Row(
                              children: [
                                Image.network(
                                  fit: BoxFit.cover,
                                  cartProduct!.cart.cartItems[index].productId
                                      .image.first.url
                                      .toString(),
                                  height: size.height * 0.14,
                                  width: size.height * 0.14,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(cartProduct.cart.cartItems[index]
                                        .productId.productname),
                                    SizedBox(
                                      height: size.height * 0.01,
                                    ),
                                    Row(
                                      children: [
                                        GestureDetector(
                                          child: const Icon(Icons.add),
                                        ),
                                        SizedBox(
                                          height: size.height * 0.05,
                                          width: size.height * 0.05,
                                          child: const Card(
                                            elevation: 3,
                                            child: Center(
                                              child: Text('1'),
                                            ),
                                          ),
                                        ),
                                        GestureDetector(
                                          child: Text(
                                            '-',
                                            style: TextStyle(
                                              fontSize: size.width * 0.09,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: size.height * 0.01,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                         '₹${cartProduct.cart.cartItems[index]
                                              .productId.mrp}',
                                          style: TextStyle(
                                            fontSize: size.width * 0.05,
                                          ),
                                        ),
                                        SizedBox(
                                          width: size.width * 0.01,
                                        ),
                                        const Text('MRP '),
                                        Text(
                                         '₹${cartProduct.cart.cartItems[index]
                                              .productId.price}',
                                          style: const TextStyle(
                                            decoration:
                                                TextDecoration.lineThrough,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                            const Divider(
                              thickness: 1,
                              color: Colors.grey,
                            ),
                            ButtonTheme(
                              minWidth: 100.0,
                              height: 10.0,
                              child: TextButton(
                                onPressed: () {},
                                child: const Text("Remove"),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
            width: size.width,
            height: size.height * 0.07,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Total Amount'),
                ElevatedButton(
                  onPressed: () {
                    // Provider.of<CartProvider>(context, listen: false)
                    //     .paymetButton(context);

                    //
                    // Navigator.of(context).push(
                    //   MaterialPageRoute(
                    //     builder: (context) => const AddressScreen(),
                    //   ),
                    // );

                    // Provider.of<CartProvider>(context,listen: false).getCartDetails();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                  ),
                  child: const Text('Pay'),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
