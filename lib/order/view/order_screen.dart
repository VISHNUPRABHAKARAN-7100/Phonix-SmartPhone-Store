import 'package:flutter/material.dart';
import 'package:phonix_smartphone_store/home_screen/view/my_app_screen.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Order Placed Successfully'),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const MyAppScreen(),
                  ),
                );
              },
              child: const Text('Continue Shopping'),
            )
          ],
        ),
      ),
    );
  }
}
