import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/food.dart';


class FoodTile extends StatelessWidget {

  final Food food;
  final void Function()? onTap;

  const FoodTile({
    super.key,
    required this.food,
    required this.onTap,
  });


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 243, 243, 243),
          borderRadius:BorderRadius.circular(20),
        ),
        margin: EdgeInsets.only(right: 10) ,
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 9.0),
              child: Image.asset(
                food.imagePath,
                height: 140,
              ),
            ),
            const SizedBox(height: 5),

            Text(
              food.name,
              style: GoogleFonts.getFont(
                'Rubik',
                fontSize: 20,
                color: Colors.black87,
              ),
            ),

             const SizedBox(
               height: 7,
             ),

             SizedBox(
              width: 160,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                  '₹ ${food.price}',
                    style: GoogleFonts.getFont(
                      'Rubik',
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey[700],
                    ),
                  ),


                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        size: 20,
                        color: Color.fromARGB(255, 248, 202, 0),
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      Text(
                        food.rating,
                        style: GoogleFonts.getFont(
                          'Rubik',
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  )

                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
