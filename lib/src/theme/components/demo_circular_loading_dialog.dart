import 'package:flutter/material.dart';

class DemoCircularLoadingDialog {
  static Future<void> showLoadingDialog(
    BuildContext context,
    GlobalKey key,
  ) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: const DemoCircularLoadingDialogWidget(),
        );
      },
    );
  }
}

class DemoCircularLoadingDialogWidget extends StatelessWidget {
  const DemoCircularLoadingDialogWidget({
    super.key,
    this.isGreyBackground,
    this.background,
  });

  final bool? isGreyBackground;
  final Color? background;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: background ??
          (isGreyBackground == true
              ? Colors.black.withOpacity(0.3)
              : Colors.transparent),
      child: SimpleDialog(
        key: key,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        contentPadding: const EdgeInsets.all(0),
        insetPadding: const EdgeInsets.symmetric(horizontal: 128),
        titlePadding: const EdgeInsets.all(0),
        elevation: 0,
        children: const <Widget>[
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 24),
                CircularProgressIndicator(),
                SizedBox(height: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
