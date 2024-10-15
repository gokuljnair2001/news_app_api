import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_api/controller/top_trending_controller.dart';
import 'package:news_app_api/view/widgets/recomentation_widget.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provRead = context.read<TopTrendingController>();
    final provWatch = context.watch<TopTrendingController>();

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
                            'https://t3.ftcdn.net/jpg/03/27/55/60/360_F_327556002_99c7QmZmwocLwF7ywQ68ChZaBry1DbtD.jpg'))), //image
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'hiiiiiiiiii',
                        style: GoogleFonts.alice(
                            fontSize: 10,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                      Spacer(),
                      Text(
                        'qwertyuio asdfghjkl zxcvbnm,',
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
