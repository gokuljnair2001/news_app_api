import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_api/view/widgets/recomentation_widget.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CircleAvatar(
          backgroundColor: Colors.grey.withOpacity(.4),
          radius: 15,
          child: Icon(
            Icons.menu,
            color: Colors.black,
          ),
        ),
        actions: [
          CircleAvatar(
            backgroundColor: Colors.grey.withOpacity(.4),
            radius: 15,
            child: Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
          SizedBox(width: 10),
          CircleAvatar(
            backgroundColor: Colors.grey.withOpacity(.4),
            radius: 15,
            child: Icon(
              Icons.notifications,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 15),
            Row(
              children: [
                Text(
                  'Breaking News',
                  style: GoogleFonts.rubik(
                      fontSize: 22,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
                Spacer(),
                Text(
                  'View all',
                  style: GoogleFonts.rubik(
                      fontSize: 17,
                      color: Colors.blue,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            SizedBox(height: 15),
            CarouselSlider.builder(
              itemCount: 5,
              itemBuilder: (context, index, realIndex) => Container(
                height: 250,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQGrytE-p8E8udHcmAhyL3TkXdx6uirlcn1tQ&s'))),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Trending news',
                        style: GoogleFonts.alice(
                            fontSize: 10,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                      Spacer(),
                      Text(
                        'Alaxander Wear Modified Helmet in Cycle race',
                        style:
                            GoogleFonts.aleo(fontSize: 15, color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
              options: CarouselOptions(enlargeCenterPage: true, autoPlay: true),
            ),
            SizedBox(height: 18),
            Row(
              children: [
                Text(
                  'Recommentation',
                  style: GoogleFonts.rubik(
                      fontSize: 22,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
                Spacer(),
                Text(
                  'view all',
                  style: GoogleFonts.rubik(
                      fontSize: 13,
                      color: Colors.blue,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            SizedBox(height: 15),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) => RecomentationWidget(),
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: 6),
            )
          ],
        ),
      ),
    );
  }
}
