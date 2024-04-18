import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:word_game/common/loading_widget.dart';

import '../constants/colors.dart';

@immutable
class LoadingScreenController {
  final VoidCallback close;
  final VoidCallback update;

  const LoadingScreenController({
    required this.close,
    required this.update,
  });
}

class LoadingScreen {
  static final _instance = LoadingScreen._();

  factory LoadingScreen() => _instance;

  LoadingScreen._();

  LoadingScreenController? controller;

  bool get isShowing => controller != null;

  void show({required BuildContext context, String? message}) {
    controller ??= _showOverlay(context: context, message: message)..update();
  }

  void hide() {
    controller?.close();
    controller = null;
  }

  LoadingScreenController _showOverlay({
    required BuildContext context,
    String? message,
  }) {
    final state = Overlay.of(context, rootOverlay: true);

    final overlay = OverlayEntry(
      builder: (context) {
        return Material(
          color: darkBlue.withOpacity(.4),
          child: Center(
            child: Container(
              constraints: BoxConstraints(
                maxWidth: 100.r,
                maxHeight: 100.r,
                minWidth: 100.r,
                minHeight: 100.r,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: Colors.white,
              ),
              child: Padding(
                padding: EdgeInsets.all(16.r),
                child: const LoadingWidget(),
              ),
            ),
          ),
        );
      },
    );

    return LoadingScreenController(
      close: overlay.remove,
      update: () => state.insert(overlay),
    );
  }
}
