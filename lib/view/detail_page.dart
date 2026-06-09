import 'package:flutter/material.dart';
import 'package:storeapp/model/product_model.dart';

class DetailPage extends StatefulWidget {
  ProductModel product;
  DetailPage({super.key, required this.product});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product.name),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                widget.product.isFav = !widget.product.isFav;
              });
            },
            icon: !widget.product.isFav? Icon(Icons.favorite_border_rounded) : Icon(Icons.favorite, color: Colors.red,),
          ),
        ],
      ),

      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    widget.product.name,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Text(widget.product.type),
                ],
              ),

              widget.product.discount == 0 ?

              Text(
                '\$ ${widget.product.price} /kg',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ) : 
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '\$ ${(widget.product.price - (widget.product.price * widget.product.discount / 100)).toStringAsFixed(2)} /kg',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '\$ ${widget.product.price} /kg',
                    style: TextStyle(fontSize: 18, decoration: TextDecoration.lineThrough),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
