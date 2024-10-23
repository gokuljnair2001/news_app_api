import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_api/controller/top_trending_controller.dart';
import 'package:provider/provider.dart';

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
      final provRead = context.read<TopTrendingController>();
    final provWatch = context.watch<TopTrendingController>();
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
                      image!))),
        ),
        SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              category!,
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
                title!,
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
