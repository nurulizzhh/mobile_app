import 'package:flutter/material.dart';
import 'package:mobile_app/model/categories_model.dart';
import 'package:mobile_app/pages/listcategories_page.dart';

class CategoriesPage extends StatefulWidget {
  CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ListCategoriesPage(selectedCategory: item.kategori),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Color.fromARGB(188, 255, 254, 254),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 199, 199, 199),
                      offset: Offset(0, 1),
                      blurRadius: 1,
                      spreadRadius: 1,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(15)),
              margin: EdgeInsets.all(5),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Image.asset(item.foto),
                    ),
                  ),
                  Expanded(
                      child: Text(
                    item.kategori,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  )),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
