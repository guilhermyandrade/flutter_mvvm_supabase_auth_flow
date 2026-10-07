import 'package:flutter/material.dart';

class AppPalette extends ThemeExtension<AppPalette> {

  final Color themeColor;
  final Color scaffoldBackgroundColor;

  final Color onSurfaceColor;
  final Color onSurfaceLightColor;
  final Color onSurfaceDarkColor;

  final Color successColor;
  final Color successColorLight;
  final Color successColorDark;

  final Color errorColor;
  final Color errorColorLight;
  final Color errorColorDark;

  const AppPalette({
    required this.themeColor,
    required this.scaffoldBackgroundColor,
    required this.onSurfaceColor,
    required this.onSurfaceLightColor,
    required this.onSurfaceDarkColor,
    required this.successColor,
    required this.successColorLight,
    required this.successColorDark,
    required this.errorColor,
    required this.errorColorLight,
    required this.errorColorDark
  });

  @override
  AppPalette copyWith({
    Color? themeColor,
    Color? scaffoldBackgroundColor,
    Color? onSurfaceColor,
    Color? onSurfaceLightColor,
    Color? onSurfaceDarkColor,
    Color? successColor,
    Color? successColorLight,
    Color? successColorDark,
    Color? errorColor,
    Color? errorColorLight,
    Color? errorColorDark
  }) {
    return AppPalette(
      themeColor: themeColor ?? this.themeColor,
      scaffoldBackgroundColor: scaffoldBackgroundColor ?? this.scaffoldBackgroundColor,
      onSurfaceColor: onSurfaceColor ?? this.onSurfaceColor,
      onSurfaceLightColor: onSurfaceLightColor ?? this.onSurfaceLightColor,
      onSurfaceDarkColor: onSurfaceDarkColor ?? this.onSurfaceDarkColor,
      successColor: successColor ?? this.successColor,
      successColorLight: successColorLight ?? this.successColorLight,
      successColorDark: successColorDark ?? this.successColorDark,
      errorColor: errorColor ?? this.errorColor,
      errorColorLight: errorColorLight ?? this.errorColorLight,
      errorColorDark: errorColorDark ?? this.errorColorDark,
    );
  }

  @override
  AppPalette lerp(ThemeExtension<AppPalette>? other, double t) {
    if (other is! AppPalette) return this;
    return AppPalette(
      themeColor: Color.lerp(themeColor, other.themeColor, t) ?? themeColor,
      scaffoldBackgroundColor: Color.lerp(scaffoldBackgroundColor, other.scaffoldBackgroundColor, t) ?? scaffoldBackgroundColor,
      onSurfaceColor: Color.lerp(onSurfaceColor, other.onSurfaceColor, t) ?? onSurfaceColor,
      onSurfaceLightColor: Color.lerp(onSurfaceLightColor, other.onSurfaceLightColor, t) ?? onSurfaceLightColor,
      onSurfaceDarkColor: Color.lerp(onSurfaceDarkColor, other.onSurfaceDarkColor, t) ?? onSurfaceDarkColor,
      successColor: Color.lerp(successColor, other.successColor, t) ?? successColor,
      successColorLight: Color.lerp(successColorLight, other.successColorLight, t) ?? successColorLight,
      successColorDark: Color.lerp(successColorDark, other.successColorDark, t) ?? successColorDark,
      errorColor: Color.lerp(errorColor, other.errorColor, t) ?? errorColor,
      errorColorLight: Color.lerp(errorColorLight, other.errorColorLight, t) ?? errorColorLight,
      errorColorDark: Color.lerp(errorColorDark, other.errorColorDark, t) ?? errorColorDark,
    );
  }
}
