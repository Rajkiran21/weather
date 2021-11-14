import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:stacked/stacked.dart';
import 'package:weather/helper.dart';
import 'package:weather/screens/login/login_view_model.dart';
import 'package:weather/screens/login/views/login_view.dart';
import 'package:weather/screens/login/views/search_view.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      builder: (context, model, child) {
        Widget body;
        switch (model.state) {
          case LoginState.LOGIN:
            body = const LoginView();
            break;
          case LoginState.SEARCH:
            body = const SearchView();
            break;
        }
        return model.isBusy
            ? const Center(child: CircularProgressIndicator())
            : Scaffold(
          appBar: model.state == LoginState.LOGIN
              ? null
              : AppBar(
            leading: Padding(
              padding: const EdgeInsets.all(8),
              child: ClipOval(
                child: Image.network(model.image),
              ),
            ),
                  title: Text(model.title),
            actions: [
              IconButton(onPressed: ()=>model.logout(), icon:const Icon(Icons.logout))
            ],
                ),
          body: Center(child: body),
        );
      },
      viewModelBuilder: () => LoginViewModel()..checkStatus(),
    );
  }
}
