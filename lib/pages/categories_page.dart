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
      margin: EdgeInsets.all(8),
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ListCategoriesPage(selectedCategory: item.jurusan),
                ),
              );
            },
            child:  Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 190, 106),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey, 
                      offset: Offset(0, 2), 
                      blurRadius: 5, 
                      spreadRadius: 2, 
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10)
                ),
                margin: EdgeInsets.all(5),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(7),
                        child: Image.asset(item.foto),
                      ),
                    ),
                    Expanded(
                      child: Text(item.jurusan, 
                      style: TextStyle(
                        color: Colors.white, 
                        fontSize: 24,
                        fontWeight: FontWeight.bold
                      ), 
                      textAlign: TextAlign.center,)
                    ),
                  ],
                ),
              ),
          );
        },
      ), 
    );
  }
}