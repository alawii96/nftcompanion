import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:new_nftalbum/metadata.dart';
import 'package:stacked/stacked.dart';
import 'package:http/http.dart' as http;

import 'floorPrice.dart';
import 'lasttrades.dart';

class CollectionModel extends BaseViewModel {
  String collection_contract = "";
  List<Result> trades = [];
  init(String contract) async {
    collection_contract = contract;

    fetchMetaData();
    fetchFloorPrice();
    fetchTrades();

    notifyListeners();
  }

  Map<String, String> requestHeaders = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    'X-API-Key':
        'eWLQl3Jy8Xi8f2gGAc24xsB7VplGFXXZRhOK8UOQYYY67pZVKRtBnxv38BInEgoA'
  };

  fetchMetaData() async {
    var test = await http.get(
        Uri.parse(
            'https://deep-index.moralis.io/api/v2/nft/$collection_contract/metadata?chain=eth'),
        headers: requestHeaders);

    var m = NFTMetaData.fromJson(jsonDecode(test.body));
  }

  fetchFloorPrice() async {
    var test = await http.get(
        Uri.parse(
            'https://deep-index.moralis.io/api/v2/nft/$collection_contract/lowestprice?chain=eth&marketplace=opensea'),
        headers: requestHeaders);

    var m = FloorPrice.fromJson(jsonDecode(test.body));

    print("floor: " + m.price.toString());
  }

  fetchTrades() async {
    print(DateTime.now().toString());
    var test = await http.get(
        Uri.parse(
            'https://deep-index.moralis.io/api/v2/nft/$collection_contract/trades?chain=eth&from_date=2022-03-18T00%3A00%3A00.000Z&marketplace=opensea&limit=10'),
        headers: requestHeaders);

    trades = LastTrades.fromJson(jsonDecode(test.body)).result!;

    notifyListeners();
  }
}

class CollectionView extends StatelessWidget {
  final String contract;

  const CollectionView({Key? key, required this.contract}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CollectionModel>.reactive(
      viewModelBuilder: () => CollectionModel(),
      onModelReady: (model) => model.init(contract),
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Collection"),
          ),
          body: ListView.builder(
              itemCount: model.trades.length,
              itemBuilder: (context, index) {
                return ListTile(
                  // leading: Image.network(src),
                  title: Text(model.trades[index].tokenIds
                      .toString()
                      .replaceAllMapped('[', (match) => "")
                      .replaceAllMapped(']', (match) => "")),
                  subtitle: Text(model.trades[index].blockTimestamp!.hour
                          .toString() +
                      ":" +
                      model.trades[index].blockTimestamp!.minute.toString()),
                );
              }),
        );
      },
    );
  }
}
