class CategoryModel {
  
  String kategori;
  String foto;

  CategoryModel({required this.kategori, required this.foto});
}

final List<CategoryModel> items = [
    CategoryModel(kategori: 'Breakfast', foto: 'images/breakfast.png'),
    CategoryModel(kategori: 'Lunch', foto: 'images/lunch.png'),
    CategoryModel(kategori: 'Dinner', foto: 'images/dinner.png'),
    CategoryModel(kategori: 'Dessert', foto: 'images/dessert.png'),
  ];