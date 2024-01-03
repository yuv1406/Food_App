import 'package:exercise/components/button.dart';
import 'package:exercise/models/SHOP.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../models/food.dart';

class FoodDetailsPage extends StatefulWidget {
  final Food food;
  const FoodDetailsPage({super.key, required this.food});

  @override
  State<FoodDetailsPage> createState() => _FoodDetailsPageState();
}

class _FoodDetailsPageState extends State<FoodDetailsPage> {

  int count = 1;

  void decrement(){
    setState(() {
      while(count>1){
        count--;
      }

    });
  }
  void increment(){
    setState(() {
      count++;
    });
  }
  void addToCart(){
      if(count > 0 ){
        final shop = context.read<Shop>();
        
        shop.addTocart(widget.food, count);

        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) =>  AlertDialog(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
              contentPadding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
              content:
                  Text(
                      "Successfully added to cart !",
                    style: GoogleFonts.getFont(
                      'Rubik',
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
              actions:  [
                IconButton(
                onPressed:(){
                  Navigator.pop(context);
                  Navigator.pop(context);

                 }, icon: const Icon(
                      Icons.check_circle,
                      color: Color.fromARGB(255, 255, 106, 0),
                      size: 40,
                  ))
              ],
              actionsAlignment: MainAxisAlignment.center,
            ),
        );
      }
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black87,
      ),
      body: Column(

        children: [
          Expanded(child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ListView(
              children: [
                Image.asset(widget.food.imagePath,height: 170,),
                const SizedBox(height: 25,),
                 Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: Color.fromARGB(255, 248, 202, 0),
                      size: 25,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      widget.food.rating,
                      style: GoogleFonts.getFont(
                        'Roboto',
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[700],
                      ),
                    ),

                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  widget.food.name,
                  style: GoogleFonts.getFont(
                    'Rubik',
                    fontSize: 27,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Description",
                  style: GoogleFonts.getFont(
                    'Roboto',
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[900],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "Our delicious twist on this Middle Eastern classic features marinated paneer, a medley of fresh veggies, and a selection of special sauces, all wrapped in a wholesome whole wheat roll. Customize your shawarma with your choice of toppings and enjoy the fusion of flavors in every bite. Satisfy your cravings with this healthy yet flavorful delight, perfect for lunch, dinner, or any time you seek a tasty, vegetarian treat.",
                  style: GoogleFonts.getFont(
                    'Ubuntu',
                    fontSize: 14,
                    color: Colors.grey[700],
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w400,
                    height: 1.9,
                  ),
                )
              ],
            ),
          )),
          Container(

            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(25.0),
                  topLeft:Radius.circular(25.0)
              ),
              child: Container(
                padding: const EdgeInsets.all(20),
                color: const Color.fromARGB(255, 255, 106, 0),
                child:  Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      Text(
                          "₹ ${widget.food.price}",
                        style: GoogleFonts.getFont(
                          'Roboto',
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                        const SizedBox(
                          width: 10,
                        ),
                        Row(
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 255, 126, 45),
                                shape: BoxShape.circle,
                              ),
                              child:
                                IconButton(
                                  icon: const Icon(
                                    Icons.remove,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                  onPressed:decrement,
                                ),
                            ),

                            SizedBox(
                              width: 40,
                              child: Center(
                                child: Text(
                                  count.toString(),
                                  style: GoogleFonts.getFont(
                                    'Roboto',
                                    fontSize: 25,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),

                            Container(
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 255, 126, 45),
                                shape: BoxShape.circle,
                              ),
                              child:
                              IconButton(
                                icon: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 20,
                                ),
                                onPressed:increment,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    MyButton(text: "Add to Cart", onTap: addToCart),
                  ],
                ),
              ),
            ),
          )
        ],
      ) ,
    );
  }
}
