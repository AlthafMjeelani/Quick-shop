import 'package:ecommerse/screens/home/view/screen_search_delegate.dart';
import 'package:flutter/material.dart';

class Delegate {
static  Future<void> showSearchfn(context) async {
    await showSearch(
      context: context,
      delegate: TheSearch(),
      query: '',
    );
  }
}