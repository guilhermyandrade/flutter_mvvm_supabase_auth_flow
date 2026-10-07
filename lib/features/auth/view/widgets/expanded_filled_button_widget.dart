
import 'package:flutter/material.dart';

class ExpandedFilledButtonWidget extends StatelessWidget {

  final Function onPressed;
  final Widget child;
  final Color? color;
  final double? height;
  final bool isActive;

  const ExpandedFilledButtonWidget({
    super.key,
    required this.onPressed,
    required this.child,
    this.color,
    this.height,
    this.isActive = true
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData appTheme = Theme.of(context);
    return FilledButton(
      onPressed: () {
        if (isActive) {
          onPressed();
        }
      },
      style: appTheme.filledButtonTheme.style!.copyWith(
          minimumSize: .all(Size(double.infinity, height ?? 60)),
          shape: .all(
            RoundedRectangleBorder(borderRadius: .circular(12)),
          ),
          backgroundColor: isActive ?
            (color != null ? .all(color) : null) :
            .all(Colors.grey)
      ),
      child: child,
    );
  }
}
