import 'package:flutter/material.dart';
import '../../address_screen/view/adrdress_screen.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
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
                  itemCount: 10,
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemBuilder: (context, index) => Card(
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
                                "https://m.media-amazon.com/images/I/61+JqKH4e1L._UX679_.jpg",
                                height: size.height * 0.14,
                                width: size.height * 0.14,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Product Name'),
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
                                              fontSize: size.width * 0.09),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: size.height * 0.01,
                                  ),
                                  Row(
                                    children: [
                                      const Text('Price'),
                                      SizedBox(
                                        width: size.width * 0.01,
                                      ),
                                      const Text('MRP'),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                          // const Spacer(),
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
                  ),
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
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const AddressScreen(),
                      ),
                    );
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
