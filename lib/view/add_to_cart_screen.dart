import 'package:flutter/material.dart';
import 'package:storeapp/model/add_to_cart_model.dart';

class AddToCartScreen extends StatefulWidget {
  const AddToCartScreen({super.key});

  @override
  State<AddToCartScreen> createState() => _AddToCartScreenState();
}

class _AddToCartScreenState extends State<AddToCartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: addProducts.length,
        itemBuilder: (context, index){
          return Text(addProducts[index].name);
        },),
    );
  }
}