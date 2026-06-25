import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'text/ui_text.dart';

/// Builds a label using [child] when provided, otherwise [UIText].
Widget buildUILabel(String text, {
  Widget? child,
  double? size,
  Color? color,
  FontWeight? fontWeight,
  TextStyle? style,
  int? maxLines,
  TextAlign? textAlign,
  TextOverflow? textOverflow,
  double? lineHeight,
  double? letterSpacing,
}) {
  return child ??
      UIText(
        text,
        size: size,
        color: color,
        fontWeight: fontWeight,
        style: style,
        maxLines: maxLines,
        textAlign: textAlign,
        textOverflow: textOverflow,
        lineHeight: lineHeight,
        letterSpacing: letterSpacing,
      );
}


/// Creates a [TextStyle] with common parameters.
TextStyle textStyle({
  required Color color,
  required FontWeight fontWeight,
  required double fontSize,
  TextStyle? base,
  TextDecoration? decoration,
  Color? decorationColor,
  double? decorationThickness,
}) {
  return (base ?? const TextStyle()).copyWith(
    color: color,
    fontSize: fontSize,
    fontWeight: fontWeight,
    decoration: decoration,
    decorationColor: decorationColor,
    decorationThickness: decorationThickness,
  );
}

/// Creates a [TextSpan] with optional tap handling.
TextSpan textSpan(String text,
    Color color,
    FontWeight fontWeight,
    double fontSize, {
      TextStyle? base,
      VoidCallback? onTap,
      TextDecoration? decoration,
    }) {
  return TextSpan(
    text: text,
    style: textStyle(
      color: color,
      fontWeight: fontWeight,
      fontSize: fontSize,
      base: base,
      decoration: decoration,
    ),
    recognizer: onTap == null
        ? null
        : (TapGestureRecognizer()
      ..onTap = onTap),
  );
}

/// Calculates the number of lines required to display [text] with [style]
/// within [maxWidth].
int getMaxLines(String text, TextStyle style, double maxWidth) {
  final span = TextSpan(text: text, style: style);
  final tp = TextPainter(text: span, textDirection: TextDirection.ltr);
  tp.layout(maxWidth: maxWidth);
  return tp
      .computeLineMetrics()
      .length;
}

/// Calculates the height required to display [text] within given constraints.
double getTextHeight(BuildContext context,
    String text,
    TextStyle style,
    double maxWidth,
    int? maxLines, {
      TextDirection? direction,
      double bufferSpacing = 5,
    }) {
  final span = TextSpan(text: text, style: style);
  final tp = TextPainter(
    text: span,
    textDirection: direction ?? Directionality.of(context),
    textScaler: MediaQuery.of(context).textScaler,
    maxLines: maxLines,
  );
  tp.layout(minWidth: 0, maxWidth: maxWidth);
  final lines = tp.computeLineMetrics().length;
  return tp.size.height +
      (lines * (style.fontSize! * (style.height ?? 1) - style.fontSize!)) +
      bufferSpacing;
}

/// Returns standard constraints
BoxConstraints getBoxConstraintsLoose(BuildContext context) {
  return BoxConstraints.loose(Size(MediaQuery.of(context).size.width / 2 - 50, 50));
}