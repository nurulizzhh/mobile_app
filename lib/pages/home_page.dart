import 'package:flutter/material.dart';
import 'package:mobile_app/model/menu_model.dart';
import 'package:mobile_app/pages/detail_page.dart';
import 'package:mobile_app/pages/listcategories_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Color.fromARGB(255, 255, 190, 106),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 20),
              child: Text(
                "Hello Nurul!",
                style: TextStyle(
                  color: Color.fromARGB(255, 214, 121, 0),
                  fontSize: 24,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 5, bottom: 10),
              child: Text(
                "what would you like to cook today ?",
                style: TextStyle(
                  color:Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Color.fromARGB(10, 0, 0, 0),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.search,
                    color: Colors.black38,
                  ),
                  SizedBox(width: 10),
                  Expanded(child: Text(
                    'Search for recipes',
                    style: TextStyle(
                      color: Colors.black38,
                      fontSize: 14,
                    ),))
                ],
              ),
            ),
            SizedBox(height: 10,),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                )
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 0, top: 10, bottom: 10),
                    child: Text('Explore',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                    child: 
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        CategoryCircleAvatar(
                          foto: 'images/breakfast.png',
                          label: 'Breakfast',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ListCategoriesPage(selectedCategory: 'Breakfast'),
                              ),
                            );
                          },
                        ),
                        CategoryCircleAvatar(
                          foto: 'images/lunch.png',
                          label: 'Lunch',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ListCategoriesPage(selectedCategory: 'Lunch'),
                              ),
                            );
                          },
                        ),
                        CategoryCircleAvatar(
                          foto: 'images/dinner.png',
                          label: 'Dinner',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ListCategoriesPage(selectedCategory: 'Dinner'),
                              ),
                            );
                          },
                        ),
                        CategoryCircleAvatar(
                          foto: 'images/dessert.png',
                          label: 'Dessert',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ListCategoriesPage(selectedCategory: 'Dessert'),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Recomended',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        GestureDetector(
                          onTap: () => print('Recomended'),
                          child: Text(
                            'See All',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color.fromARGB(255, 248, 163, 52),
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: rekomendasi.length,
                    itemBuilder: (context, index) {
                      final item = rekomendasi[index];
                      return GestureDetector(
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => DetailPage2(item: rekomendasi[index]))
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
                                item.foto,
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
                                        item.kategori,
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.blueGrey,
                                          fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      SizedBox(height: 5,),
                                      Text(
                                        item.nama,
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
                                          SizedBox(width:15),
                                          Text(
                                            item.kalori,
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
                                            item.waktu,
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
                                  onPressed:(){}, 
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
                ],
              ),
            ),  
          ],
        ),
      ),
    );
    
  }
}

class CategoryCircleAvatar extends StatelessWidget {
  final String label;
  final String foto;
  final VoidCallback onPressed;

  CategoryCircleAvatar({required this.label, required this.foto, required this.onPressed});

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
              backgroundImage: AssetImage(foto),
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
