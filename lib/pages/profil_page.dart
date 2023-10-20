import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 40.0),
        Text(
          "Profile",
          style: GoogleFonts.breeSerif(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: Colors.black
          ),
        ),
        SizedBox(height: 30.0),
        CircleAvatar(
          radius: 80,
          backgroundImage: AssetImage('images/profil.jpeg'),
        ),
        SizedBox(height: 16),
        Text(
          'NURUL IZZAH',
          style: GoogleFonts.varelaRound(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top:30, left:20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Username:'),
              Container(
                margin: EdgeInsets.only(bottom: 20, right: 20, top: 5),
                height: 50,
                decoration: BoxDecoration(
                  color: Color.fromARGB(227, 209, 209, 209),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey)
                ),
                child: Row(
                  children: [
                    SizedBox(width: 20),
                    Icon(
                      Icons.person,
                      color: Colors.grey,
                    ),
                    SizedBox(width: 20,),
                    Text(
                      'nuor',
                      style: TextStyle(
                        fontSize: 18
                      ),
                    )
            
                  ],
                )
              ),
              Text('Email:'),
              Container(
                margin: EdgeInsets.only(bottom: 20, right: 20, top: 5),
                height: 50,
                decoration: BoxDecoration(
                  color: Color.fromARGB(227, 209, 209, 209),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey)
                ),
                child: Row(
                  children: [
                    SizedBox(width: 20),
                    Icon(
                      Icons.email,
                      color: Colors.grey,
                    ),
                    SizedBox(width: 20,),
                    Text(
                      'nuor@gmail.com',
                      style: TextStyle(
                        fontSize: 18
                      ),
                    )
                  ],
                )
              ),
              Text('Phone:'),
              Container(
                margin: EdgeInsets.only(bottom: 20, right: 20, top: 5),
                height: 50,
                decoration: BoxDecoration(
                  color: Color.fromARGB(227, 209, 209, 209),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey)
                ),
                child: Row(
                  children: [
                    SizedBox(width: 20),
                    Icon(
                      Icons.phone,
                      color: Colors.grey,
                    ),
                    SizedBox(width: 20,),
                    Text(
                      '+62 889 0174 9671',
                      style: TextStyle(
                        fontSize: 18
                      ),
                    )
            
                  ],
                )
              ),
              Text('Password:'),
              Container(
                margin: EdgeInsets.only(bottom: 20, right: 20, top: 5),
                height: 50,
                decoration: BoxDecoration(
                  color: Color.fromARGB(227, 209, 209, 209),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey)
                ),
                child: Row(
                  children: [
                    SizedBox(width: 20),
                    Icon(
                      Icons.lock,
                      color: Colors.grey,
                    ),
                    SizedBox(width: 20,),
                    Text(
                      '••••••••••••',
                      style: TextStyle(
                        fontSize: 18
                      ),
                    )
                  ],
                )
              ),
            ],
          ),
        ),
      ],
    );
  }
}

