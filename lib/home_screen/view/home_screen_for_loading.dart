import 'package:flutter/material.dart';
import 'package:phonix_smartphone_store/home_screen/controller/home_sceen_provider.dart';
import 'package:phonix_smartphone_store/home_screen/view/shimmer_widget.dart';
import 'package:provider/provider.dart';
import 'home_screen.dart';

class HomeScreenForLoading extends StatelessWidget {
  const HomeScreenForLoading({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Provider.of<HomeScreenProvider>(
                      context,
                    ).isShimmerOfHomeScreen ==
                    true
                ? const ShimmerWidget()
                : const HomeScreen()
          ],
        ),
      ),
    );
  }
}
