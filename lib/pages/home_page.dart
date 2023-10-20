import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app/model/menu_model.dart';
import 'package:mobile_app/pages/detail_page.dart';
import 'package:mobile_app/pages/listcategories_page.dart';
import 'package:mobile_app/pages/listmenu_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

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
                padding: const EdgeInsets.only(left: 10, top: 40,),
                child: Text(
                  "Hello Nurul!",
                  style: GoogleFonts.breeSerif(
                    fontSize: 36,
                    fontWeight: FontWeight.w900,
                    color: Colors.white
                  ),
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
                color:Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(12),
            child: TextField(
              style: TextStyle(color: Colors.white),
              cursorColor: const Color.fromARGB(115, 151, 151, 151),
              decoration: InputDecoration(
                fillColor: Color.fromARGB(169, 94, 94, 94),
                filled: true,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    )),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 20,
                ),
                prefixIcon: const Icon(
                  Icons.search_outlined,
                  color: Color.fromARGB(115, 255, 255, 255),
                  size: 26,
                ),
                hintText: 'Search for recipes',
                hintStyle:
                    TextStyle(fontSize: 16, color: const Color.fromARGB(115, 255, 255, 255)),
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
                              fontWeight: FontWeight.bold
                            ),
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
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            final item = menu[index];
                            return GestureDetector(
                              onTap: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => DetailPage(item: menu[index]))
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
                                                Text(
                                                      ' Kalori',
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
                                                Text(
                                                  ' Menit',
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
