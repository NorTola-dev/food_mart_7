import 'package:flutter/material.dart';
import 'package:storeapp/model/add_to_cart_model.dart';

class AddToCartScreen extends StatefulWidget {
  const AddToCartScreen({super.key});

  @override
  State<AddToCartScreen> createState() => _AddToCartScreenState();
}

class _AddToCartScreenState extends State<AddToCartScreen> {
  TextEditingController numController = TextEditingController();
  double sum = 0;
  @override
  Widget build(BuildContext context) {
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
                  trailing: Container(
                    height: 50,
                    width: 200,
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            

                            if (pro.qty > 0) {
                              setState(() {
                                pro.qty--;
                                for (var e in addProducts) {
                                  sum -= e.price * e.qty;
                                }

                                if(pro.qty == 0){
                              addProducts.removeAt(index);
                            }
                              });
                            }
                          },
                          icon: Icon(Icons.remove_circle_outline),
                        ),
                        Container(
                          height: 50,
                          width: 50,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              hintStyle: TextStyle(fontSize: 20),
                              hintText: pro.qty.toString(),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              pro.qty++;
                              for (var e in addProducts) {
                                sum += e.price * e.qty;
                              }
                            });
                          },
                          icon: Icon(Icons.add_circle_outline),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 500),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [Text('Amount'), Text('\$$sum')],
            ),
          ],
        ),
      ),
    );
  }
}
