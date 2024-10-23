import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:news_app_api/model/bookmark_model.dart';

class HiveController with ChangeNotifier {
  List<BookmarkModel> savedList = [];
  var box = Hive.box<BookmarkModel>('SavedBox');
  saveBookmark(BookmarkModel bookmarkdata) async {
    await box.add(bookmarkdata);
    log(box.values.toString());
  }

  showBookmark() {
 savedList= box.values.toList();
 notifyListeners();
 log(savedList[0].title.toString());
  }

    
  deleteBookmark(int index) async {
    await box.deleteAt(index); 
    showBookmark(); 
    log('$index deleted.');
  }
}
