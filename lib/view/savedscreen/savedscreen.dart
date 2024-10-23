import 'package:flutter/material.dart';
import 'package:news_app_api/controller/hive_controller.dart';
import 'package:provider/provider.dart';

class Savedscreen extends StatefulWidget {
  Savedscreen({super.key});

  @override
  State<Savedscreen> createState() => _SavedscreenState();
}

class _SavedscreenState extends State<Savedscreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        context.read<HiveController>().showBookmark();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final hiveProvWatch = context.watch<HiveController>();
    final hiveProvRead = context.read<HiveController>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Saved News'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigates back to the previous screen
          },
        ),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) => Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(hiveProvWatch.savedList[index].urlToImage
                        .toString()), // News thumbnail image
                    SizedBox(height: 10),
                    Text(hiveProvWatch.savedList[index].title.toString(),
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(height: 5),
                    Text(hiveProvWatch.savedList[index].description.toString(),
                        maxLines: 2, overflow: TextOverflow.ellipsis),
                    SizedBox(height: 10),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            hiveProvRead.deleteBookmark(index);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
          separatorBuilder: (context, index) => Divider(),
          itemCount: hiveProvWatch.savedList.length),
    );
  }
}
