import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phonix_smartphone_store/address_screen/view/add_new_address_screen.dart';
import 'package:phonix_smartphone_store/utils/constant_colors.dart';

/// This screen is used to display the addresses of the
/// user and user can add a new address.
class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ConstantColors.appBackgroundColor,
        title: Text(
          'PHONIX',
          style: GoogleFonts.ubuntu(
              color: ConstantColors.constantBlackColor,
              fontSize: size.height * 0.035),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
        child: ListView(
          children: [
            Text(
              'Your Address',
              style: TextStyle(fontSize: size.width * 0.06),
            ),
            Card(
              elevation: 5,
              child: SizedBox(
                width: size.width,
                height: size.height * 0.05,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>  AddNewAddress(),
                      ),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.add, color: Colors.blue),
                      Text(
                        'Add a new address',
                        style: TextStyle(
                          fontSize: size.width * 0.05,
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            ListView.builder(
              physics: const ScrollPhysics(),
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index) => Card(
                elevation: 8,
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.02,
                      vertical: size.width * 0.02),
                  // color: Colors.amber,
                  width: size.width,
                  height: size.height * 0.2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Name of the User',
                        style: TextStyle(fontSize: size.width * 0.051),
                      ),
                      Text(
                        'Place',
                        style: TextStyle(fontSize: size.width * 0.051),
                      ),
                      Text(
                        'Place',
                        style: TextStyle(fontSize: size.width * 0.051),
                      ),
                      Text(
                        'Pincode',
                        style: TextStyle(fontSize: size.width * 0.051),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
