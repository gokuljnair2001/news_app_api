import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_api/controller/search_screen_controller.dart';
import 'package:news_app_api/view/widgets/recomentation_widget.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    final provWatch = context.watch<SearchScreenController>();
    final provRead = context.read<SearchScreenController>();

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'DISCOVER',
                style: GoogleFonts.sahitya(
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.w700),
              ),
              Text(
                'news from all around the world',
                style: GoogleFonts.mPlus1(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 15),
              TextField(
                controller: searchController,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                      onPressed: () {
                        provRead.onSearch(searchController.text);
                      },
                      icon: Icon(Icons.search)),
                  hintText: 'Search the news here ..',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.redAccent.withOpacity(0.1),
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: 30,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 6,
                  itemBuilder: (context, index) => Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Text(
                        'category',
                        style: GoogleFonts.roboto(
                            fontSize: 15, color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Builder(
                builder: (context) {
                  if (provWatch.isLoading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (provWatch.newsArticle.isEmpty) {
                    return Center(
                      child: Text('No Result Found'),
                    );
                  } else {
                    return Expanded(
                      child: ListView.separated(
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) => RecomentationWidget(
                                image: provWatch.newsArticle[index].urlToImage,
                                title: provWatch.newsArticle[index].title,
                              ),
                          separatorBuilder: (context, index) => Divider(),
                          itemCount: 10),
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
