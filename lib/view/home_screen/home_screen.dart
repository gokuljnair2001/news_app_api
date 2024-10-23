import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_api/controller/top_trending_controller.dart';
import 'package:news_app_api/view/news_details_screen/news_details_screen.dart';
import 'package:news_app_api/view/widgets/recomentation_widget.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        await context.read<TopTrendingController>().topTrending();
      },
    );
    super.initState();
  }

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

            ////////////////////////
            ////////////////////////
            ////////////////////////

            CarouselSlider.builder(
              itemCount: 5,
              itemBuilder: (context, index, realIndex) => Container(
                height: 250,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: CachedNetworkImage(
                  imageUrl: provWatch.newsArticle[index].urlToImage.toString(),
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(.4)),
                            child: Text(
                              provWatch.newsArticle[index].title.toString(),
                              style: GoogleFonts.alice(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Spacer(),
                          Text(
                            provWatch.newsArticle[index].description.toString(),
                            maxLines: 2,
                            style: GoogleFonts.aleo(
                                fontSize: 15, color: Colors.yellow),
                          ),
                        ],
                      ),
                    ),
                  ),
                  placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(
                      color: Colors.red,
                    ),
                  ),
                  errorWidget: (context, url, error) => Icon(
                    Icons.error,
                    color: Colors.red,
                    size: 90,
                  ),
                ),
              ),
              options: CarouselOptions(enlargeCenterPage: true, autoPlay: true),
            ),

            ////////////////////////
            ////////////////////////
            ////////////////////////

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
                  itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NewsDetailsScreen(
                                image: provWatch.newsArticle[index].urlToImage,
                                author: provWatch.newsArticle[index].author,
                                title: provWatch.newsArticle[index].title,
                                content: provWatch.newsArticle[index].content,
                              ),
                            ));
                      },
                      child: RecomentationWidget(
                        image:
                            provWatch.newsArticle[index].urlToImage.toString(),
                        category:
                            provWatch.newsArticle[index].author.toString(),
                        title: provWatch.newsArticle[index].title.toString(),
                      )),
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: provWatch.newsArticle.length),
            )
          ],
        ),
      ),
    );
  }
}
