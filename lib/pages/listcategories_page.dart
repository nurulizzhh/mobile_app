import 'package:flutter/material.dart';
import 'package:mobile_app/model/categories_model.dart';
import 'package:mobile_app/model/menu_model.dart';
import 'package:mobile_app/pages/bottomnavbar_page.dart';
import 'package:mobile_app/pages/detail_page.dart';

class ListCategoriesPage extends StatelessWidget {
   final String selectedCategory;

    ListCategoriesPage({required this.selectedCategory, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 255, 190, 106),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 30, bottom: 10),
              child: Text(
                "Collection",
                style: TextStyle(
                  color: Color.fromARGB(255, 214, 121, 0),
                  fontSize: 24,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            Container(
              height: 1000,
              padding: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                )
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Your saved recipes',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                      ),
                    ),
                  ),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: favorit.where((menu) => menu.kategori == items).length,
                    itemBuilder: (context, index) {
                      final favoritKategori = favorit.where((menu) => menu.kategori == selectedCategory).toList();
                      final add = favoritKategori[index];

                      return GestureDetector(
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => DetailPage(item: add),
                          ),
                        ),
                        child: Container(
                          margin: EdgeInsets.only(left: 10, right: 10, bottom: 10,),
                          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
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
                              Image.asset(
                                add.foto,
                                height: 180,
                                width: 120,
                                fit: BoxFit.contain,
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 15),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        add.kategori,
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.blueGrey,
                                          fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      SizedBox(height: 5,),
                                      Text(
                                        add.nama,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      SizedBox(height: 7,),
                                      Row(
                                        children: [
                                          Row(
                                            children: List.generate(
                                              5,
                                              (index) => Icon(
                                                Icons.star,
                                                color: Color.fromARGB(255, 248, 163, 52),
                                                size: 12,
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 15),
                                          Text(
                                            add.kalori,
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Color.fromARGB(255, 248, 163, 52),
                                              fontWeight: FontWeight.bold
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 8,),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.access_time,
                                            color: Colors.grey,
                                            size: 14,
                                          ),
                                          SizedBox(width: 5,),
                                          Text(
                                            add.waktu,
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.grey
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
                                  onPressed: (){},
                                  icon: Icon(Icons.favorite),
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),

                  Padding(
                    padding: const EdgeInsets.only(right: 40, left: 40, top: 50),
                    child: InkWell(
                      onTap: () {
                          Navigator.push(
                              context, MaterialPageRoute(builder:
                              (context) => MyBottomNavigationBar()));
                      },
                      child: Container(
                        width: double.infinity,
                        height: 40,
                        decoration: BoxDecoration(
                          boxShadow: [
                              BoxShadow(
                                color: const Color.fromARGB(255, 223, 223, 223), 
                                offset: Offset(0, 1), 
                                blurRadius: 1, 
                                spreadRadius: 1, 
                              ),
                            ],
                          borderRadius: BorderRadius.circular(5),
                          color: Color.fromARGB(255, 255, 234, 142),
                        ),
                        child: Center(
                          child: Text(
                              'Back',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
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