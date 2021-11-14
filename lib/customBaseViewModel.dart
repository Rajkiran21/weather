import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:weather/config/app.locator.dart';
import 'package:weather/services/services.dart';

class CustomBaseViewModel extends BaseViewModel {
  NavigationService navService = locator<NavigationService>();
  SharedPrefService pref=locator<SharedPrefService>();
  UtilsService utilsService = locator<UtilsService>();
}
