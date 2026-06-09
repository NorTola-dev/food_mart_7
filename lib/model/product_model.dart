class ProductModel {
  int id;
  String image;
  String name;
  String type;
  double price;
  String des;
  double discount;
  ProductModel({
    required this.id,
    required this.image,
    required this.name,
    required this.type,
    required this.price,
    required this.des,
    required this.discount
  });
}

List<ProductModel> products = [
  ProductModel(
    id: 1,
    image: 'https://i.pinimg.com/736x/24/f9/ee/24f9eeba6dbfd6f1a8f7b38385c22507.jpg',
    name: 'Apple',
    type: 'Fruit',
    price: 1.5,
    des: 'Fresh red apple, sweet and crisp.',
    discount: 0
  ),
  ProductModel(
    id: 2,
    image: 'https://i.pinimg.com/1200x/32/36/ab/3236ab14f15130907aa86327e14f8d03.jpg',
    name: 'Broccoli',
    type: 'Vegetable',
    price: 2.0,
    des: 'Organic broccoli, rich in vitamins.',
    discount: 0
  ),
  ProductModel(
    id: 3,
    image: 'https://i.pinimg.com/736x/d1/9f/11/d19f118bced7db940011110d3e51480d.jpg',
    name: 'Popcorn',
    type: 'Snack',
    price: 3.5,
    des: 'Buttery popcorn, perfect for movies.',
    discount: 50
  ),
  ProductModel(
    id: 4,
    image: 'https://i.pinimg.com/736x/55/bd/db/55bddb038e45559d90b925a6765c2dc3.jpg',
    name: 'Salmon',
    type: 'Fish',
    price: 12.0,
    des: 'Fresh Atlantic salmon fillet.',
    discount: 0
  ),
  ProductModel(
    id: 5,
    image: 'https://i.pinimg.com/736x/19/a9/67/19a967af9075e9fba56eab1ba1e9abf4.jpg',
    name: 'Banana',
    type: 'Fruit',
    price: 1.2,
    des: 'Ripe yellow bananas, perfect for snacks.',
    discount: 10
  ),
  ProductModel(
    id: 6,
    image: 'https://images.unsplash.com/photo-1567306226416-28f0efdc88ce',
    name: 'Carrot',
    type: 'Vegetable',
    price: 1.8,
    des: 'Crunchy carrots, full of nutrients.',
    discount: 20
  ),
  ProductModel(
    id: 7,
    image: 'https://i.pinimg.com/736x/13/b0/11/13b0112d6666ad4bc9d5c57a629e93b9.jpg',
    name: 'Chicken Breast',
    type: 'Meat',
    price: 8.0,
    des: 'Lean chicken breast, high in protein.',
    discount: 30
  ),
  ProductModel(
    id: 8,
    image: 'https://i.pinimg.com/736x/31/2b/f2/312bf2a16bf4ff597b24203381fb2a7c.jpg',
    name: 'Orange',
    type: 'Fruit',
    price: 1.4,
    des: 'Juicy oranges, rich in vitamin C.',
    discount: 40
  ),
  ProductModel(
    id: 9,
    image: 'https://i.pinimg.com/736x/5a/77/3a/5a773aef4f11816d1623304cc5cf6fd9.jpg',
    name: 'Potato',
    type: 'Vegetable',
    price: 1.0,
    des: 'Golden potatoes, great for fries and mash.',
    discount: 0
  ),
  ProductModel(
    id: 10,
    image: 'https://i.pinimg.com/736x/8f/f4/f0/8ff4f0b8413c8e3ef42a200f43492a77.jpg',
    name: 'Strawberry',
    type: 'Fruit',
    price: 2.5,
    des: 'Sweet strawberries, perfect for desserts.',
    discount: 0
  ),
];
