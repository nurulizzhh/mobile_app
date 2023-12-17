import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app/model/menu_model.dart';
import 'package:mobile_app/pages/detail_page.dart';
import 'package:mobile_app/pages/listcategories_page.dart';
import 'package:mobile_app/pages/listmenu_page.dart';
import 'package:mobile_app/service/http_service.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List data_categories = [];
  List data_recommended = [];

  void Categories() async {
    try {
      Map data = await HttpService().getDatasCategory();
      setState(() {
        data_categories = data["categories"];
      });
    } catch (e) {
      print('Error fetching category data: $e');
    }
  }

  void Recommended() async {
    try {
      Map data = await HttpService().getRecommended();
      setState(() {
        data_recommended = data["meals"];
      });
    } catch (e) {
      print('Error fetching category data: $e');
    }
  }

  @override
  void initState() {
    Categories();
    Recommended();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  top: 40,
                ),
                child: Text(
                  "Hello Nurul!",
                  style: GoogleFonts.breeSerif(
                      fontSize: 36,
                      fontWeight: FontWeight.w900,
                      color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 30, right: 10),
                child: CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage('images/profil.jpeg'),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 5, bottom: 10),
            child: Text(
              "what would you like to cook today ?",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  )),
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 0, top: 10, bottom: 10),
                    child: Text(
                      'Explore',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                    child: SizedBox(
                      height: 104,
                      child: ListView.builder(
                        itemCount: data_categories.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          final category = data_categories[index];
                          return Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: CategoryCircleAvatar(
                              foto: category['strCategoryThumb'],
                              label: category['strCategory'],
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ListCategoriesPage(
                                      selectedCategory: category['strCategory'],
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Recomended',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ListMenuPage(),
                              ),
                            );
                          },
                          child: Text(
                            'See All',
                            style: TextStyle(
                                fontSize: 14,
                                color: Color.fromARGB(255, 248, 163, 52),
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: SingleChildScrollView(
                        child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            final item = data_recommended[index];
                            return GestureDetector(
                              onTap: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) => DetailPage(
                                          item: data_recommended[index]))),
                              child: Container(
                                margin: EdgeInsets.only(
                                  left: 10,
                                  right: 10,
                                  bottom: 10,
                                ),
                                padding: EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 12),
                                height: 110,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color.fromARGB(
                                          255, 223, 223, 223),
                                      offset: Offset(0, 1),
                                      blurRadius: 1,
                                      spreadRadius: 1,
                                    ),
                                  ],
                                  color: Color.fromARGB(188, 255, 254, 254),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  children: [
                                    Image.network(
                                      item['strMealThumb'],
                                      height: 180,
                                      width: 120,
                                      fit: BoxFit.contain,
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              item['strCategory'],
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.blueGrey,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              item['strMeal'],
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height: 7,
                                            ),
                                            Row(
                                              children: [
                                                Row(
                                                  children: List.generate(
                                                    5,
                                                    (index) => Icon(
                                                      Icons.star,
                                                      color: Color.fromARGB(
                                                          255, 248, 163, 52),
                                                      size: 12,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(width: 15),
                                                Text(
                                                  item['strArea'],
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Color.fromARGB(
                                                          255, 248, 163, 52),
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  ' Food',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Color.fromARGB(
                                                          255, 248, 163, 52),
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 8,
                                            ),
                                            Row(
                                              children: [
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  '# ',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.grey),
                                                ),
                                                Text(
                                                  item['strTags'] ?? 'none',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.grey),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.favorite_outline),
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryCircleAvatar extends StatelessWidget {
  final String label;
  final String foto;
  final VoidCallback onPressed;

  CategoryCircleAvatar(
      {required this.label, required this.foto, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: <Widget>[
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(255, 199, 199, 199),
                  offset: Offset(0, 1),
                  blurRadius: 1,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: NetworkImage(foto),
              radius: 40,
            ),
          ),
          SizedBox(height: 8),
          Text(label),
        ],
      ),
    );
  }
}
