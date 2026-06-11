class AddToCartModel {
  String image;
  String name;
  int qty;
  double price;
  AddToCartModel({required this.image, required this.name, required this.qty, required this.price});
}

List<AddToCartModel> addProducts = [
];