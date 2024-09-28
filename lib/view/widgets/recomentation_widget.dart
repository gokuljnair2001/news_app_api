import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RecomentationWidget extends StatelessWidget {
  const RecomentationWidget({
    super.key,
    this.image,
    this.category,
    this.title,
  });

  final String? image;
  final String? category;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 100,
          width: 150,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ9-foehy4LB0rywbjC8XLwnA29wFW9Q3oE4Q&s'))),
        ),
        SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'sports',
              style: GoogleFonts.ubuntu(fontSize: 15),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              width: 200,
              child: Text(
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                'Bottom Navigation Bar is a navigation component displaying three to five destinations at the bottom of a screen.',
                style: GoogleFonts.ubuntu(
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w500),
              ),
            )
          ],
        )
      ],
    );
  }
}
