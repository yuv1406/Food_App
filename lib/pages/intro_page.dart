
import 'package:exercise/components/button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 106, 0),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 25,
            ),
            //shop name
            Text(
                "Shwarma King",
              style: GoogleFonts.getFont('Rubik',
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color:  Color.fromARGB(255, 255, 255, 255),
              ),

            ),

            const SizedBox(height: 25),
            //icon
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Image.asset('lib/images/shawarmaLogoY.png'),
            ),
            const SizedBox(height:25),
            
            //title
            Text(
              "Discover the Irresistible Flavors of Authentic Shwarmas",
              style: GoogleFonts.getFont(
                  'Signika',
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color:  Color.fromARGB(255, 255, 255, 255),
              ),
            ),

            const SizedBox(
              height: 8,
            ),

            //subtitle
            Text(
              "Explore Delicious Shwarmas,    Delivered to Your Doorstep!",
              style: GoogleFonts.getFont(
                'Roboto',
                fontSize: 20,
                //fontWeight: FontWeight.bold,
                color:  Color.fromARGB(255, 255, 255, 255),
              ),
            ),

            const SizedBox(height: 40),
            
            MyButton(
                text: "Get Started",
              onTap: () {
                Navigator.pushNamed(context, '/menupage');
              },
            )
            //get Started Button
          ],
        ),
      )
    );
  }
}
