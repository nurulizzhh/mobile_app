import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app/service/http_service.dart';

class DetailPage extends StatefulWidget {
  final String imageUrl;
  final String category;
  final String mealName;
  final String area;
  final String tags;

  DetailPage({
    required this.imageUrl,
    required this.category,
    required this.mealName,
    required this.area,
    required this.tags,
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  List dataDetail = [];
  bool isLoading = true;
  bool isFavorite = false;

  void fetchDetail() async {
    try {
      Map data = await HttpService().getDetail(widget.mealName);
      setState(() {
        dataDetail = data['meals'];
        isLoading = false;
      });
    } catch (e) {
      print('Error fetching food details: $e');
      isLoading = false;
    }
  }

  @override
  void initState() {
    super.initState();
    fetchDetail();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.mealName,
          style: GoogleFonts.breeSerif(
            fontSize: 25,
            fontWeight: FontWeight.w900,
            color: Colors.black,
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
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    child: Column(
                      children: [
                        Image.network(widget.imageUrl),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            buildInfoContainer(
                                'Area', widget.area, CupertinoIcons.flag),
                            buildInfoContainer('Category', widget.category,
                                CupertinoIcons.number),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              buildSectionTitle('Ingredients'),
                              SizedBox(height: 5),
                              buildIngredientsList(),
                              SizedBox(height: 30),
                              buildSectionTitle('Instructions'),
                              SizedBox(height: 5),
                              buildInstructions(),
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

  Widget buildInfoContainer(String title, String value, IconData icon) {
    return Container(
      height: 50,
      width: 170,
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
            child: Center(child: Icon(icon)),
          ),
          SizedBox(width: 20),
          Text(
            value,
            style: GoogleFonts.nunito(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }

  Widget buildSectionTitle(String title) {
    return Text(
      title,
      style: GoogleFonts.varelaRound(
        fontSize: 24,
        fontWeight: FontWeight.w800,
        color: Colors.black,
      ),
    );
  }

  Widget buildIngredientsList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (int i = 1; i <= 20; i++)
          if (dataDetail.isNotEmpty &&
              dataDetail[0]['strIngredient$i'] != null &&
              dataDetail[0]['strIngredient$i'].toString().isNotEmpty)
            Text(
              '• ${dataDetail[0]['strMeasure$i']} ${dataDetail[0]['strIngredient$i']}',
              style: GoogleFonts.varelaRound(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(130, 0, 0, 0),
              ),
            ),
      ],
    );
  }

  Widget buildInstructions() {
    return Text(
      dataDetail.isNotEmpty
          ? dataDetail[0]["strInstructions"].toString()
          : 'Tidak ada instruksi',
      style: GoogleFonts.varelaRound(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: const Color.fromARGB(130, 0, 0, 0),
      ),
    );
  }
}
