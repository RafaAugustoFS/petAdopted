// import 'package:flutter/material.dart';
// import 'package:pet_adopt/view/information.dart';
// import 'package:pet_adopt/widgets/card_animals.dart';
// import 'package:pet_adopt/widgets/card_donate.dart';
// import 'package:pet_adopt/widgets/card_option.dart';
// import 'package:pet_adopt/widgets/header.dart';
// import 'package:pet_adopt/widgets/search.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
 
// class Home extends StatefulWidget {
//   const Home({super.key});
 
//   @override
//   State<Home> createState() => _HomeState();
// }
 
// class _HomeState extends State<Home> {
//   List<dynamic> animals = [];
//   bool isLoading = true;
//   String errorMessage = '';
 
//   @override
//   void initState() {
//     super.initState();
//     fetchAnimals();
//   }
 
//   Future<void> fetchAnimals() async {
//     const String apiUrl =
//         'https://pet-adopt-dq32j.ondigitalocean.app/pet/pets';
 
//     try {
//       final response = await http.get(Uri.parse(apiUrl));
//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);
//         setState(() {
//           animals = data['pets'];
//           isLoading = false;
//         });
//       } else {
//         setState(() {
//           errorMessage = 'Falha ao carregar os dados. Código: ${response.statusCode}';
//           isLoading = false;
//         });
//       }
//     } catch (e) {
//       setState(() {
//         errorMessage = 'Erro: $e';
//         isLoading = false;
//       });
//     }
//   }
 
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: isLoading
//             ? Center(child: CircularProgressIndicator())
//             : errorMessage.isNotEmpty
//                 ? Center(child: Text(errorMessage))
//                 : SingleChildScrollView(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Header(),
//                         Search(),
//                         card_donate(),
//                         SizedBox(height: 5),
//                         Padding(
//                           padding: const EdgeInsets.all(15.0),
//                           child: Text(
//                             'Categories',
//                             textAlign: TextAlign.left,
//                             style: TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                         Row(
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             CardOption(
//                                 text: 'Dogs',
//                                 imagePath: 'assets/images/dog_card.jpg'),
//                             SizedBox(width: 10),
//                             CardOption(
//                                 text: 'Cats',
//                                 imagePath: 'assets/images/cat_card.jpg'),
//                             SizedBox(width: 10),
//                             CardOption(
//                                 text: 'Ferrets',
//                                 imagePath: 'assets/images/furao_card.jpg'),
//                           ],
//                         ),
//                         SizedBox(height: 20),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                           child: GridView.builder(
//                             shrinkWrap: true,
//                             physics: NeverScrollableScrollPhysics(),
//                             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                               crossAxisCount: 2,
//                               crossAxisSpacing: 10,
//                               mainAxisSpacing: 10,
//                               childAspectRatio: 0.7,
//                             ),
//                             itemCount: animals.length,
//                             itemBuilder: (context, index) {
//                               return GestureDetector(
//                                 onTap: () {
//                                   Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                       builder: (context) => InformationPage(),
//                                     ),
//                                   );
//                                 },
//                                 child: CardAnimals(
//                                   name: animals[index]['name'],
//                                   age: ' Age: ${animals[index]['age']} | ',
//                                   color: 'Color: ${animals[index]['color']} ',
//                                   imagePath: animals[index]['image'],
//                                 ),
//                               );
//                             },
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//       ),
//     );
//   }
// }