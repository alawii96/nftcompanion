import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class HomeModel extends BaseViewModel {
  init() async {}
}

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeModel>.reactive(
      viewModelBuilder: () => HomeModel(),
      onModelReady: (model) => model.init(),
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Home"),
          ),
        );
      },
    );
  }
}
