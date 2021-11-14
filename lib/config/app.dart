import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:weather/screens/screens.dart';
import 'package:weather/services/services.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: Login,initial: true),
    MaterialRoute(page: Results),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: SharedPrefService),
    LazySingleton(classType: SnackbarService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: UtilsService),
    LazySingleton(classType: AuthService),
    LazySingleton(classType: ApiService),
  ],
)
class AppSetup {}
