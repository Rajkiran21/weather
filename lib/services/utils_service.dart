
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:weather/config/app.locator.dart';
import 'package:weather/helper.dart';

enum SnackBarType { error, info }
enum DialogType { alert, loading }

class UtilsService{
  final SnackbarService _snackBar = locator<SnackbarService>();
  final DialogService _dialogService = locator<DialogService>();

  UtilsService() {
    _setupSnackBarUi();
    _setupDialogUi();
  }
  void _setupDialogUi() {
    final builders = {
      DialogType.alert: (context, sheetRequest, completer) =>
          _BasicDialog(request: sheetRequest, completer: completer),
    };

    _dialogService.registerCustomDialogBuilders(builders);
  }

  showSnackBar(String title, {msg}) {
    _snackBar.showSnackbar(
      message: msg,
      title: title,
      duration: const Duration(seconds: 5),
      onTap: (_) {
      },
      mainButtonTitle: '',
      onMainButtonTapped: () => {},
    );
  }
  showErrorSnackBar({title, required msg, Function? onTap, buttonTitle}) {
    _snackBar.showCustomSnackBar(
      variant: SnackBarType.error,
      message: msg,
      title: title,
      duration: const Duration(seconds: 5),
      onTap: (_) {
        if (onTap != null) {
          onTap();
        }
      },
      mainButtonTitle: buttonTitle ?? "",
      onMainButtonTapped: () => {},
    );
  }

  showInfoSnackBar({title, required msg, Function? onTap, buttonTitle}) {
    _snackBar.showCustomSnackBar(
      variant: SnackBarType.info,
      message: msg,
      title: title,
      duration: const Duration(seconds: 5),
      onTap: (_) {
        if (onTap != null) {
          onTap();
        }
      },
      mainButtonTitle: buttonTitle ?? "",
      onMainButtonTapped: () => {},
    );
  }

  void _setupSnackBarUi() {
    _snackBar.registerSnackbarConfig(
      SnackbarConfig(
        backgroundColor: Colors.blue,
        textColor: Colors.white,
        borderRadius: 0,
        margin: EdgeInsets.zero,
      ),
    );
    _snackBar.registerCustomSnackbarConfig(
      variant: SnackBarType.info,
      config: SnackbarConfig(
        backgroundColor: Colors.blue,
        titleColor: Colors.white,
        messageColor: Colors.white,
        borderRadius: 1,
      ),
    );
    _snackBar.registerCustomSnackbarConfig(
      variant: SnackBarType.error,
      config: SnackbarConfig(
        backgroundColor: Colors.red,
        titleColor: Colors.white,
        messageColor: Colors.white,
        borderRadius: 1,
      ),
    );
  }
}
class _BasicDialog extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;
  const _BasicDialog({Key? key, required this.request, required this.completer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.only(
          top: 32,
          left: 16,
          right: 16,
          bottom: 12,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: Colors.white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            sVSmall,
            Text(
              request.title ?? '',
              textAlign: TextAlign.center,
            ),
            sVSmall,
            Text(
              request.description ?? '',
              textAlign: TextAlign.center,
            ),
            sVMedium,
          ],
        ),
      ),
    );
  }


}
