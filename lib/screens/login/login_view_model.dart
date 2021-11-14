import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:weather/config/app.router.dart';
import 'package:weather/constants.dart';
import 'package:weather/customBaseViewModel.dart';
import 'package:weather/models/weather_response_model.dart';

enum LoginState { LOGIN, SEARCH }

class LoginViewModel extends CustomBaseViewModel {
  final Dio _dio = Dio();
  bool inProgress = false;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  late LoginState _status = LoginState.LOGIN;
  LoginState get state => _status;
  late String uid;
  late String email;
  late String name;
  late String image;
  String title = '';

  setProgress(val) {
    inProgress = val;
    notifyListeners();
  }

  checkStatus() {
    setBusy(true);
    String? id = _firebaseAuth.currentUser?.uid;
    if (id != null) {
      setData();
      changeView(view: LoginState.SEARCH);
    }
    setBusy(false);
  }

  changeView({required LoginState view}) {
    _status = view;
    notifyListeners();
  }

  Future<bool> isLoggedIn() async {
    bool isLogedIn = await _googleSignIn.isSignedIn();
    return isLogedIn;
  }

  Future<void> handelSignIn() async {
    setBusy(true);
    GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    if (googleUser != null) {
      GoogleSignInAuthentication? googleAuth = await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
      User? firebaseUser =
          (await _firebaseAuth.signInWithCredential(credential)).user;
      if (firebaseUser != null) {
        setData();
        pref.insertStringData(key: kUid, value: uid);
        pref.insertStringData(key: kEmail, value: email);
        pref.insertStringData(key: kName, value: name);
        pref.insertStringData(key: kImage, value: image);
        utilsService.showErrorSnackBar(msg: 'Login Success');
        changeView(view: LoginState.SEARCH);
      } else {
        utilsService.showErrorSnackBar(msg: 'Something went wrong');
      }
    } else {
      utilsService.showErrorSnackBar(msg: 'Authentication Cancelled');
    }
    setBusy(false);
  }

  void setData() async {
    User firebaseUser = _firebaseAuth.currentUser!;
    uid = firebaseUser.uid;
    email = firebaseUser.email ?? '';
    name = firebaseUser.displayName ?? '';
    image = firebaseUser.photoURL ?? '';
    title = email.substring(0, email.indexOf("@"));
  }

  logout() async {
    await _firebaseAuth.signOut();
    pref.clearData();
    changeView(view: LoginState.LOGIN);
  }

  getWeather({required String val}) async {
    setProgress(true);
    dynamic data = await _dio.get(
        'https://api.weatherapi.com/v1/current.json?key=$kWeatherApi&q=$val');
    WeatherResponseModel model = WeatherResponseModel.fromJson(jsonDecode(data.toString()));
    setProgress(false);
    navService.navigateTo(Routes.results,
        arguments: ResultsArguments(modelRes: model));
  }
}
