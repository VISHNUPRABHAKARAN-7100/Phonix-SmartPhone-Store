
import 'package:flutter/material.dart';
import 'package:phonix_smartphone_store/utils/constant_colors.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ConstantColors.appBackgroundColor,
      body: SafeArea(
        child: ListView(
          children: [
            PageView.builder(
              itemBuilder: (context, index) =>const SizedBox(
                width: 100,
                height: 100,
              ),
            )
          ],
        ),
      ),
    );
  }
}
