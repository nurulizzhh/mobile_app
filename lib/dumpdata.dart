// import 'package:flutter/material.dart';
// import 'package:mobile_app/service/http_service.dart';

// class DataDump extends StatefulWidget {
//   const DataDump({super.key});

//   @override
//   State<DataDump> createState() => _DataDumpState();
// }

// class _DataDumpState extends State<DataDump> {
//   HttpService fetchData = new HttpService();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: FutureBuilder(
//         future: fetchData.getData(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           } else if (snapshot.hasError) {
//             return Center(
//               child: Text('Error'),
//             );
//           } else {
//             List data = snapshot.data!;
//             return ListView.builder(
//               itemCount: data.length,
//               itemBuilder: (BuildContext context, int index) {
//                 return ListTile(
//                   title: Text(data[index]['strMeal']),
//                 );
//               },
//             );
//           }
//         },
//       ),
//     );
//   }
// }
