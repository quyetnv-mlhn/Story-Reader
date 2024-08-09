import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieLoadingWidget extends StatelessWidget {
  final String assetPath;
  final double? width;
  final double? height;
  final BoxFit fit;
  final String? loadingMessage;
  final TextStyle? messageStyle;
  final bool showMessage;
  final EdgeInsetsGeometry? padding;

  const LottieLoadingWidget({
    super.key,
    this.assetPath = 'assets/jsons/wave_loading.json',
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.loadingMessage,
    this.messageStyle,
    this.showMessage = true,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Padding(
        padding: padding ?? const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Lottie.asset(
              assetPath,
              width: width,
              height: height,
              fit: fit,
            ),
            if (showMessage) ...[
              const SizedBox(height: 16),
              Text(
                loadingMessage ?? 'Loading...',
                style: messageStyle ?? theme.textTheme.titleSmall,
                textAlign: TextAlign.center,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
