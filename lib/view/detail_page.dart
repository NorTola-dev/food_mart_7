import 'package:flutter/material.dart';
import 'package:storeapp/model/add_to_cart_model.dart';
import 'package:storeapp/model/product_model.dart';

// ignore: must_be_immutable
class DetailPage extends StatefulWidget {
  ProductModel product;
  DetailPage({super.key, required this.product});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int qty = 1;
  TextEditingController numController = TextEditingController();
  @override
  void initState() {
    super.initState();
    numController.text = qty.toString();
    numController.clear();
  }

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
            icon: !widget.product.isFav
                ? Icon(Icons.favorite_border_rounded)
                : Icon(Icons.favorite, color: Colors.red),
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 350,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.amber,
                image: DecorationImage(
                  image: NetworkImage(widget.product.image),
                  fit: BoxFit.cover,
                ),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    color: Colors.grey,
                    offset: Offset(3, 3),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      widget.product.name,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(widget.product.type),
                  ],
                ),

                widget.product.discount == 0
                    ? Text(
                        '\$ ${widget.product.price} /kg',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '\$ ${(widget.product.price - (widget.product.price * widget.product.discount / 100)).toStringAsFixed(2)} /kg',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '\$ ${widget.product.price} /kg',
                            style: TextStyle(
                              fontSize: 18,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        ],
                      ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              "Description",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Text(widget.product.des),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    double price = double.parse(
                      (widget.product.price -
                              (widget.product.price *
                                  widget.product.discount /
                                  100))
                          .toStringAsFixed(2),
                    );
                    addProducts.add(
                      AddToCartModel(
                        image: widget.product.image,
                        name: widget.product.name,
                        qty: qty,
                        price: price,
                      ),
                    );
                    print(addProducts.length);
                  },
                  child: Container(
                    width: 150,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(child: Text('Add to Cart')),
                  ),
                ),
                Container(
                  width: 230,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                if (qty > 0) {
                                  setState(() {
                                    qty--;
                                    numController.text = qty.toString();
                                  });
                                }
                              },
                              icon: Icon(Icons.remove_circle_outline),
                            ),
                            Container(
                              height: 50,
                              width: 50,
                              child: TextField(
                                controller: numController,
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(fontSize: 20),
                                  border: InputBorder.none,
                                ),
                                onChanged: (value) {
                                  qty = int.tryParse(value) ?? 1;
                                },
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  qty++;
                                  numController.text = qty.toString();
                                });
                              },
                              icon: Icon(Icons.add_circle_outline),
                            ),
                          ],
                        ),
                        Container(
                          width: 70,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Icon(Icons.shopping_cart_outlined),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
