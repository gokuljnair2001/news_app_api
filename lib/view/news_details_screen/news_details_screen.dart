import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:news_app_api/controller/details_screen_controller.dart';
import 'package:news_app_api/controller/hive_controller.dart';
import 'package:news_app_api/main.dart';
import 'package:news_app_api/model/bookmark_model.dart';
import 'package:news_app_api/view/savedscreen/savedscreen.dart';
import 'package:provider/provider.dart';

class NewsDetailsScreen extends StatelessWidget {
  NewsDetailsScreen(
      {super.key, this.author, this.image, this.content, this.title});
  String? image;
  String? author;
  String? content;
  String? title;

  @override
  Widget build(BuildContext context) {



    final provWatch = context.watch<DetailsScreenController>();
    final provhiveWatch = context.watch<HiveController>();
    final provREad = context.read<DetailsScreenController>();
    return SafeArea(
      child: Scaffold(
        ///////////////////////////////

        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () async {
                await provhiveWatch.saveBookmark(BookmarkModel(
                    author: author, title: title, urlToImage: image));

                context.read<DetailsScreenController>().onSaved();
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => Savedscreen(),
                //     ));
              },
              icon: provWatch.isSaved
                  ? Icon(Icons.bookmark_outline, color: Colors.black)
                  : Icon(
                      Icons.bookmark,
                      color: Colors.blue,
                    ),
            )
          ],
        ),

/////////////////////////////

        extendBodyBehindAppBar: true,
        body: ListView(
          children: [
            Container(
              height: 350,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    image!,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 35,
                      width: 85,
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          'Category',
                          style: GoogleFonts.roboto(
                            fontSize: 15,
                            color: Colors.yellowAccent,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      title!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.rubik(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.redAccent, width: 1),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundImage: NetworkImage(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ7G68v5q8_bnvktC_ppU9TmEj1OxtNXtHlVzt4JW0CE4Uw6WTDR3tkKbb3vTi3oD5WCgQ&usqp=CAU'),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        author!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.rubik(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    maxLines: 30,
                    content!,
                    textAlign: TextAlign.justify,
                    style: GoogleFonts.k2d(
                      fontSize: 21,
                      letterSpacing: -1,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
