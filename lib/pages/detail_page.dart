import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app/model/menu_model.dart';

class DetailPage extends StatelessWidget {

  final MenuModel item;
  DetailPage({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '${item.nama}',
          style: GoogleFonts.breeSerif(
            fontSize: 25,
            fontWeight: FontWeight.w900,
            color: Colors.black
          ),
          textAlign: TextAlign.left,
        ),
        toolbarHeight: 50,
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
                  Image.asset('${item.foto}'),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 55,
                        width: 150,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.grey[50],
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(255, 199, 199, 199), 
                              offset: Offset(0, 0),
                              blurRadius: 5, 
                              spreadRadius: 1, 
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Container(
                              height: 44,
                              width: 44,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color.fromARGB(255, 199, 199, 199), 
                                    offset: Offset(0, 0),
                                    blurRadius: 5, 
                                    spreadRadius: 1, 
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Text(
                                  '${item.kalori}',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 20,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Kalori',
                                  style: GoogleFonts.nunito(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                                Text('Kcal',
                                  style: GoogleFonts.poppins(
                                    color: Colors.grey[400],
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 55,
                        width: 150,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.grey[50],
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(255, 199, 199, 199), 
                              offset: Offset(0, 0),
                              blurRadius: 5, 
                              spreadRadius: 1, 
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Container(
                              height: 44,
                              width: 44,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color.fromARGB(255, 199, 199, 199), 
                                    offset: Offset(0, 0),
                                    blurRadius: 5, 
                                    spreadRadius: 1, 
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Text(
                                  '${item.waktu}',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 20,),
                            Text('Menit',
                              style: GoogleFonts.nunito(
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Bahan-bahan',
                          style: GoogleFonts.varelaRound(
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                            color: Colors.black
                          ),
                        ),
                        SizedBox(height: 5,),
                        Text(
                          '${item.bahan}',
                          style: GoogleFonts.varelaRound(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(130, 0, 0, 0)
                          )
                        ),
                        SizedBox(height: 30,),
                        Text(
                          'Langkah Memasak',
                          style: GoogleFonts.varelaRound(
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                            color: Colors.black
                          ),
                        ),
                        SizedBox(height: 5,),
                        Text(
                          '${item.tahap}',
                          style: GoogleFonts.varelaRound(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(130, 0, 0, 0)
                          )
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
