import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app/model/recipe_model.dart';
import 'package:mobile_app/pages/detail_page.dart';
import 'package:mobile_app/service/http_service.dart';

class ListCategoriesPage extends StatefulWidget {
  final String selectedCategory;

  ListCategoriesPage({required this.selectedCategory, Key? key})
      : super(key: key);

  @override
  State<ListCategoriesPage> createState() => _ListCategoriesPageState();
}

class _ListCategoriesPageState extends State<ListCategoriesPage> {
  List<Detail> dataDetail = [];
  bool isLoading = true;

  void fetchDataByCategory() async {
    try {
      Map data = await HttpService().getDatabyCategory(widget.selectedCategory);
      setState(() {
        dataDetail = List<Detail>.from(
            data["meals"].map((model) => Detail.fromJson(model)));
        isLoading = false;
      });
    } catch (e) {
      print('Error fetching category data: $e');
    }
  }

  @override
  void initState() {
    fetchDataByCategory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          widget.selectedCategory,
          style: GoogleFonts.breeSerif(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.black,
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "Let's make your own food!",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height,
                    child: isLoading
                        ? Center(child: CircularProgressIndicator())
                        : ListView.builder(
                            physics: ScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: dataDetail.length,
                            itemBuilder: (context, index) {
                              final item = dataDetail[index];
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
                                        color: const Color.fromARGB(
                                          255,
                                          223,
                                          223,
                                          223,
                                        ),
                                        offset: Offset(0, 1),
                                        blurRadius: 1,
                                        spreadRadius: 1,
                                      ),
                                    ],
                                    color: Color.fromARGB(
                                      188,
                                      255,
                                      254,
                                      254,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Row(
                                    children: [
                                      Image.network(
                                        item.imageUrl,
                                        height: 180,
                                        width: 120,
                                        fit: BoxFit.contain,
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 15,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                widget.selectedCategory,
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.blueGrey,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                item.mealName,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                ),
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
