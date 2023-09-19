import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../firebase_helper/firebase_firestore.helper/firebase_firestore.dart';
import '../../models/user_model/user_model.dart';
import '../../provider/app_provider.dart';
import '../../stripe_helper/stripe_helper.dart';
import '../../widgets/primary_button/primary_button.dart';

class AddAddress extends StatefulWidget {
  const AddAddress({super.key});

  @override
  State<AddAddress> createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  File? image;
  TextEditingController phoneEditingController = TextEditingController();
  TextEditingController cityEditingController = TextEditingController();
  TextEditingController addressEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(
      context,
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text(
          "Address",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        children: [
          const SizedBox(
            height: 12.0,
          ),
          TextFormField(
            controller: cityEditingController,
            decoration: InputDecoration(
              hintText: appProvider.getUserInformation.city,
            ),
          ),
          const SizedBox(
            height: 16.0,
          ),
          TextFormField(
            controller: addressEditingController,
            decoration: InputDecoration(
              hintText: appProvider.getUserInformation.address,
            ),
          ),
          const SizedBox(
            height: 16.0,
          ),
          TextFormField(
            controller: phoneEditingController,
            decoration: InputDecoration(
              hintText: appProvider.getUserInformation.phone,
            ),
          ),
          const SizedBox(height: 16.0,),
          PrimaryButton(
            title: "Continue",
            onPressed: () async {
              UserModel userModel = appProvider.getUserInformation
                  .copyWith(
                city: cityEditingController.text,
                address: addressEditingController.text,
                phone: phoneEditingController.text,
              );
              int value = double.parse(
                  appProvider.totalPriceBuyProductList().toString())
                  .round()
                  .toInt();
              String totalPrice = (value * 100).toString();
              await StripeHelper.instance
                  .makePayment(totalPrice.toString(), context);

            },
          ),
        ],
      ),
    );
  }
}

