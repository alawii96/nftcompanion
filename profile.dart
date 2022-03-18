import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:new_nftalbum/model/opensea_single.dart';
import 'package:new_nftalbum/model/profile_moralis.dart';
import 'package:stacked/stacked.dart';

import 'ref.dart';

import 'package:http/http.dart' as http;

class ProfileModel extends BaseViewModel {
  ProfileMoralis profile = ProfileMoralis.empty();

  List<String> profileImages = [];

  init() async {
    fetchUserNFTs("0x2e52aa31F6f617691a5e0A7A387a450C362B6cc8");
  }

  fetchUserNFTs(String address) async {
    var test = await http.get(
        Uri.parse(
            'https://deep-index.moralis.io/api/v2/$address/nft?chain=eth&format=decimal'),
        headers: requestHeaders);

    profile = ProfileMoralis.fromJson(jsonDecode(test.body));

    notifyListeners();
  }

  Future<String> getNFTToken(String contract, String id) async {
    var test = await http.get(
      Uri.parse(
          'https://api.opensea.io/api/v1/asset/$contract/$id/?include_orders=false'),
    );

    var a = OpenSeaSingleAsset.fromJson(jsonDecode(test.body));
    print(a.imageUrl.toString());
    return a.imageUrl.toString();

    profileImages.add(a.imagePreviewUrl.toString());
  }
}

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileModel>.reactive(
      viewModelBuilder: () => ProfileModel(),
      onModelReady: (model) => model.init(),
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Profile"),
          ),
          body: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Center(
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.yellow),
                    ),
                  ),
                  model.profile.total == 0
                      ? Container()
                      : ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: model.profile.result!.length,
                          itemBuilder: (context, index) {
                            var nft = model.profile.result![index];
                            return ListTile(
                              onTap: () async {
                                String value = await model.getNFTToken(
                                    nft.tokenAddress.toString(),
                                    nft.tokenId.toString());

                                print(value);
                              },
                              // leading:
                              //     Image.network(model.profileImages[index]),
                              title: Text(
                                nft.name.toString(),
                              ),
                            );
                          })
                ]),
          ),
        );
      },
    );
  }
}
