import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app/model/recipe_model.dart';
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
  List<Category> dataCategories = [];
  List<Detail> dataDetail = [];
  bool isLoading = true;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  late User _user;
  late String _userId;
  late String _username = '';
  late String _profile = '';

  Future<void> _getUserData() async {
    _user = _auth.currentUser!;
    _userId = _user.uid;

    DocumentSnapshot<Map<String, dynamic>> userSnapshot =
        await _firestore.collection('users').doc(_userId).get();

    Map<String, dynamic> userData = userSnapshot.data() ?? {};

    // Set nilai variabel _username
    setState(() {
      _username = userData['username'];
      _profile = userData['photoURL'];
    });
  }

  void Categories() async {
    try {
      Map data = await HttpService().getDatasCategory();
      List<Category> categories = (data["categories"] as List)
          .map((category) => Category.fromJson(category))
          .toList();
      setState(() {
        dataCategories = categories;
      });
    } catch (e) {
      print('Error fetching category data: $e');
    }
  }

  void Recommended() async {
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
    Categories();
    Recommended();
    _getUserData();
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
                  "Hello $_username!",
                  style: GoogleFonts.breeSerif(
                    fontSize: 36,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 30, right: 10),
                child: CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage(_profile),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 5, bottom: 10),
            child: Text(
              "What would you like to cook today?",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
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
                        itemCount: dataCategories.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          final category = dataCategories[index];
                          return Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: CategoryCircleAvatar(
                              foto: category.imageUrl,
                              label: category.label,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ListCategoriesPage(
                                      selectedCategory: category.label,
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
                          'Recommended',
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
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
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
                                itemCount: 4,
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
                                      margin: EdgeInsets.all(10),
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
                                                255, 223, 223, 223),
                                            offset: Offset(0, 1),
                                            blurRadius: 1,
                                            spreadRadius: 1,
                                          ),
                                        ],
                                        color:
                                            Color.fromARGB(188, 255, 254, 254),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Row(
                                        children: [
                                          Image.network(
                                            item.imageUrl, // Correct property name
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
                                                    item.category, // Correct property name
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.blueGrey,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  SizedBox(height: 5),
                                                  Text(
                                                    item.mealName, // Correct property name
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  SizedBox(height: 7),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        item.area, // Correct property name
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          color: Colors.amber,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      Text(
                                                        ' Food',
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          color: Colors.amber,
                                                          fontWeight:
                                                              FontWeight.bold,
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
                                                        item.tags ??
                                                            '-', // Correct property name
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
                                              icon: Icon(
                                                Icons.favorite_outline,
                                                color: Colors.grey,
                                              ),
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
