import 'package:flutter/material.dart';
import 'package:mobile_app/model/menu_model.dart';
import 'package:mobile_app/pages/bottomnavbar_page.dart';
import 'package:mobile_app/pages/detail_page.dart';

class ListMenuPage extends StatelessWidget {

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
                        context, MaterialPageRoute(builder:
                        (context) => MyBottomNavigationBar())
                      );
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      size: 24,
                    ),
                  ),
                  Text(
                    "All Recipes",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold
                    ),
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
                  )
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
                          color: Colors.black
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: SingleChildScrollView(
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: menu.length,
                            itemBuilder: (context, index) {
                              final item = menu[index];
                              return GestureDetector(
                                onTap: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => DetailPage(item: menu[index]),
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
                                                  SizedBox(width: 15),
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
                                          onPressed: (){},
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
      ),
    );
  }
}