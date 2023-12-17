class Category {
  final String label;
  final String imageUrl;

  Category({required this.label, required this.imageUrl});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      label: json['strCategory'] ?? '',
      imageUrl: json['strCategoryThumb'] ?? '',
    );
  }
}

class Detail {
  final String category;
  final String mealName;
  final String imageUrl;
  final String area;
  final String tags;

  Detail({
    required this.category,
    required this.mealName,
    required this.imageUrl,
    required this.area,
    required this.tags,
  });

  factory Detail.fromJson(Map<String, dynamic> json) {
    return Detail(
      category: json['strCategory'] ?? '',
      mealName: json['strMeal'] ?? '',
      imageUrl: json['strMealThumb'] ?? '',
      area: json['strArea'] ?? '',
      tags: json['strTags'] ?? '',
    );
  }
}
