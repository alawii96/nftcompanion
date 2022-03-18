import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:new_nftalbum/calculator.dart';
import 'package:new_nftalbum/collection_view.dart';
import 'package:new_nftalbum/floorPrice.dart';
import 'package:new_nftalbum/home.dart';
import 'package:new_nftalbum/lasttrades.dart';
import 'package:new_nftalbum/metadata.dart';
import 'package:new_nftalbum/profile.dart';
import 'package:stacked/stacked.dart';

void main() => runApp(const MyApp());

class MyAppModel extends BaseViewModel {
  int currentPageIndex = 0;

  List<Widget> pages = [
    const HomeView(),
    const ProfitCalculator(),
    const ProfileView(),
  ];

  changeIndex(int i) {
    currentPageIndex = i;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: ViewModelBuilder<MyAppModel>.reactive(
        viewModelBuilder: () => MyAppModel(),
        builder: (context, model, child) => Scaffold(
          body: Container(
            child: model.pages[model.currentPageIndex],
          ),
          // ignore: prefer_const_literals_to_create_immutables
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: model.currentPageIndex,
              onTap: (i) => model.changeIndex(i),
              items: [
                const BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: "Home",
                ),
                const BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: "Collection",
                ),
                const BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: "Profile",
                ),
              ]),
        ),
      ),
    );
  }
}
