import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const MyButton({
    super.key,
    required this.text,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration:  BoxDecoration(
          color: const Color.fromARGB(255, 255, 126, 45),
          borderRadius: BorderRadius.circular(30),
        ),
        padding: EdgeInsets.all(20),
        child:  Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
            style: GoogleFonts.getFont('Rubik',
            fontSize: 20,
            //fontWeight: FontWeight.bold,
            color:  const Color.fromARGB(255, 255, 255, 255),
            )
            ),
            const SizedBox(width: 10),


            const Icon(
                Icons.arrow_forward,
                color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
