import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../components/button.dart';
import '../models/SHOP.dart';
import '../models/food.dart';
class CartPage extends StatelessWidget {
  const CartPage({super.key});

  void removeFromcart(Food food,BuildContext context){
    final shop = context.read<Shop>();
    shop.removeFromcart(food);
  }

  @override
  Widget build(BuildContext context) {
    return  Consumer<Shop> (
        builder:(context, value,child)=> Scaffold(
          backgroundColor:   Colors.white,
          appBar: AppBar(
            foregroundColor: Colors.black87,
            title: Text(
              'My Cart',
              style: GoogleFonts.getFont(
                'Rubik',
                fontWeight: FontWeight.w500,
                fontSize: 25,

              ),
            ),
            backgroundColor:  Colors.white,
            centerTitle: true,
            elevation: 0,
          ),
          body:
          Column(
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: value.cart.length,
                    itemBuilder: (context, index){
                    final Food food = value.cart[index];
                    final String foodName = food.name;
                    final String foodPrice = food.price;

                    return Container(
                      decoration:  BoxDecoration(
                        color: const Color.fromARGB(255, 255, 126, 45),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      margin: const EdgeInsets.only(left: 16, top: 16, right: 16),
                      child: ListTile(
                        title: Text(
                          foodName,
                          style: GoogleFonts.getFont(
                            'Rubik',
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        subtitle: Text(
                            "₹ $foodPrice",
                        style: GoogleFonts.getFont(
                        'Rubik',
                          fontWeight: FontWeight.w500,
                          //fontSize: 12,
                          color: Colors.white70,
                        )),
                        trailing: IconButton(
                          icon: const Icon(
                              Icons.delete,
                            color: Colors.white70,
                          ),
                          onPressed: ()=> removeFromcart(food,context),
                        ) ,
                      ),
                    );

                }),
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: MyButton(
                  text: "Pay now",
                  onTap: (){},
                ),
              )
            ],
          ),
        )
    );
  }
}
