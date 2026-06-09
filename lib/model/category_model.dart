class CategoryModel {
  String name;
  String icon;
  CategoryModel({required this.name, required this.icon});
}

List<CategoryModel> categoryList = [
  CategoryModel(name: 'All', icon: '📦'),
  CategoryModel(name: 'Vegetable', icon: '🥦'),
  CategoryModel(name: 'Meat', icon: '🍖'),
  CategoryModel(name: 'Fruit', icon: '🍎'),
  CategoryModel(name: 'Fish', icon: '🐟'),
  CategoryModel(name: 'Snack', icon: '🍿'),
];
