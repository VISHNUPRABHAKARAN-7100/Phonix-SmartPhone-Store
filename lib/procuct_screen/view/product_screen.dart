import 'package:flutter/material.dart';
import 'package:phonix_smartphone_store/utils/constant_colors.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            PageView.builder(
              itemCount: 10,
              itemBuilder: (context, index) => Container(
                width: 100,
                height: 100,
                
                color: Colors.red,
              ),
            ) 
          ],
        ),
      ),
    );
  }
}
