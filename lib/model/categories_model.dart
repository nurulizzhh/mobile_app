class CategoryModel {
  
  String jurusan;
  String foto;

  CategoryModel({required this.jurusan, required this.foto});
}

final List<CategoryModel> items = [
    CategoryModel(jurusan: 'Breakfast', foto: 'images/breakfast.png'),
    CategoryModel(jurusan: 'Lunch', foto: 'images/lunch.png'),
    CategoryModel(jurusan: 'Dinner', foto: 'images/dinner.png'),
    CategoryModel(jurusan: 'Dessert', foto: 'images/dessert.png'),
  ];