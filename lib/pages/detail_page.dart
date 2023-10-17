import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app/model/menu_model.dart';

class DetailPage extends StatelessWidget {

  final FavouriteMenuModel item;

  DetailPage({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(
              Icons.favorite_border,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18)),
            Container(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 8),
                    child: Text(
                      '${item.nama}',
                      style: GoogleFonts.breeSerif(
                        fontSize: 36,
                        fontWeight: FontWeight.w900,
                        color: Colors.black
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 16),
                    child: Text('data'),
                  ),
                  Image.asset('${item.foto}'),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[50],
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                  )
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  Text(''),
                  Text('${item.bahan}'),
                  Text('${item.tahap}'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
class DetailPage2 extends StatelessWidget {

  final RecommendedMenuModel item;

  DetailPage2({required this.item});

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: ListView(
          children: [
            Container(
              child: Image.asset('${item.foto}'),
            ),
            Container(
              child: Column(
                children: [
                  Text('${item.nama}'),
                  Text('${item.bahan}'),
                  Text('${item.tahap}'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
