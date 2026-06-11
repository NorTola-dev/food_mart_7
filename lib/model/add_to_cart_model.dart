class AddToCartModel {
  String image;
  String name;
  int qty;
  double price;
  double total;
  AddToCartModel({required this.image, required this.name, required this.qty, required this.price, required this.total});
}

List<AddToCartModel> addProducts = [
];