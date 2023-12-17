import 'package:flutter/material.dart';
import 'package:mobile_app/pages/detail_page.dart';
import 'package:mobile_app/service/http_service.dart'; // Ganti dengan path yang sesuai

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List searchResults = [];
  TextEditingController _searchController = TextEditingController();

  void searchFoods(String query) async {
    try {
      Map data = await HttpService().getSearch(query);
      setState(() {
        searchResults = data["meals"];
      });
    } catch (e) {
      print('Error searching foods: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                padding: EdgeInsets.all(12),
                child: TextField(
                  cursorColor: const Color.fromARGB(115, 151, 151, 151),
                  controller: _searchController,
                  decoration: InputDecoration(
                    labelText: 'Search for foods',
                    suffixIcon: IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {
                        String query = _searchController.text;
                        searchFoods(query);
                      },
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: SingleChildScrollView(
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: searchResults.length,
                    itemBuilder: (context, index) {
                      final item = searchResults[index];
                      return GestureDetector(
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => DetailPage(
                              imageUrl: item.imageUrl,
                              category: item.category,
                              mealName: item.mealName,
                              area: item.area,
                              tags: item.tags ?? '',
                            ),
                          ),
                        ),
                        child: Container(
                          margin: EdgeInsets.only(
                            left: 10,
                            right: 10,
                            bottom: 10,
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 12,
                          ),
                          height: 110,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: const Color.fromARGB(255, 223, 223, 223),
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
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        item['strMeal'],
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 7),
                                      Row(
                                        children: [
                                          Text(
                                            item['strArea'],
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Color.fromARGB(
                                                  255, 248, 163, 52),
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            ' Food',
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Color.fromARGB(
                                                  255, 248, 163, 52),
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 8),
                                      Row(
                                        children: [
                                          SizedBox(width: 5),
                                          Text(
                                            '# ',
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          Text(
                                            item['strTags'] ?? 'none',
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.grey,
                                            ),
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
    );
  }
}
