import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:stacked_hooks/stacked_hooks.dart';
import 'package:weather/helper.dart';
import 'package:weather/screens/login/login_view_model.dart';

class LoginView extends HookViewModelWidget<LoginViewModel> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget buildViewModelWidget(BuildContext context, LoginViewModel model) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
            child: Text(
              'Welcome to WeatherApp',
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(color: Colors.blue),
            )),
        sVLarge,
        SignInButton(
          Buttons.Google,
          onPressed: () => model.handelSignIn(),
        )
      ],
    );
  }
}
