import 'package:exercise/components/button.dart';
import 'package:exercise/components/food_tile.dart';
import 'package:exercise/models/SHOP.dart';
import 'package:exercise/models/food.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'food_details_page.dart';
class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {


  void navigateToDetails(int index){

    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;

    Navigator.push(context, MaterialPageRoute(
      builder:
          (context)=>FoodDetailsPage(
            food: foodMenu[index] ,
          ),
    ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;
    return  Scaffold(
      resizeToAvoidBottomInset : false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Icon(
          Icons.menu_rounded,
          //size: 32,
          color: Colors.black87,
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.location_on,
              color: Colors.black87,
              size: 18,
            ),
            Text(
              " Pune",
                style: GoogleFonts.getFont(
                    'Rubik',
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
            )
            ),
          ],
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: (){
                Navigator.pushNamed(context, '/cartpage');
          },
              icon: const Icon(
                  Icons.shopping_bag,
                color: Colors.black87,
              ))
        ],

      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration:  BoxDecoration(color:const Color.fromARGB(255, 255, 106, 0), borderRadius: BorderRadius.circular(30) ),
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Free Cold Coffee!!",
                    style: GoogleFonts.getFont(
                      'Rubik',
                      color: const Color.fromARGB(255, 255, 255, 255),
                      fontSize: 20,
                      fontWeight: FontWeight.w400
                    )),
                    const SizedBox(
                      height: 15,
                    ),
                    MyButton(text: "Redeem", onTap: () {  },),
                  ],
                ),
                Image.asset(
                    'lib/images/coffee.png',
                  height: 95,
                )
              ],
            ),
          ),

          const SizedBox(height: 25),

           Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(20),
                ),
                focusedBorder:  OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black87),
                  borderRadius: BorderRadius.circular(20),
                ),
                hintText: "Search for  'Burger'",
                hintStyle: GoogleFonts.getFont('Rubik',fontSize: 15)
              ),
            ),
          ),
          const SizedBox( height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              "Food Menu",
              style: GoogleFonts.getFont(
                  'Rubik',
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
          child:
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 18.0),
               child: ListView.builder
                ( scrollDirection: Axis.horizontal,
                  itemCount: foodMenu.length ,
                  itemBuilder: (context, index) => FoodTile
                (
                      food: foodMenu[index],
                    onTap:() => navigateToDetails(index) ,
                  )),
             ),
          ),

          const SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 243, 243, 243),
              borderRadius:BorderRadius.circular(20),
            ),
            margin: const EdgeInsets.only(left:17, right: 18, bottom: 20) ,
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 15),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                    Container(
                      padding: const EdgeInsets.all(2),
                      decoration:   BoxDecoration(
                        color:  const Color.fromARGB(255, 255, 200, 0),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                         " BEST SELLER ",
                       style: GoogleFonts.getFont(
                           'Rubik',
                         fontWeight: FontWeight.w500,
                         fontSize: 13,
                         color: Colors.white,
                       ),
                   ),
                    ),
                   const SizedBox(
                     height: 10,
                   ),
                   Row(
                     children: [
                       Image.asset(
                         'lib/images/taco.png',
                           height: 80,
                       ),
                       const SizedBox(
                         width: 5,
                       ),
                       Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text(
                             'Shwarma Brota',
                             style: GoogleFonts.getFont(
                               'Rubik',
                               fontSize: 18,
                               fontWeight: FontWeight.w500,
                             ),
                           ),
                           const SizedBox(
                             height: 5,
                           ),
                           Text(
                             '₹ 160',
                             style: GoogleFonts.getFont(
                               'Rubik',
                               fontSize: 18,
                               fontWeight: FontWeight.w400,
                               color: Colors.grey[700],
                             ),
                           ),

                         ],
                       ),
                     ],
                   ),
                 ],
               ),
               Icon(
                 Icons.favorite_border_outlined,
                 color: Colors.grey[600],
                 size: 28,
               )
             ],
           ),
          )
        ],
      ) ,
    );
  }
}
