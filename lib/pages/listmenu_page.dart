import 'package:flutter/material.dart';
import 'package:mobile_app/model/recipe_model.dart';
import 'package:mobile_app/pages/bottomnavbar_page.dart';
import 'package:mobile_app/pages/detail_page.dart';
import 'package:mobile_app/service/http_service.dart';

class ListMenuPage extends StatefulWidget {
  ListMenuPage({super.key});

  @override
  State<ListMenuPage> createState() => _ListMenuPageState();
}

class _ListMenuPageState extends State<ListMenuPage> {
  List<Detail> dataDetail = [];
  bool isLoading = true;

  void fetchRecommended() async {
    try {
      Map data = await HttpService().getRecommended();
      List<Detail> detailItems =
          (data["meals"] as List).map((item) => Detail.fromJson(item)).toList();
      setState(() {
        dataDetail = detailItems;
        isLoading = false;
      });
    } catch (e) {
      print('Error fetching recommended data: $e');
      isLoading = false;
    }
  }

  @override
  void initState() {
    fetchRecommended();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40, bottom: 10),
              child: Row(
                children: [
                  IconButton(
                    color: Colors.white,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyBottomNavigationBar()));
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      size: 24,
                    ),
                  ),
                  Text(
                    "Recipes",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    )),
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
                            color: Colors.black),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: SingleChildScrollView(
                          child: isLoading
                              ? Center(child: CircularProgressIndicator())
                              : ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
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
                                            vertical: 12, horizontal: 12),
                                        height: 110,
                                        width:
                                            MediaQuery.of(context).size.width,
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
                                          color: Color.fromARGB(
                                              188, 255, 254, 254),
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 15),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      item.category,
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          color:
                                                              Colors.blueGrey,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text(
                                                      item.mealName,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    SizedBox(
                                                      height: 7,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          item.area,
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      248,
                                                                      163,
                                                                      52),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        Text(
                                                          ' Food',
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      248,
                                                                      163,
                                                                      52),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
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
                                                              color:
                                                                  Colors.grey),
                                                        ),
                                                        Text(
                                                          item.tags,
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              color:
                                                                  Colors.grey),
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
                                                icon: Icon(
                                                    Icons.favorite_outline),
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
      ),
    );
  }
}
