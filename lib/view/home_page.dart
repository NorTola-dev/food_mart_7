import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:storeapp/model/category_model.dart';
import 'package:storeapp/model/product_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Delivery Address'),
            Row(
              children: [
                Icon(Icons.location_on, color: Colors.amber),
                Text('Phnom Penh', style: TextStyle(fontSize: 14)),
              ],
            ),
          ],
        ),
        actions: [
          Container(
            width: 70,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.black,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.shopping_bag_outlined, color: Colors.white),
                Text('0', style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
          SizedBox(width: 10),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            ImageSlideshow(
              isLoop: true,
              autoPlayInterval: 2000,
              initialPage: 2,
              children: [
                Image.network(
                  'https://i.pinimg.com/1200x/2b/87/b0/2b87b02348339ca516971a0b9a9e26b6.jpg',
                  fit: BoxFit.cover,
                ),
                Image.network(
                  'https://i.pinimg.com/736x/5c/a3/c1/5ca3c1501d3b11d4f5030eacd823cd5c.jpg',
                  fit: BoxFit.cover,
                ),
                Image.network(
                  'https://i.pinimg.com/736x/87/ea/fb/87eafbb80045067f4fb3b32f1fd4af4e.jpg',
                  fit: BoxFit.cover,
                ),
              ],
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Search',
                  hintText: 'Search Product',
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: Icon(Icons.sort_rounded),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Categories',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Text('See All'),
                ],
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categoryList.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(left: 20),
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.white,
                          child: Text(
                            categoryList[index].icon,
                            style: TextStyle(fontSize: 23),
                          ),
                        ),
                        Text(categoryList[index].name),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 10),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 0.7,
              ),
              itemCount: 10,
              itemBuilder: (context, index) {

                var pro = products[index];

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 10,
                          offset: Offset(5, 5)
                        )
                      ]
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            pro.discount == 0
                                ? Text('')
                                : Container(
                                    width: 60,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.yellow,
                                    ),
                                    child: Center(
                                      child: Text(
                                        '${pro.discount} %',
                                      ),
                                    ),
                                  ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.favorite_border_outlined),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 150,
                          width: double.infinity,
                          child: Image.network(pro.image, fit: BoxFit.cover,),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text(pro.name),
                                  Text('\$ ${pro.price} / kg')
                                ],
                              ),
                              CircleAvatar(radius: 25,
                                backgroundColor: Colors.amber,
                                child: Icon(Icons.shopping_bag_outlined),
                              
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
