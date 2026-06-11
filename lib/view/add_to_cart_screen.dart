import 'package:flutter/material.dart';
import 'package:storeapp/model/add_to_cart_model.dart';

class AddToCartScreen extends StatefulWidget {
  const AddToCartScreen({super.key});

  @override
  State<AddToCartScreen> createState() => _AddToCartScreenState();
}

class _AddToCartScreenState extends State<AddToCartScreen> {
  double sum = 0;

  @override
  Widget build(BuildContext context) {
    for (var e in addProducts) {
      sum += e.price * e.qty;
    }
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: addProducts.length,
              itemBuilder: (context, index) {
                var pro = addProducts[index];
                return ListTile(
                  leading: Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      image: DecorationImage(
                        image: NetworkImage(pro.image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  title: Text(pro.name),
                  subtitle: Text((pro.price * pro.qty).toString()),
                  trailing: Text(pro.qty.toString()),
                );
              },
            ),
            SizedBox(height: 500),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [Text('Total'), Text('\$$sum')],
            ),
          ],
        ),
      ),
    );
  }
}
