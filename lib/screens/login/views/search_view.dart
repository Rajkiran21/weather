import 'package:flutter/material.dart';
import 'package:stacked_hooks/stacked_hooks.dart';
import 'package:weather/screens/login/login_view_model.dart';

class SearchView extends HookViewModelWidget<LoginViewModel> {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget buildViewModelWidget(BuildContext context, LoginViewModel model) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 4,horizontal: 8),
          child: TextField(
            decoration: const InputDecoration(
              hintText: 'Ex: London'
            ),
            onSubmitted: (val)=>model.getWeather(val:val),
            textInputAction: TextInputAction.search,
          ),
        ),
        model.inProgress?const LinearProgressIndicator():const SizedBox.shrink()
      ],
    );
  }
}
